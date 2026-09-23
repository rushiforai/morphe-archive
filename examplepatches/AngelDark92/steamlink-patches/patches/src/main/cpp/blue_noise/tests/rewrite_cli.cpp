#include "../shader_rewrite.h"
#include <fstream>
#include <iostream>
#include <iterator>

// Offline compiler harness: production rewrite, with the test input's exact hash in the
// same configured slot that the APK installer populates after validating its known prefix.
int main(int argc, char** argv) {
    if (argc != 3) return 2;
    std::ifstream stream(argv[1],std::ios::binary);
    if (!stream) return 2;
    std::string source{std::istreambuf_iterator<char>(stream),std::istreambuf_iterator<char>()};
    std::string output;
    if (!sl_blue_noise::rewrite(source,output,sl_blue_noise::sha256(source),"")) return 1;
    std::ofstream result(argv[2],std::ios::binary);
    result << output;
    return result ? 0 : 2;
}
