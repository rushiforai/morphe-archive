#include "../shader_rewrite.h"
#include <fstream>
#include <iostream>
#include <iterator>

// Offline compiler harness: production rewrite, with the test input's exact hash in the
// same configured slot that the APK installer populates after validating its known prefix.
int main(int argc, char** argv) {
    if (argc != 3 && argc != 4) return 2;
    const bool background = argc == 4;
    if (background && std::string_view(argv[3]) != "background") return 2;
    std::ifstream stream(argv[1],std::ios::binary);
    if (!stream) return 2;
    std::string source{std::istreambuf_iterator<char>(stream),std::istreambuf_iterator<char>()};
    std::string output;
    const auto hash = sl_blue_noise::sha256(source);
    const auto layer = background
        ? sl_blue_noise::rewrite(source,output,"","",hash,"")
        : sl_blue_noise::rewrite(source,output,hash,"","","");
    const auto expected = background ? sl_blue_noise::Layer::Background : sl_blue_noise::Layer::Fovea;
    if (layer != expected) return 1;
    std::ofstream result(argv[2],std::ios::binary);
    result << output;
    return result ? 0 : 2;
}
