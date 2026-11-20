#include "pdf_engine.hpp"

#include <cstring>
#include <fcntl.h>
#include <jpeglib.h>
#include <map>
#include <memory>
#include <qpdf/Constants.h>
#include <qpdf/Pl_Count.hh>
#include <qpdf/Pl_DCT.hh>
#include <qpdf/Pl_Discard.hh>
#include <qpdf/QPDF.hh>
#include <qpdf/QPDFExc.hh>
#include <qpdf/QPDFObjectHandle.hh>
#include <qpdf/QPDFPageDocumentHelper.hh>
#include <qpdf/QPDFPageObjectHelper.hh>
#include <qpdf/QPDFWriter.hh>
#include <string>
#include <sys/stat.h>
#include <unistd.h>
#include <vector>

namespace aidanscanpdf {

namespace {

struct ScopedFd {
    int fd = -1;
    explicit ScopedFd(int f) : fd(f) {}
    ~ScopedFd() {
        if (fd >= 0) {
            close(fd);
            fd = -1;
        }
    }
    ScopedFd(const ScopedFd &) = delete;
    ScopedFd &operator=(const ScopedFd &) = delete;
    ScopedFd(ScopedFd &&other) noexcept : fd(other.fd) { other.fd = -1; }
    ScopedFd &operator=(ScopedFd &&other) noexcept {
        if (this != &other) {
            if (fd >= 0)
                close(fd);
            fd = other.fd;
            other.fd = -1;
        }
        return *this;
    }
};

FILE *openFdStream(int fd, const char *mode) {
    int d = dup(fd);
    if (d < 0) {
        return nullptr;
    }
    lseek(d, 0, SEEK_SET);
    FILE *f = fdopen(d, mode);
    if (!f) {
        close(d);
        return nullptr;
    }
    return f;
}

bool isValidUtf8Password(const std::string &str) {
    if (str.empty() || str.length() > 127) {
        return false;
    }
    const auto *bytes = reinterpret_cast<const unsigned char *>(str.data());
    size_t len = str.length();
    size_t i = 0;
    while (i < len) {
        unsigned char c = bytes[i];
        if (c == 0) {
            return false;
        }
        if (c <= 0x7F) {
            i++;
        } else if ((c & 0xE0) == 0xC0) {
            if (i + 1 >= len)
                return false;
            if ((bytes[i + 1] & 0xC0) != 0x80)
                return false;
            if (c < 0xC2)
                return false; // overlong
            i += 2;
        } else if ((c & 0xF0) == 0xE0) {
            if (i + 2 >= len)
                return false;
            if ((bytes[i + 1] & 0xC0) != 0x80 || (bytes[i + 2] & 0xC0) != 0x80)
                return false;
            if (c == 0xE0 && bytes[i + 1] < 0xA0)
                return false; // overlong
            if (c == 0xED && bytes[i + 1] >= 0xA0)
                return false; // surrogate D800-DFFF
            i += 3;
        } else if ((c & 0xF8) == 0xF0) {
            if (i + 3 >= len)
                return false;
            if ((bytes[i + 1] & 0xC0) != 0x80 || (bytes[i + 2] & 0xC0) != 0x80 ||
                (bytes[i + 3] & 0xC0) != 0x80)
                return false;
            if (c == 0xF0 && bytes[i + 1] < 0x90)
                return false; // overlong
            if (c > 0xF4 || (c == 0xF4 && bytes[i + 1] > 0x8F))
                return false; // > 10FFFF
            i += 4;
        } else {
            return false;
        }
    }
    return true;
}

bool hasSignatures(QPDF &pdf) {
    QPDFObjectHandle root = pdf.getRoot();
    if (root.hasKey("/DocMDP"))
        return true;
    if (root.hasKey("/Perms")) {
        QPDFObjectHandle perms = root.getKey("/Perms");
        if (perms.isDictionary() &&
            (perms.hasKey("/DocMDP") || perms.hasKey("/UR") || perms.hasKey("/UR3"))) {
            return true;
        }
    }
    for (const auto &obj : pdf.getAllObjects()) {
        if (obj.isDictionary()) {
            if (obj.hasKey("/ByteRange"))
                return true;
            if (obj.hasKey("/Type") && obj.getKey("/Type").isName() &&
                obj.getKey("/Type").getName() == "/Sig") {
                return true;
            }
        }
    }
    return false;
}

bool isEligibleImage(QPDFObjectHandle &imageObj, JDIMENSION &outW, JDIMENSION &outH,
                     int &outComponents, J_COLOR_SPACE &outCs) {
    if (!imageObj.isStream())
        return false;
    QPDFObjectHandle dict = imageObj.getDict();

    if (!dict.hasKey("/Subtype") || dict.getKey("/Subtype").getName() != "/Image") {
        return false;
    }

    QPDFObjectHandle wObj = dict.getKey("/Width");
    QPDFObjectHandle hObj = dict.getKey("/Height");
    if (!wObj.isInteger() || !hObj.isInteger())
        return false;
    long long wVal = wObj.getIntValue();
    long long hVal = hObj.getIntValue();
    if (wVal <= 0 || hVal <= 0)
        return false;
    outW = static_cast<JDIMENSION>(wVal);
    outH = static_cast<JDIMENSION>(hVal);

    QPDFObjectHandle bpcObj = dict.getKey("/BitsPerComponent");
    if (!bpcObj.isInteger() || bpcObj.getIntValue() != 8)
        return false;

    QPDFObjectHandle csObj = dict.getKey("/ColorSpace");
    if (!csObj.isName())
        return false;
    std::string csName = csObj.getName();
    if (csName == "/DeviceRGB") {
        outComponents = 3;
        outCs = JCS_RGB;
    } else if (csName == "/DeviceGray") {
        outComponents = 1;
        outCs = JCS_GRAYSCALE;
    } else {
        return false;
    }

    if (dict.hasKey("/Mask") || dict.hasKey("/SMask"))
        return false;
    if (dict.hasKey("/ImageMask") && dict.getKey("/ImageMask").getBoolValue())
        return false;

    if (dict.hasKey("/Decode")) {
        QPDFObjectHandle decode = dict.getKey("/Decode");
        if (decode.isArray()) {
            std::vector<QPDFObjectHandle> arr = decode.getArrayAsVector();
            if (outCs == JCS_GRAYSCALE) {
                if (arr.size() != 2 || arr[0].getNumericValue() != 0.0 ||
                    arr[1].getNumericValue() != 1.0) {
                    return false;
                }
            } else if (outCs == JCS_RGB) {
                if (arr.size() != 6 || arr[0].getNumericValue() != 0.0 ||
                    arr[1].getNumericValue() != 1.0 || arr[2].getNumericValue() != 0.0 ||
                    arr[3].getNumericValue() != 1.0 || arr[4].getNumericValue() != 0.0 ||
                    arr[5].getNumericValue() != 1.0) {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    if (dict.hasKey("/DecodeParms") && !dict.getKey("/DecodeParms").isNull()) {
        return false;
    }

    if (dict.hasKey("/Filter")) {
        QPDFObjectHandle filter = dict.getKey("/Filter");
        if (filter.isName()) {
            std::string fn = filter.getName();
            if (fn != "/FlateDecode" && fn != "/DCTDecode")
                return false;
        } else if (filter.isArray()) {
            std::vector<QPDFObjectHandle> fArr = filter.getArrayAsVector();
            if (fArr.size() != 1)
                return false;
            if (!fArr[0].isName())
                return false;
            std::string fn = fArr[0].getName();
            if (fn != "/FlateDecode" && fn != "/DCTDecode")
                return false;
        } else {
            return false;
        }
    }

    return true;
}

class ImageCompressProvider : public QPDFObjectHandle::StreamDataProvider {
public:
    ImageCompressProvider(QPDFObjectHandle srcImage, JDIMENSION w, JDIMENSION h, int components,
                          J_COLOR_SPACE cs, int quality)
        : srcImage(srcImage), w(w), h(h), components(components), cs(cs), quality(quality) {}

    void provideStreamData(QPDFObjGen const &, Pipeline *pipeline) override {
        auto config = Pl_DCT::make_compress_config(
            [this](jpeg_compress_struct *cinfo) { jpeg_set_quality(cinfo, this->quality, FALSE); });
        Pl_DCT dct("dct", pipeline, w, h, components, cs, config.get());
        srcImage.pipeStreamData(&dct, 0, qpdf_dl_all, false, false);
    }

private:
    QPDFObjectHandle srcImage;
    JDIMENSION w;
    JDIMENSION h;
    int components;
    J_COLOR_SPACE cs;
    int quality;
};

} // namespace

int transform(int inputFd, int outputFd, int operation, int compressionLevel,
              const std::string &password, std::function<void(int)> progressCb,
              TransformResult &result) {
    result.status = ENGINE_FAILURE;
    result.pageCount = 0;
    result.outputBytes = 0;
    result.encrypted = false;

    if (inputFd < 0 || outputFd < 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    if (operation != COMPRESS && operation != PROTECT && operation != UNPROTECT) {
        result.status = ENGINE_FAILURE;
        return ENGINE_FAILURE;
    }

    ScopedFd inGuard(dup(inputFd));
    if (inGuard.fd < 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }
    ScopedFd outGuard(dup(outputFd));
    if (outGuard.fd < 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    struct stat stIn;
    if (fstat(inGuard.fd, &stIn) != 0 || stIn.st_size <= 0) {
        result.status = INVALID_PDF;
        return INVALID_PDF;
    }
    struct stat stOutInit;
    if (fstat(outGuard.fd, &stOutInit) != 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    if (inGuard.fd == outGuard.fd ||
        (stIn.st_dev == stOutInit.st_dev && stIn.st_ino == stOutInit.st_ino)) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    lseek(inGuard.fd, 0, SEEK_SET);
    lseek(outGuard.fd, 0, SEEK_SET);
    if (ftruncate(outGuard.fd, 0) != 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    try {
        if (progressCb)
            progressCb(5);

        QPDF srcPdf;
        srcPdf.setAttemptRecovery(false);

        char const *openPassword = nullptr;
        if ((operation == UNPROTECT || operation == COMPRESS) && !password.empty()) {
            openPassword = password.c_str();
        }

        FILE *inStream = openFdStream(inGuard.fd, "rb");
        if (!inStream) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }
        try {
            srcPdf.processFile("input_pdf", inStream, true, openPassword);
        } catch (const QPDFExc &e) {
            if (e.getErrorCode() == qpdf_e_password) {
                if (operation == PROTECT) {
                    result.status = INVALID_PDF;
                    return INVALID_PDF;
                } else {
                    result.status = password.empty() ? PASSWORD_REQUIRED : WRONG_PASSWORD;
                    return result.status;
                }
            } else if (e.getErrorCode() == qpdf_e_damaged_pdf) {
                result.status = INVALID_PDF;
                return INVALID_PDF;
            } else if (e.getErrorCode() == qpdf_e_unsupported) {
                result.status = UNSUPPORTED_PDF;
                return UNSUPPORTED_PDF;
            } else if (e.getErrorCode() == qpdf_e_system) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            throw;
        }

        if (srcPdf.anyWarnings()) {
            result.status = INVALID_PDF;
            return INVALID_PDF;
        }

        if (hasSignatures(srcPdf)) {
            result.status = UNSUPPORTED_PDF;
            return UNSUPPORTED_PDF;
        }

        auto srcPages = srcPdf.getAllPages();
        if (srcPages.empty()) {
            result.status = INVALID_PDF;
            return INVALID_PDF;
        }

        bool const wasEncrypted = srcPdf.isEncrypted();
        if (operation == COMPRESS) {
            if (wasEncrypted) {
                if (password.empty()) {
                    result.status = PASSWORD_REQUIRED;
                    return PASSWORD_REQUIRED;
                }
                if (!srcPdf.userPasswordMatched() && !srcPdf.ownerPasswordMatched()) {
                    result.status = WRONG_PASSWORD;
                    return WRONG_PASSWORD;
                }
                if (!isValidUtf8Password(password)) {
                    result.status = INVALID_PDF;
                    return INVALID_PDF;
                }
            }
            if (compressionLevel != HIGH && compressionLevel != LOW) {
                result.status = ENGINE_FAILURE;
                return ENGINE_FAILURE;
            }

            if (progressCb)
                progressCb(15);

            QPDF outPdf;
            outPdf.setAttemptRecovery(false);
            FILE *inStream2 = openFdStream(inGuard.fd, "rb");
            if (!inStream2) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            outPdf.processFile("compress_input_pdf", inStream2, true, openPassword);

            std::map<QPDFObjGen, bool> replacedObjs;
            int replacedCount = 0;

            auto outPages = outPdf.getAllPages();
            int totalPages = static_cast<int>(outPages.size());

            for (int pIdx = 0; pIdx < totalPages; ++pIdx) {
                QPDFPageObjectHelper ph(outPages[static_cast<size_t>(pIdx)]);
                ph.forEachImage(true, [&](QPDFObjectHandle &outObj, QPDFObjectHandle & /*xobjDict*/,
                                          const std::string & /*key*/) {
                    QPDFObjGen og = outObj.getObjGen();
                    if (replacedObjs.count(og) > 0)
                        return;
                    replacedObjs[og] = true;

                    QPDFObjectHandle srcObj = srcPdf.getObject(og);
                    JDIMENSION w = 0, h = 0;
                    int components = 0;
                    J_COLOR_SPACE cs = JCS_UNKNOWN;
                    if (!isEligibleImage(srcObj, w, h, components, cs)) {
                        return;
                    }

                    // Determine original raw compressed stream size
                    auto rawBuf = srcObj.getRawStreamData();
                    size_t origSize = rawBuf ? rawBuf->getSize() : 0;
                    if (origSize == 0) {
                        QPDFObjectHandle lenObj = srcObj.getDict().getKey("/Length");
                        if (lenObj.isInteger()) {
                            origSize = static_cast<size_t>(lenObj.getIntValue());
                        }
                    }
                    if (origSize == 0)
                        return;

                    // Trial compression with adaptive quality ladder
                    int bestQuality = 0;
                    std::vector<int> candidateQualities;
                    if (compressionLevel == HIGH) {
                        candidateQualities = {50, 40, 35, 30, 25};
                    } else {
                        candidateQualities = {75, 65, 50, 40, 35};
                    }

                    for (int q : candidateQualities) {
                        Pl_Discard discard;
                        Pl_Count counter("count", &discard);
                        auto testConfig =
                            Pl_DCT::make_compress_config([q](jpeg_compress_struct *cinfo) {
                                jpeg_set_quality(cinfo, q, FALSE);
                            });
                        Pl_DCT dct("dct", &counter, w, h, components, cs, testConfig.get());
                        if (!srcObj.pipeStreamData(&dct, 0, qpdf_dl_all, false, false)) {
                            break;
                        }

                        size_t candidateSize = static_cast<size_t>(counter.getCount());
                        // Take the highest quality that achieves meaningful savings
                        if (candidateSize < static_cast<size_t>(origSize * 0.98)) {
                            bestQuality = q;
                            break;
                        }
                    }

                    if (bestQuality > 0) {
                        auto provider = std::make_shared<ImageCompressProvider>(
                            srcObj, w, h, components, cs, bestQuality);
                        outObj.replaceStreamData(provider, QPDFObjectHandle::parse("/DCTDecode"),
                                                 QPDFObjectHandle::newNull());
                        replacedCount++;
                    }
                });

                if (progressCb) {
                    int percent = 15 + (55 * (pIdx + 1) / totalPages);
                    progressCb(percent);
                }
            }

            FILE *outStream = openFdStream(outGuard.fd, "wb+");
            if (!outStream) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            QPDFWriter writer(outPdf, "output_pdf", outStream, true);
            writer.setDecodeLevel(qpdf_dl_none);
            writer.setCompressStreams(false);
            if (wasEncrypted) {
                writer.setR6EncryptionParameters(password.c_str(), password.c_str(),
                                                 true,          // allow_accessibility
                                                 true,          // allow_extract
                                                 true,          // allow_assemble
                                                 true,          // allow_annotate_and_form
                                                 true,          // allow_form_filling
                                                 true,          // allow_modify_other
                                                 qpdf_r3p_full, // print
                                                 true           // encrypt_metadata_aes
                );
            }
            writer.write();

            if (progressCb)
                progressCb(80);

            struct stat stOut;
            if (fstat(outGuard.fd, &stOut) != 0) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            if (stOut.st_size >= stIn.st_size) {
                result.status = NO_SAVINGS;
                result.pageCount = totalPages;
                result.outputBytes = stOut.st_size;
                result.encrypted = wasEncrypted;
                return NO_SAVINGS;
            }

        } else if (operation == PROTECT) {
            if (srcPdf.isEncrypted()) {
                result.status = INVALID_PDF;
                return INVALID_PDF;
            }

            if (!isValidUtf8Password(password)) {
                result.status = INVALID_PDF;
                return INVALID_PDF;
            }

            if (progressCb)
                progressCb(30);

            FILE *outStream = openFdStream(outGuard.fd, "wb+");
            if (!outStream) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            QPDFWriter writer(srcPdf, "output_pdf", outStream, true);
            writer.setR6EncryptionParameters(password.c_str(), password.c_str(),
                                             true,          // allow_accessibility
                                             true,          // allow_extract
                                             true,          // allow_assemble
                                             true,          // allow_annotate_and_form
                                             true,          // allow_form_filling
                                             true,          // allow_modify_other
                                             qpdf_r3p_full, // print
                                             true           // encrypt_metadata_aes
            );
            writer.write();

            if (progressCb)
                progressCb(75);

        } else if (operation == UNPROTECT) {
            if (!srcPdf.isEncrypted()) {
                result.status = ALREADY_UNPROTECTED;
                return ALREADY_UNPROTECTED;
            }

            if (!srcPdf.userPasswordMatched() && !srcPdf.ownerPasswordMatched()) {
                result.status = password.empty() ? PASSWORD_REQUIRED : WRONG_PASSWORD;
                return result.status;
            }

            if (progressCb)
                progressCb(30);

            FILE *outStream = openFdStream(outGuard.fd, "wb+");
            if (!outStream) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            QPDFWriter writer(srcPdf, "output_pdf", outStream, true);
            writer.setPreserveEncryption(false);
            writer.write();

            if (progressCb)
                progressCb(75);
        }

        // Post-transform Validation
        if (progressCb)
            progressCb(85);

        fsync(outGuard.fd);
        lseek(outGuard.fd, 0, SEEK_SET);

        struct stat stVal;
        if (fstat(outGuard.fd, &stVal) != 0 || stVal.st_size <= 0) {
            result.status = ENGINE_FAILURE;
            return ENGINE_FAILURE;
        }

        QPDF valPdf;
        valPdf.setAttemptRecovery(false);

        if (operation == PROTECT || (operation == COMPRESS && wasEncrypted)) {
            bool emptyRejected = false;
            try {
                QPDF testEmpty;
                testEmpty.setAttemptRecovery(false);
                FILE *fEmpty = openFdStream(outGuard.fd, "rb");
                if (!fEmpty) {
                    result.status = IO_ERROR;
                    return IO_ERROR;
                }
                testEmpty.processFile("val_empty", fEmpty, true, "");
            } catch (const QPDFExc &e) {
                if (e.getErrorCode() == qpdf_e_password) {
                    emptyRejected = true;
                }
            }
            if (!emptyRejected) {
                result.status = ENGINE_FAILURE;
                return ENGINE_FAILURE;
            }

            bool wrongRejected = false;
            std::string wrongPassword = password;
            if (wrongPassword.empty()) {
                wrongPassword = "wrong_password";
            } else {
                // Modify the first byte so it differs within the 127-byte R6 password limit
                wrongPassword[0] ^= 0x01;
            }
            try {
                QPDF testWrong;
                testWrong.setAttemptRecovery(false);
                FILE *fWrong = openFdStream(outGuard.fd, "rb");
                if (!fWrong) {
                    result.status = IO_ERROR;
                    return IO_ERROR;
                }
                testWrong.processFile("val_wrong", fWrong, true, wrongPassword.c_str());
            } catch (const QPDFExc &e) {
                if (e.getErrorCode() == qpdf_e_password) {
                    wrongRejected = true;
                }
            }
            if (!wrongRejected) {
                result.status = ENGINE_FAILURE;
                return ENGINE_FAILURE;
            }

            FILE *fVal = openFdStream(outGuard.fd, "rb");
            if (!fVal) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            valPdf.processFile("val_correct", fVal, true, password.c_str());
            if (!valPdf.isEncrypted() ||
                (!valPdf.userPasswordMatched() && !valPdf.ownerPasswordMatched())) {
                result.status = ENGINE_FAILURE;
                return ENGINE_FAILURE;
            }
        } else {
            FILE *fVal = openFdStream(outGuard.fd, "rb");
            if (!fVal) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            valPdf.processFile("val_unprotect", fVal, true, "");
            if (valPdf.isEncrypted()) {
                result.status = ENGINE_FAILURE;
                return ENGINE_FAILURE;
            }
        }

        if (valPdf.anyWarnings()) {
            result.status = ENGINE_FAILURE;
            return ENGINE_FAILURE;
        }

        auto valPages = valPdf.getAllPages();
        if (valPages.size() != srcPages.size()) {
            result.status = ENGINE_FAILURE;
            return ENGINE_FAILURE;
        }

        for (size_t i = 0; i < srcPages.size(); ++i) {
            QPDFPageObjectHelper srcPh(srcPages[i]);
            QPDFPageObjectHelper valPh(valPages[i]);
            if (srcPh.getMediaBox().unparse() != valPh.getMediaBox().unparse() ||
                srcPh.getCropBox().unparse() != valPh.getCropBox().unparse() ||
                srcPh.getAttribute("/Rotate", false).unparse() !=
                    valPh.getAttribute("/Rotate", false).unparse()) {
                result.status = ENGINE_FAILURE;
                return ENGINE_FAILURE;
            }
        }

        for (auto obj : valPdf.getAllObjects()) {
            if (obj.isStream()) {
                auto raw = obj.getRawStreamData();
                if (!raw) {
                    result.status = ENGINE_FAILURE;
                    return ENGINE_FAILURE;
                }
            }
        }

        result.status = OK;
        result.pageCount = static_cast<int>(valPages.size());
        result.outputBytes = stVal.st_size;
        result.encrypted = valPdf.isEncrypted();

        if (progressCb)
            progressCb(100);
        return OK;

    } catch (const QPDFExc &e) {
        if (e.getErrorCode() == qpdf_e_password) {
            result.status = password.empty() ? PASSWORD_REQUIRED : WRONG_PASSWORD;
        } else if (e.getErrorCode() == qpdf_e_unsupported) {
            result.status = UNSUPPORTED_PDF;
        } else if (e.getErrorCode() == qpdf_e_damaged_pdf) {
            result.status = INVALID_PDF;
        } else if (e.getErrorCode() == qpdf_e_system) {
            result.status = IO_ERROR;
        } else {
            result.status = ENGINE_FAILURE;
        }
        return result.status;
    } catch (const std::system_error &) {
        result.status = IO_ERROR;
        return IO_ERROR;
    } catch (const std::exception &) {
        result.status = ENGINE_FAILURE;
        return ENGINE_FAILURE;
    } catch (...) {
        result.status = ENGINE_FAILURE;
        return ENGINE_FAILURE;
    }
}

int combine(const int *inputFds, size_t inputCount, const std::vector<std::string> &passwords,
            int outputFd, std::function<void(int)> progressCb, TransformResult &result) {
    result.status = ENGINE_FAILURE;
    result.pageCount = 0;
    result.outputBytes = 0;
    result.encrypted = false;

    if (!inputFds || inputCount < 2 || outputFd < 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    ScopedFd outGuard(dup(outputFd));
    if (outGuard.fd < 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    struct stat stOutInit;
    if (fstat(outGuard.fd, &stOutInit) != 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    std::vector<ScopedFd> inGuards;
    inGuards.reserve(inputCount);
    for (size_t i = 0; i < inputCount; ++i) {
        if (inputFds[i] < 0) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }
        int d = dup(inputFds[i]);
        if (d < 0) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }
        inGuards.emplace_back(d);

        struct stat stIn;
        if (fstat(d, &stIn) != 0 || stIn.st_size <= 0) {
            result.status = INVALID_PDF;
            return INVALID_PDF;
        }

        if (d == outGuard.fd ||
            (stIn.st_dev == stOutInit.st_dev && stIn.st_ino == stOutInit.st_ino)) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }
    }

    lseek(outGuard.fd, 0, SEEK_SET);
    if (ftruncate(outGuard.fd, 0) != 0) {
        result.status = IO_ERROR;
        return IO_ERROR;
    }

    try {
        if (progressCb)
            progressCb(5);

        QPDF destPdf;
        destPdf.emptyPDF();
        QPDFPageDocumentHelper destHelper(destPdf);

        std::vector<std::unique_ptr<QPDF>> srcPdfs;
        srcPdfs.reserve(inputCount);

        int totalPages = 0;
        for (size_t i = 0; i < inputCount; ++i) {
            auto srcPdf = std::make_unique<QPDF>();
            srcPdf->setAttemptRecovery(false);

            lseek(inGuards[i].fd, 0, SEEK_SET);
            FILE *inStream = openFdStream(inGuards[i].fd, "rb");
            if (!inStream) {
                result.status = IO_ERROR;
                return IO_ERROR;
            }
            const char *pw = nullptr;
            if (i < passwords.size() && !passwords[i].empty()) {
                pw = passwords[i].c_str();
            }

            try {
                srcPdf->processFile(("input_" + std::to_string(i)).c_str(), inStream, true, pw);
            } catch (const QPDFExc &e) {
                if (e.getErrorCode() == qpdf_e_password) {
                    result.status =
                        (pw == nullptr || *pw == '\0') ? PASSWORD_REQUIRED : WRONG_PASSWORD;
                    result.pageCount = static_cast<int>(i);
                    return result.status;
                }
                result.status = INVALID_PDF;
                return INVALID_PDF;
            }

            if (srcPdf->isEncrypted()) {
                if (!srcPdf->userPasswordMatched() && !srcPdf->ownerPasswordMatched()) {
                    result.status =
                        (pw == nullptr || *pw == '\0') ? PASSWORD_REQUIRED : WRONG_PASSWORD;
                    result.pageCount = static_cast<int>(i);
                    return result.status;
                }
            }

            if (hasSignatures(*srcPdf)) {
                result.status = UNSUPPORTED_PDF;
                return UNSUPPORTED_PDF;
            }

            QPDFPageDocumentHelper srcHelper(*srcPdf);
            std::vector<QPDFPageObjectHelper> pages = srcHelper.getAllPages();
            for (auto &page : pages) {
                destHelper.addPage(page, false);
                totalPages++;
            }

            srcPdfs.push_back(std::move(srcPdf));

            if (progressCb) {
                int p = static_cast<int>(5 + (80.0 * (i + 1) / inputCount));
                progressCb(p);
            }
        }

        if (totalPages == 0) {
            result.status = INVALID_PDF;
            return INVALID_PDF;
        }

        FILE *outStream = openFdStream(outGuard.fd, "wb");
        if (!outStream) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }

        QPDFWriter writer(destPdf, "output_pdf", outStream, true);
        writer.setLinearization(false);
        writer.setPreserveEncryption(false);
        writer.setStreamDataMode(qpdf_s_preserve);
        writer.write();

        fsync(outGuard.fd);

        if (progressCb)
            progressCb(95);

        lseek(outGuard.fd, 0, SEEK_SET);
        FILE *validateStream = openFdStream(outGuard.fd, "rb");
        if (!validateStream) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }

        QPDF valPdf;
        valPdf.setAttemptRecovery(false);
        valPdf.processFile("validate_output", validateStream, true, nullptr);
        QPDFPageDocumentHelper valHelper(valPdf);
        int valPageCount = static_cast<int>(valHelper.getAllPages().size());
        if (valPageCount != totalPages) {
            result.status = ENGINE_FAILURE;
            return ENGINE_FAILURE;
        }

        struct stat stOut;
        if (fstat(outGuard.fd, &stOut) != 0 || stOut.st_size <= 0) {
            result.status = IO_ERROR;
            return IO_ERROR;
        }

        result.status = OK;
        result.pageCount = totalPages;
        result.outputBytes = stOut.st_size;
        result.encrypted = false;

        if (progressCb)
            progressCb(100);
        return OK;

    } catch (const QPDFExc &e) {
        if (e.getErrorCode() == qpdf_e_password) {
            result.status = PASSWORD_REQUIRED;
        } else if (e.getErrorCode() == qpdf_e_unsupported) {
            result.status = UNSUPPORTED_PDF;
        } else if (e.getErrorCode() == qpdf_e_damaged_pdf) {
            result.status = INVALID_PDF;
        } else if (e.getErrorCode() == qpdf_e_system) {
            result.status = IO_ERROR;
        } else {
            result.status = ENGINE_FAILURE;
        }
        return result.status;
    } catch (const std::system_error &) {
        result.status = IO_ERROR;
        return IO_ERROR;
    } catch (const std::exception &) {
        result.status = ENGINE_FAILURE;
        return ENGINE_FAILURE;
    } catch (...) {
        result.status = ENGINE_FAILURE;
        return ENGINE_FAILURE;
    }
}

} // namespace aidanscanpdf
