#ifdef NDEBUG
#undef NDEBUG
#endif
#include "pdf_engine.hpp"

#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <filesystem>
#include <iostream>
#include <memory>
#include <qpdf/QPDF.hh>
#include <qpdf/QPDFExc.hh>
#include <qpdf/QPDFPageDocumentHelper.hh>
#include <qpdf/QPDFPageObjectHelper.hh>
#include <qpdf/QPDFWriter.hh>
#include <string>
#include <sys/stat.h>
#include <unistd.h>
#include <vector>

using namespace aidanscanpdf;

namespace {

bool toolExists(const std::string &tool) {
    std::string cmd = "which " + tool + " > /dev/null 2>&1";
    return (std::system(cmd.c_str()) == 0);
}

bool runCmd(const std::string &cmd, std::string *output = nullptr) {
    FILE *pipe = popen(cmd.c_str(), "r");
    if (!pipe)
        return false;
    char buffer[512];
    while (fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        if (output)
            *output += buffer;
    }
    int status = pclose(pipe);
    return (status == 0);
}

void createSyntheticPdf(const std::string &path, int pageCount, int imgW, int imgH,
                        bool compressImage) {
    QPDF qpdf;
    qpdf.emptyPDF();

    // Create an RGB image
    std::vector<uint8_t> rgb(static_cast<size_t>(imgW * imgH * 3));
    for (int y = 0; y < imgH; ++y) {
        for (int x = 0; x < imgW; ++x) {
            size_t idx = static_cast<size_t>((y * imgW + x) * 3);
            rgb[idx] = static_cast<uint8_t>((x * 255) / imgW);
            rgb[idx + 1] = static_cast<uint8_t>((y * 255) / imgH);
            rgb[idx + 2] = static_cast<uint8_t>(((x + y) * 128) / (imgW + imgH));
        }
    }

    QPDFObjectHandle imageDict = QPDFObjectHandle::newDictionary();
    imageDict.replaceKey("/Type", QPDFObjectHandle::newName("/XObject"));
    imageDict.replaceKey("/Subtype", QPDFObjectHandle::newName("/Image"));
    imageDict.replaceKey("/Width", QPDFObjectHandle::newInteger(imgW));
    imageDict.replaceKey("/Height", QPDFObjectHandle::newInteger(imgH));
    imageDict.replaceKey("/BitsPerComponent", QPDFObjectHandle::newInteger(8));
    imageDict.replaceKey("/ColorSpace", QPDFObjectHandle::newName("/DeviceRGB"));

    QPDFObjectHandle imgStream = qpdf.newStream();
    imgStream.replaceDict(imageDict);

    auto buf = std::make_shared<Buffer>(rgb.data(), rgb.size());
    if (compressImage) {
        // Leave uncompressed or Flate
        imgStream.replaceStreamData(buf, QPDFObjectHandle::parse("/FlateDecode"),
                                    QPDFObjectHandle::newNull());
    } else {
        // Raw uncompressed stream data
        imgStream.replaceStreamData(buf, QPDFObjectHandle::newNull(), QPDFObjectHandle::newNull());
    }

    QPDFObjectHandle fontDict = QPDFObjectHandle::newDictionary();
    fontDict.replaceKey("/Type", QPDFObjectHandle::newName("/Font"));
    fontDict.replaceKey("/Subtype", QPDFObjectHandle::newName("/Type1"));
    fontDict.replaceKey("/BaseFont", QPDFObjectHandle::newName("/Helvetica"));

    QPDFObjectHandle fonts = QPDFObjectHandle::newDictionary();
    fonts.replaceKey("/F1", fontDict);

    QPDFObjectHandle xobjs = QPDFObjectHandle::newDictionary();
    xobjs.replaceKey("/Im0", imgStream);

    QPDFObjectHandle resDict = QPDFObjectHandle::newDictionary();
    resDict.replaceKey("/Font", fonts);
    resDict.replaceKey("/XObject", xobjs);

    for (int p = 1; p <= pageCount; ++p) {
        std::string contentStr =
            "BT /F1 16 Tf 50 720 Td (Adobe Scan Hardening Page " + std::to_string(p) +
            ") Tj ET\n"
            "BT /F1 12 Tf 50 690 Td (Searchable OCR and Document Text Verification) Tj ET\n"
            "q 250 0 0 250 50 400 cm /Im0 Do Q\n";
        auto contentStream = qpdf.newStream(contentStr);

        QPDFObjectHandle pageDict = QPDFObjectHandle::newDictionary();
        pageDict.replaceKey("/Type", QPDFObjectHandle::newName("/Page"));
        pageDict.replaceKey("/MediaBox", QPDFObjectHandle::parse("[0 0 612 792]"));
        pageDict.replaceKey("/Contents", contentStream);
        pageDict.replaceKey("/Resources", resDict);

        qpdf.addPage(pageDict, false);
    }

    QPDFWriter writer(qpdf, path.c_str());
    writer.write();
}

void createTinyImagePdf(const std::string &path) {
    // 2x2 image with already DCT or Flate where DCT recompression cannot beat size
    QPDF qpdf;
    qpdf.emptyPDF();

    uint8_t rgb[12] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120};
    QPDFObjectHandle imageDict = QPDFObjectHandle::newDictionary();
    imageDict.replaceKey("/Type", QPDFObjectHandle::newName("/XObject"));
    imageDict.replaceKey("/Subtype", QPDFObjectHandle::newName("/Image"));
    imageDict.replaceKey("/Width", QPDFObjectHandle::newInteger(2));
    imageDict.replaceKey("/Height", QPDFObjectHandle::newInteger(2));
    imageDict.replaceKey("/BitsPerComponent", QPDFObjectHandle::newInteger(8));
    imageDict.replaceKey("/ColorSpace", QPDFObjectHandle::newName("/DeviceRGB"));

