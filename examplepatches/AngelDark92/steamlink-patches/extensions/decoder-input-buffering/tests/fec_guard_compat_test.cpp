#include "../src/fec_guard_compat.h"
#include <cassert>
#include <fstream>
#include <iostream>
#include <iterator>
#include <string>
#include <vector>

int main(int argc, char** argv) {
    assert(argc == 2);
    struct Base { const char* version; const char* code; size_t offset; uint64_t hash; };
    for (const auto& base : {
        Base{"2.0.22", "5002322", 0x167050, 0x9a55ea26b84322b3ULL},
        Base{"2.0.23", "5002363", 0x167f1c, 0x3bc1adb38942122dULL}}) {
        const auto path = std::string(argv[1]) + "/decoded-apk-android-steamlinkvr-release-base-" +
            base.version + "-" + base.code + "/lib/arm64-v8a/libvrlink_scene.so";
        std::ifstream input(path, std::ios::binary);
        assert(input.good());
        const std::vector<unsigned char> file{std::istreambuf_iterator<char>(input), {}};
        assert(file.size() >= base.offset + 0x294);
        std::vector<unsigned char> fn(file.begin() + base.offset, file.begin() + base.offset + 0x294);
        const auto stock = fn;
        assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size()) == base.hash);
        const unsigned char nop[] = {0x1f, 0x20, 0x03, 0xd5};
        std::copy(std::begin(nop), std::end(nop), fn.begin() + 0x44);
        const auto guarded = fn;
        assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size()) == base.hash);
        assert(fn == guarded); // Hashing cannot modify executable memory.
        fn[0x43] ^= 1;
        assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size()) != base.hash);
        fn = guarded; fn[0x48] ^= 1;
        assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size()) != base.hash);
        for (size_t i = 0; i < 4; ++i) {
            fn = guarded; fn[0x44 + i] ^= 1;
            assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size()) == 0);
            fn = stock; fn[0x44 + i] ^= 1;
            assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size()) == 0);
        }
        assert(gxr::dbuf::normalizedFecPacketHash(fn.data(), fn.size() - 1) == 0);
        assert(gxr::dbuf::normalizedFecPacketHash(nullptr, 0x294) == 0);
        std::cout << "PASS actual " << base.version << '/' << base.code
                  << " stock/NOP hash, adjacent corruption, 8 invalid instructions, size/null guards\n";
    }
}
