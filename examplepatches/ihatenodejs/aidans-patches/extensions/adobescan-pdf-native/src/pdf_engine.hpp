#ifndef AIDANSCANPDF_PDF_ENGINE_HPP
#define AIDANSCANPDF_PDF_ENGINE_HPP

#include <cstddef>
#include <cstdint>
#include <functional>
#include <string>
#include <vector>
namespace aidanscanpdf {

enum Operation {
    COMPRESS = 1,
    PROTECT = 2,
    UNPROTECT = 3,
    COMBINE = 4,
    EXPORT_DOCX = 5,
    EXPORT_XLSX = 6,
    EXPORT_PPTX = 7
};

enum CompressionLevel {
    HIGH = 0, // quality 60
    LOW = 1   // quality 85
};

enum Status {
    OK = 0,
    NO_SAVINGS = 1,
    CANCELLED = 2,
    INVALID_PDF = 3,
    PASSWORD_REQUIRED = 4,
    WRONG_PASSWORD = 5,
    UNSUPPORTED_PDF = 6,
    IO_ERROR = 7,
    ENGINE_FAILURE = 8,
    ALREADY_UNPROTECTED = 9
};

struct TransformResult {
    int status = ENGINE_FAILURE;
    int pageCount = 0;
    int64_t outputBytes = 0;
    bool encrypted = false;
};

int transform(int inputFd, int outputFd, int operation, int compressionLevel,
              const std::string &password, std::function<void(int)> progressCb,
              TransformResult &result);

int combine(const int *inputFds, size_t inputCount, const std::vector<std::string> &passwords,
            int outputFd, std::function<void(int)> progressCb, TransformResult &result);

} // namespace aidanscanpdf

#endif // AIDANSCANPDF_PDF_ENGINE_HPP