    QPDFObjectHandle imgStream = qpdf.newStream();
    imgStream.replaceDict(imageDict);
    auto buf = std::make_shared<Buffer>(rgb, sizeof(rgb));
    imgStream.replaceStreamData(buf, QPDFObjectHandle::newNull(), QPDFObjectHandle::newNull());
    QPDFObjectHandle xobjs = QPDFObjectHandle::newDictionary();
    xobjs.replaceKey("/Im0", imgStream);

    QPDFObjectHandle resDict = QPDFObjectHandle::newDictionary();
    resDict.replaceKey("/XObject", xobjs);

    QPDFObjectHandle pageDict = QPDFObjectHandle::newDictionary();
    pageDict.replaceKey("/Type", QPDFObjectHandle::newName("/Page"));
    pageDict.replaceKey("/MediaBox", QPDFObjectHandle::parse("[0 0 200 200]"));
    pageDict.replaceKey("/Contents", qpdf.newStream("q 2 0 0 2 10 10 cm /Im0 Do Q\n"));
    pageDict.replaceKey("/Resources", resDict);

    qpdf.addPage(pageDict, false);
    QPDFWriter writer(qpdf, path.c_str());
    writer.setCompressStreams(true);
    writer.write();
}
void createDistinguishablePdf(const std::string &path, int pageCount, const std::string &prefix,
                              int rotation) {
    QPDF qpdf;
    qpdf.emptyPDF();

    QPDFObjectHandle fontDict = QPDFObjectHandle::newDictionary();
    fontDict.replaceKey("/Type", QPDFObjectHandle::newName("/Font"));
    fontDict.replaceKey("/Subtype", QPDFObjectHandle::newName("/Type1"));
    fontDict.replaceKey("/BaseFont", QPDFObjectHandle::newName("/Helvetica"));

    QPDFObjectHandle fonts = QPDFObjectHandle::newDictionary();
    fonts.replaceKey("/F1", fontDict);
    QPDFObjectHandle resDict = QPDFObjectHandle::newDictionary();
    resDict.replaceKey("/Font", fonts);

    for (int p = 1; p <= pageCount; ++p) {
        std::string contentStr =
            "BT /F1 16 Tf 50 720 Td (" + prefix + " Page " + std::to_string(p) + ") Tj ET\n";
        auto contentStream = qpdf.newStream(contentStr);

        QPDFObjectHandle pageDict = QPDFObjectHandle::newDictionary();
        pageDict.replaceKey("/Type", QPDFObjectHandle::newName("/Page"));
        pageDict.replaceKey("/MediaBox", QPDFObjectHandle::parse("[0 0 612 792]"));
        pageDict.replaceKey("/Contents", contentStream);
        pageDict.replaceKey("/Resources", resDict);
        if (rotation != 0) {
            pageDict.replaceKey("/Rotate", QPDFObjectHandle::newInteger(rotation));
        }
        qpdf.addPage(pageDict, false);
    }

    QPDFWriter writer(qpdf, path.c_str());
    writer.write();
}

} // namespace

int main() {
    std::cout << "========================================" << std::endl;
    std::cout << "Starting Adobe Scan PDF Native Engine Tests" << std::endl;
    std::cout << "========================================" << std::endl;

    char tmpl[] = "/tmp/adobescan_pdf_test_XXXXXX";
    char *createdDir = mkdtemp(tmpl);
    assert(createdDir != nullptr && "Failed to create secure temporary directory");
    std::string testDir = createdDir;

    struct TempDirCleaner {
        std::string dir;
        ~TempDirCleaner() {
            if (!dir.empty()) {
                std::error_code ec;
                std::filesystem::remove_all(dir, ec);
            }
        }
    } cleaner{testDir};

    bool requireExternalTools = (std::getenv("AIDAN_REQUIRE_EXTERNAL_TOOLS") != nullptr);
    if (requireExternalTools) {
        assert(toolExists("pdfinfo") &&
               "pdfinfo is required when AIDAN_REQUIRE_EXTERNAL_TOOLS is set");
        assert(toolExists("pdftotext") &&
               "pdftotext is required when AIDAN_REQUIRE_EXTERNAL_TOOLS is set");
    }

    std::string multiPagePdf = testDir + "/multipage_input.pdf";
    createSyntheticPdf(multiPagePdf, 3, 120, 120, false);
    std::cout << "[PASS] Created 3-page synthetic test PDF: " << multiPagePdf << std::endl;

    struct stat stOrig;
    stat(multiPagePdf.c_str(), &stOrig);
    long long origSize = stOrig.st_size;
    std::cout << "Original PDF size: " << origSize << " bytes" << std::endl;

    // ------------------------------------------------------------------------
    // TEST 1: PROTECT with AES-256 R6 (ASCII password)
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 1: PROTECT with AES-256 R6 ---" << std::endl;
    std::string protectedPdf = testDir + "/protected.pdf";
    {
        int inFd = open(multiPagePdf.c_str(), O_RDONLY);
        int outFd = open(protectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        assert(inFd >= 0 && outFd >= 0);

        std::vector<int> progressValues;
        auto progressCb = [&](int p) { progressValues.push_back(p); };

        TransformResult res;
        int status = transform(inFd, outFd, PROTECT, 0, "ScanSecret2026!", progressCb, res);
        close(inFd);
        close(outFd);

        assert(status == OK);
        assert(res.status == OK);
        assert(res.encrypted == true);
        assert(res.pageCount == 3);
        assert(res.outputBytes > 0);
        assert(!progressValues.empty() && progressValues.back() == 100);

        // Verify with QPDF: empty password fails
        bool emptyFailed = false;
        try {
            QPDF qEmpty;
            qEmpty.setAttemptRecovery(false);
            qEmpty.processFile(protectedPdf.c_str(), "");
        } catch (const QPDFExc &e) {
            if (e.getErrorCode() == qpdf_e_password)
                emptyFailed = true;
        }
        assert(emptyFailed);

        // Verify with QPDF: wrong password fails
        bool wrongFailed = false;
        try {
            QPDF qWrong;
            qWrong.setAttemptRecovery(false);
            qWrong.processFile(protectedPdf.c_str(), "BadPassword");
        } catch (const QPDFExc &e) {
            if (e.getErrorCode() == qpdf_e_password)
                wrongFailed = true;
        }
        assert(wrongFailed);

        // Verify with QPDF: correct password succeeds
        QPDF qCorrect;
        qCorrect.setAttemptRecovery(false);
        qCorrect.processFile(protectedPdf.c_str(), "ScanSecret2026!");
        assert(qCorrect.isEncrypted());
        assert(qCorrect.userPasswordMatched());
        assert(qCorrect.ownerPasswordMatched());
        assert(qCorrect.getAllPages().size() == 3);

        std::cout << "[PASS] PROTECT produced conforming AES-256 R6 document." << std::endl;

        // Independent tool verification
        if (toolExists("pdfinfo")) {
            std::string out;
            // Without password, must fail or reject
            bool okWithoutPw = runCmd("pdfinfo " + protectedPdf + " 2>&1", &out);
            assert(!okWithoutPw || out.find("Incorrect password") != std::string::npos);

            // With password, must succeed and confirm AES-256
            out.clear();
            bool okWithPw = runCmd("pdfinfo -upw 'ScanSecret2026!' " + protectedPdf, &out);
            assert(okWithPw);
            assert(out.find("Encrypted:       yes") != std::string::npos);
            assert(out.find("AES-256") != std::string::npos);
            std::cout << "[PASS] pdfinfo confirmed AES-256 encryption." << std::endl;
        }
        if (toolExists("pdftotext")) {
            std::string out;
            // Without password, must fail
            bool okWithoutPw = runCmd("pdftotext " + protectedPdf + " - 2>/dev/null", &out);
            assert(!okWithoutPw);

            out.clear();
            bool ok = runCmd("pdftotext -upw 'ScanSecret2026!' " + protectedPdf + " -", &out);
            assert(ok);
            assert(out.find("Adobe Scan Hardening Page 1") != std::string::npos);
            assert(out.find("Searchable OCR and Document Text Verification") != std::string::npos);
            std::cout << "[PASS] pdftotext successfully decrypted text with supplied password."
                      << std::endl;
        }
        if (toolExists("mutool")) {
            bool okWithoutPw = runCmd("mutool info " + protectedPdf + " 2>/dev/null");
            assert(!okWithoutPw);
            bool ok = runCmd("mutool info -p 'ScanSecret2026!' " + protectedPdf);
            assert(ok);
            std::cout << "[PASS] mutool info validated protected document." << std::endl;
        }
    }

    // ------------------------------------------------------------------------
    // TEST 2: PROTECT with UTF-8 Unicode password
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 2: PROTECT with Unicode UTF-8 password ---" << std::endl;
    std::string unicodeProtectedPdf = testDir + "/unicode_protected.pdf";
    std::string unicodePw = "Pässwørd🔑2026";
    {
        int inFd = open(multiPagePdf.c_str(), O_RDONLY);
        int outFd = open(unicodeProtectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        assert(inFd >= 0 && outFd >= 0);

        TransformResult res;
        int status = transform(inFd, outFd, PROTECT, 0, unicodePw, nullptr, res);
        close(inFd);
        close(outFd);

        assert(status == OK);
        assert(res.encrypted == true);

        QPDF qCheck;
        qCheck.setAttemptRecovery(false);
        qCheck.processFile(unicodeProtectedPdf.c_str(), unicodePw.c_str());
        assert(qCheck.isEncrypted());
        assert(qCheck.userPasswordMatched());
        std::cout << "[PASS] Unicode UTF-8 password protection verified." << std::endl;

        if (toolExists("pdftotext")) {
            std::string out;
            bool ok =
                runCmd("pdftotext -upw '" + unicodePw + "' " + unicodeProtectedPdf + " -", &out);
            assert(ok);
            assert(out.find("Adobe Scan Hardening Page 2") != std::string::npos);
            std::cout << "[PASS] pdftotext read Unicode-protected PDF." << std::endl;
        }
    }

    // ------------------------------------------------------------------------
    // TEST 3: UNPROTECT
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 3: UNPROTECT ---" << std::endl;
    std::string unprotectedPdf = testDir + "/unprotected.pdf";
    {
        // 3a. Test wrong password returns WRONG_PASSWORD
        int inFd = open(protectedPdf.c_str(), O_RDONLY);
        int outFd = open(unprotectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        TransformResult res;
        int status = transform(inFd, outFd, UNPROTECT, 0, "WrongPassword", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == WRONG_PASSWORD);
        assert(res.status == WRONG_PASSWORD);
        std::cout << "[PASS] UNPROTECT with wrong password returned WRONG_PASSWORD." << std::endl;

        // 3b. Test empty password returns PASSWORD_REQUIRED
        inFd = open(protectedPdf.c_str(), O_RDONLY);
        outFd = open(unprotectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, UNPROTECT, 0, "", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == PASSWORD_REQUIRED);
        assert(res.status == PASSWORD_REQUIRED);
        std::cout << "[PASS] UNPROTECT with empty password returned PASSWORD_REQUIRED."
                  << std::endl;

        // 3c. Test correct password removes protection
        inFd = open(protectedPdf.c_str(), O_RDONLY);
        outFd = open(unprotectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, UNPROTECT, 0, "ScanSecret2026!", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == OK);
        assert(res.status == OK);
        assert(res.encrypted == false);
        assert(res.pageCount == 3);

        QPDF qUnprot;
        qUnprot.setAttemptRecovery(false);
        qUnprot.processFile(unprotectedPdf.c_str(), "");
        assert(!qUnprot.isEncrypted());
        assert(qUnprot.getAllPages().size() == 3);
        std::cout << "[PASS] UNPROTECT successfully produced unencrypted PDF." << std::endl;

        if (toolExists("pdfinfo")) {
            std::string out;
            runCmd("pdfinfo " + unprotectedPdf, &out);
            assert(out.find("Encrypted:       no") != std::string::npos);
            assert(out.find("Pages:           3") != std::string::npos);
            std::cout << "[PASS] pdfinfo confirmed unencrypted status." << std::endl;
        }
        if (toolExists("pdftotext")) {
            std::string out;
            bool ok = runCmd("pdftotext " + unprotectedPdf + " -", &out);
            assert(ok);
            assert(out.find("Adobe Scan Hardening Page 3") != std::string::npos);
            std::cout << "[PASS] pdftotext read unprotected output without password." << std::endl;
        }

        // 3d. Test UNPROTECT on already unencrypted file returns ALREADY_UNPROTECTED
        inFd = open(multiPagePdf.c_str(), O_RDONLY);
        outFd = open(unprotectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, UNPROTECT, 0, "any", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == ALREADY_UNPROTECTED);
        assert(res.status == ALREADY_UNPROTECTED);
        std::cout << "[PASS] UNPROTECT on unencrypted file returned ALREADY_UNPROTECTED."
                  << std::endl;
    }

    // ------------------------------------------------------------------------
    // TEST 4: COMPRESS HIGH and LOW
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 4: COMPRESS HIGH (quality 60) and LOW (quality 85) ---" << std::endl;
    std::string compressedHighPdf = testDir + "/compressed_high.pdf";
    std::string compressedLowPdf = testDir + "/compressed_low.pdf";
    long long highSize = 0;
    long long lowSize = 0;

    {
        // 4a. COMPRESS HIGH
        int inFd = open(multiPagePdf.c_str(), O_RDONLY);
        int outFd = open(compressedHighPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        TransformResult res;
        int status = transform(inFd, outFd, COMPRESS, HIGH, "", nullptr, res);
        close(inFd);
        close(outFd);

        assert(status == OK);
        assert(res.status == OK);
        assert(res.encrypted == false);
        assert(res.pageCount == 3);
        highSize = res.outputBytes;
        std::cout << "Original size: " << origSize << ", COMPRESS HIGH size: " << highSize
                  << std::endl;
        assert(highSize < origSize);
        double ratioHigh = static_cast<double>(highSize) / static_cast<double>(origSize);
        std::cout << "COMPRESS HIGH reduction ratio: " << (1.0 - ratioHigh) * 100.0 << "%"
                  << std::endl;

        if (toolExists("pdftotext")) {
            std::string out;
            runCmd("pdftotext " + compressedHighPdf + " -", &out);
            assert(out.find("Adobe Scan Hardening Page 1") != std::string::npos);
            assert(out.find("Searchable OCR and Document Text Verification") != std::string::npos);
            std::cout << "[PASS] pdftotext verified text preserved after COMPRESS HIGH."
                      << std::endl;
        }

        // 4b. COMPRESS LOW
        inFd = open(multiPagePdf.c_str(), O_RDONLY);
        outFd = open(compressedLowPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, COMPRESS, LOW, "", nullptr, res);
        close(inFd);
        close(outFd);

        assert(status == OK);
        assert(res.status == OK);
        lowSize = res.outputBytes;
        std::cout << "COMPRESS LOW size: " << lowSize << std::endl;
        assert(lowSize < origSize);
        assert(highSize <= lowSize);
        std::cout << "[PASS] HIGH (quality 60) is smaller than or equal to LOW (quality 85)."
                  << std::endl;

        // 4c. COMPRESS on encrypted PDF returns PASSWORD_REQUIRED
        inFd = open(protectedPdf.c_str(), O_RDONLY);
        outFd = open(compressedHighPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, COMPRESS, HIGH, "", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == PASSWORD_REQUIRED);
        assert(res.status == PASSWORD_REQUIRED);
        std::cout << "[PASS] COMPRESS on encrypted PDF returned PASSWORD_REQUIRED." << std::endl;

        // 4d. COMPRESS on encrypted PDF with wrong password returns WRONG_PASSWORD
        inFd = open(protectedPdf.c_str(), O_RDONLY);
        outFd = open(compressedHighPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, COMPRESS, HIGH, "WrongPassword999", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == WRONG_PASSWORD);
        assert(res.status == WRONG_PASSWORD);
        std::cout << "[PASS] COMPRESS on encrypted PDF with wrong password returned WRONG_PASSWORD."
                  << std::endl;

        // 4e. COMPRESS on encrypted PDF with correct password succeeds and re-encrypts
        std::string compressedProtectedPdf = testDir + "/compressed_protected.pdf";
        inFd = open(protectedPdf.c_str(), O_RDONLY);
        outFd = open(compressedProtectedPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = transform(inFd, outFd, COMPRESS, HIGH, "ScanSecret2026!", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == OK);
        assert(res.status == OK);
        assert(res.encrypted);
        assert(res.pageCount == 3);
        std::cout << "[PASS] COMPRESS on encrypted PDF with correct password returned OK and "
                     "re-encrypted."
                  << std::endl;

        // Verify output is encrypted and requires SecretPass123!
        if (toolExists("pdfinfo")) {
            std::string out;
            bool okNoPass = runCmd("pdfinfo " + compressedProtectedPdf, &out);
            assert(!okNoPass || out.find("Encrypted:       yes") != std::string::npos);
            out.clear();
            bool okPass = runCmd("pdfinfo -upw 'ScanSecret2026!' " + compressedProtectedPdf, &out);
            assert(okPass);
            assert(out.find("Pages:           3") != std::string::npos);
            std::cout
                << "[PASS] pdfinfo verified compressed PDF remains encrypted with correct password."
                << std::endl;
        }
        if (toolExists("pdftotext")) {
            std::string out;
            bool ok =
                runCmd("pdftotext -upw 'ScanSecret2026!' " + compressedProtectedPdf + " -", &out);
            assert(ok);
            assert(out.find("Searchable OCR and Document Text Verification") != std::string::npos);
            std::cout << "[PASS] pdftotext read re-protected compressed PDF using password."
                      << std::endl;
        }
    }

    // ------------------------------------------------------------------------
    // TEST 5: NO_SAVINGS when compressing already compressed tiny image
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 5: NO_SAVINGS ---" << std::endl;
    std::string tinyPdf = testDir + "/tiny_image.pdf";
    createTinyImagePdf(tinyPdf);
    {
        std::string noSavingsOut = testDir + "/no_savings_out.pdf";
        int inFd = open(tinyPdf.c_str(), O_RDONLY);
        int outFd = open(noSavingsOut.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        TransformResult res;
        int status = transform(inFd, outFd, COMPRESS, LOW, "", nullptr, res);
        close(inFd);
        close(outFd);

        assert(status == NO_SAVINGS);
        assert(res.status == NO_SAVINGS);
        std::cout << "[PASS] Compress with no shrink returned NO_SAVINGS." << std::endl;
    }

    // ------------------------------------------------------------------------
    // TEST 6: Malformed PDF returns INVALID_PDF
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 6: Malformed PDF returns INVALID_PDF ---" << std::endl;
    std::string malformedPdf = testDir + "/malformed.pdf";
    {
        FILE *f = fopen(malformedPdf.c_str(), "w");
        fputs("This is NOT a valid PDF header or content at all!\n", f);
        fclose(f);

        std::string dummyOut = testDir + "/dummy_out.pdf";
        int inFd = open(malformedPdf.c_str(), O_RDONLY);
        int outFd = open(dummyOut.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        TransformResult res;
        int status = transform(inFd, outFd, COMPRESS, HIGH, "", nullptr, res);
        close(inFd);
        close(outFd);

        assert(status == INVALID_PDF);
        assert(res.status == INVALID_PDF);
        std::cout << "[PASS] Malformed PDF returned INVALID_PDF." << std::endl;
    }

    // ------------------------------------------------------------------------
    // TEST 7: Invalid password formats for PROTECT
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST 7: Invalid password validations for PROTECT ---" << std::endl;
    {
        std::string dummyOut = testDir + "/dummy_out2.pdf";
        int inFd = open(multiPagePdf.c_str(), O_RDONLY);
        int outFd = open(dummyOut.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        TransformResult res;

        // Empty password
        int status = transform(inFd, outFd, PROTECT, 0, "", nullptr, res);
        assert(status == INVALID_PDF);

        // Password with embedded NUL
        std::string nulPw = "abc";
        nulPw.push_back('\0');
        nulPw += "def";
        status = transform(inFd, outFd, PROTECT, 0, nulPw, nullptr, res);
        assert(status == INVALID_PDF);

        // Password > 127 bytes
        std::string longPw(128, 'a');
        status = transform(inFd, outFd, PROTECT, 0, longPw, nullptr, res);
        assert(status == INVALID_PDF);

        close(inFd);
        close(outFd);
        std::cout << "[PASS] Empty, NUL-containing, and >127 byte passwords rejected." << std::endl;
    }

    // ------------------------------------------------------------------------
    // TEST: 127-byte password boundary protection & validation
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST: 127-byte Password Boundary ---" << std::endl;
    {
        std::string outPdf = testDir + "/protected_127.pdf";
        std::string pw127(127, 'k');
        int inFd = open(multiPagePdf.c_str(), O_RDONLY);
        int outFd = open(outPdf.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        assert(inFd >= 0 && outFd >= 0);

        TransformResult res;
        int status = transform(inFd, outFd, PROTECT, 0, pw127, nullptr, res);
        close(inFd);
        close(outFd);

        assert(status == OK);
        assert(res.status == OK);
        assert(res.encrypted == true);

        // Verify opening with pw127 succeeds and recovery disabled
        QPDF val;
        val.setAttemptRecovery(false);
        val.processFile(outPdf.c_str(), pw127.c_str());
        assert(val.isEncrypted());
        assert(val.userPasswordMatched() || val.ownerPasswordMatched());
        std::cout << "[PASS] 127-byte password protected and verified successfully." << std::endl;
    }

    // ------------------------------------------------------------------------
    // TEST: Aliased file descriptors prevention
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST: FD Aliasing Detection ---" << std::endl;
    {
        std::string testSamplePdf = multiPagePdf;
        struct stat stBefore;
        assert(stat(testSamplePdf.c_str(), &stBefore) == 0);
        assert(stBefore.st_size > 0);

        // Test same file descriptor
        int fdSame = open(testSamplePdf.c_str(), O_RDWR);
        assert(fdSame >= 0);
        TransformResult res;
        int status = transform(fdSame, fdSame, PROTECT, 0, "SomePass123", nullptr, res);
        close(fdSame);
        assert(status == IO_ERROR);
        assert(res.status == IO_ERROR);

        // Verify file was NOT truncated
        struct stat stAfter;
        assert(stat(testSamplePdf.c_str(), &stAfter) == 0);
        assert(stAfter.st_size == stBefore.st_size);

        // Test separate file descriptors referring to the same inode
        int inFd = open(testSamplePdf.c_str(), O_RDONLY);
        int outFd = open(testSamplePdf.c_str(), O_RDWR);
        assert(inFd >= 0 && outFd >= 0);
        status = transform(inFd, outFd, COMPRESS, 1, "", nullptr, res);
        close(inFd);
        close(outFd);
        assert(status == IO_ERROR);
        assert(res.status == IO_ERROR);

        // Verify file was still NOT truncated
        assert(stat(testSamplePdf.c_str(), &stAfter) == 0);
        assert(stAfter.st_size == stBefore.st_size);
        std::cout << "[PASS] Aliased file descriptors rejected with IO_ERROR without truncating."
                  << std::endl;
    }

    // ------------------------------------------------------------------------
    // TEST: COMBINE Multiple PDFs
    // ------------------------------------------------------------------------
    std::cout << "\n--- TEST: COMBINE Multiple PDFs ---" << std::endl;
    {
        std::string docAPath = testDir + "/doc_a.pdf";
        std::string docBPath = testDir + "/doc_b.pdf";
        std::string combinedForward = testDir + "/combined_forward.pdf";
        std::string combinedReverse = testDir + "/combined_reverse.pdf";

        createDistinguishablePdf(docAPath, 2, "DocA", 0);
        createDistinguishablePdf(docBPath, 3, "DocB", 90);

        struct stat stA_before, stB_before;
        assert(stat(docAPath.c_str(), &stA_before) == 0);
        assert(stat(docBPath.c_str(), &stB_before) == 0);

        // 1. Forward order: DocA (2 pages) + DocB (3 pages) = 5 pages
        int fdsForward[2] = {open(docAPath.c_str(), O_RDONLY), open(docBPath.c_str(), O_RDONLY)};
        int outFdForward = open(combinedForward.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        assert(fdsForward[0] >= 0 && fdsForward[1] >= 0 && outFdForward >= 0);

        std::vector<int> progressList;
        TransformResult res;
        int status = combine(
            fdsForward, 2, {}, outFdForward, [&](int p) { progressList.push_back(p); }, res);
        close(fdsForward[0]);
        close(fdsForward[1]);
        close(outFdForward);

        assert(status == OK);
        assert(res.status == OK);
        assert(res.pageCount == 5);
        assert(res.outputBytes > 0);
        assert(!progressList.empty() && progressList.back() == 100);

        // Verify page order and rotation in combinedForward
        {
            QPDF val;
            val.setAttemptRecovery(false);
            val.processFile(combinedForward.c_str());
            QPDFPageDocumentHelper helper(val);
            auto pages = helper.getAllPages();
            assert(pages.size() == 5);

            auto getRot = [](QPDFPageObjectHelper &p) {
                return p.getObjectHandle().hasKey("/Rotate")
                           ? static_cast<int>(p.getObjectHandle().getKey("/Rotate").getIntValue())
                           : 0;
            };
            assert(getRot(pages[0]) == 0);
            assert(getRot(pages[1]) == 0);
            assert(getRot(pages[2]) == 90);
            assert(getRot(pages[3]) == 90);
            assert(getRot(pages[4]) == 90);
        }

        // 2. Reverse order: DocB (3 pages) + DocA (2 pages) = 5 pages
        int fdsReverse[2] = {open(docBPath.c_str(), O_RDONLY), open(docAPath.c_str(), O_RDONLY)};
        int outFdReverse = open(combinedReverse.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        assert(fdsReverse[0] >= 0 && fdsReverse[1] >= 0 && outFdReverse >= 0);

        status = combine(fdsReverse, 2, {}, outFdReverse, nullptr, res);
        close(fdsReverse[0]);
        close(fdsReverse[1]);
        close(outFdReverse);

        assert(status == OK);
        assert(res.status == OK);
        assert(res.pageCount == 5);

        // Verify reverse page order: first 3 pages rotation 90, last 2 rotation 0
        {
            QPDF val;
            val.setAttemptRecovery(false);
            val.processFile(combinedReverse.c_str());
            QPDFPageDocumentHelper helper(val);
            auto pages = helper.getAllPages();
            assert(pages.size() == 5);
            auto getRot = [](QPDFPageObjectHelper &p) {
                return p.getObjectHandle().hasKey("/Rotate")
                           ? static_cast<int>(p.getObjectHandle().getKey("/Rotate").getIntValue())
                           : 0;
            };
            assert(getRot(pages[0]) == 90);
            assert(getRot(pages[1]) == 90);
            assert(getRot(pages[2]) == 90);
            assert(getRot(pages[3]) == 0);
            assert(getRot(pages[4]) == 0);
        }

        // Verify original source files were NOT modified in any way
        struct stat stA_after, stB_after;
        assert(stat(docAPath.c_str(), &stA_after) == 0);
        assert(stat(docBPath.c_str(), &stB_after) == 0);
        assert(stA_after.st_size == stA_before.st_size);
        assert(stB_after.st_size == stB_before.st_size);

        // 3a. Combine with password-protected input without password fails with PASSWORD_REQUIRED
        // and pageCount == 1
        int fdsWithEncrypted[2] = {open(docAPath.c_str(), O_RDONLY),
                                   open(protectedPdf.c_str(), O_RDONLY)};
        std::string failedOut = testDir + "/failed_combine.pdf";
        int outFdFail = open(failedOut.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = combine(fdsWithEncrypted, 2, {}, outFdFail, nullptr, res);
        close(fdsWithEncrypted[0]);
        close(fdsWithEncrypted[1]);
        close(outFdFail);
        assert(status == PASSWORD_REQUIRED);
        assert(res.status == PASSWORD_REQUIRED);
        assert(res.pageCount == 1);

        // 3b. Combine with wrong password fails with WRONG_PASSWORD and pageCount == 1
        fdsWithEncrypted[0] = open(docAPath.c_str(), O_RDONLY);
        fdsWithEncrypted[1] = open(protectedPdf.c_str(), O_RDONLY);
        outFdFail = open(failedOut.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = combine(fdsWithEncrypted, 2, {"", "WrongPassword!"}, outFdFail, nullptr, res);
        close(fdsWithEncrypted[0]);
        close(fdsWithEncrypted[1]);
        close(outFdFail);
        assert(status == WRONG_PASSWORD);
        assert(res.status == WRONG_PASSWORD);
        assert(res.pageCount == 1);

        // 3c. Combine with correct password succeeds and decrypts into unencrypted combined PDF
        fdsWithEncrypted[0] = open(docAPath.c_str(), O_RDONLY);
        fdsWithEncrypted[1] = open(protectedPdf.c_str(), O_RDONLY);
        std::string successCombine = testDir + "/success_combine_protected.pdf";
        int outFdSuccess = open(successCombine.c_str(), O_RDWR | O_CREAT | O_TRUNC, 0644);
        status = combine(fdsWithEncrypted, 2, {"", "ScanSecret2026!"}, outFdSuccess, nullptr, res);
        close(fdsWithEncrypted[0]);
        close(fdsWithEncrypted[1]);
        close(outFdSuccess);
        assert(status == OK);
        assert(res.status == OK);
        assert(res.pageCount == 5);
        assert(res.outputBytes > 0);
        assert(!res.encrypted);

        {
            QPDF val;
            val.setAttemptRecovery(false);
            val.processFile(successCombine.c_str());
            assert(!val.isEncrypted());
            QPDFPageDocumentHelper helper(val);
            assert(helper.getAllPages().size() == 5);
        }
        // 4. Combine with aliased output to input fails with IO_ERROR without modifying source
        int fdsAliased[2] = {open(docAPath.c_str(), O_RDONLY), open(docBPath.c_str(), O_RDONLY)};
        int outFdAliased = open(docAPath.c_str(), O_RDWR);
        status = combine(fdsAliased, 2, {}, outFdAliased, nullptr, res);
        close(fdsAliased[0]);
        close(fdsAliased[1]);
        close(outFdAliased);
        assert(status == IO_ERROR);
        assert(res.status == IO_ERROR);
        struct stat stA_after_alias;
        assert(stat(docAPath.c_str(), &stA_after_alias) == 0);
        assert(stA_after_alias.st_size == stA_before.st_size);

        std::cout << "[PASS] Multi-document combine tested in forward and reverse orders, source "
                     "preservation verified."
                  << std::endl;
    }

    std::cout << "\n========================================" << std::endl;
    std::cout << "All Adobe Scan PDF Native Engine Tests PASSED!" << std::endl;
    std::cout << "========================================" << std::endl;

    return 0;
}
