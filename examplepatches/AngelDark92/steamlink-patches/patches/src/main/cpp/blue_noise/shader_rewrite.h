#pragma once
#include "sha256.h"

namespace sl_blue_noise {
// Patched per APK by the production Kotlin installer. Writable prevents compiler folding.
inline char configured_shader_hash[] = "SLBN_CONFIGURED_HASH_____________________________________________";
inline char stock_shader_hash[] = "SLBN_STOCK_HASH__________________________________________________";
inline char fovea_draw_return[] = "SLBN_FOVEA_PC____";
inline char background_shader_hash[] = "SLBN_BACKGROUND_HASH____________________________________________";
inline char background_stock_hash[] = "SLBN_BACKGROUND_STOCK___________________________________________";
inline char background_draw_return[] = "SLBN_BASE_PC____";

// None stays false for callers that only need to know whether rewriting succeeded.
enum Layer { None = 0, Fovea, Background };

inline Layer rewrite(std::string_view original, std::string& output,
                     std::string_view configured = configured_shader_hash,
                     std::string_view stock = stock_shader_hash,
                     std::string_view background = background_shader_hash,
                     std::string_view backgroundStock = background_stock_hash) {
    const auto hash = sha256(original);
    const bool foveal = hash == configured || hash == stock;
    const bool base = hash == background || hash == backgroundStock;
    // Unselected layers keep their non-hex placeholders. Reject ambiguous attribution,
    // unknown host replacements, already-dithered sources and partial strings.
    if (foveal == base) return Layer::None;
    output = std::string(original);
    const auto main = output.find("void main()");
    if (main == std::string::npos || output.find("void main()", main+1) != std::string::npos) return Layer::None;
    output.replace(main, 11, "void SL_originalMain()");
    auto replace = [&](const char* a, const char* b) {
        auto p = output.find(a); if (p != std::string::npos) output.replace(p, std::char_traits<char>::length(a), b);
    };
    replace("precision mediump float;", "precision highp float;");
    replace("uniform samplerExternalOES tex0;", "uniform highp samplerExternalOES tex0;");
    output += R"GLSL(
layout(location=14) uniform highp sampler2D SL_blueNoise;
layout(location=15) uniform bool SL_enabled;
void main() {
    SL_originalMain();
    if (SL_enabled) {
        highp ivec2 p = ivec2(gl_FragCoord.xy) & ivec2(127);
        highp float t = (texelFetch(SL_blueNoise,p,0).r*255.0+0.5)/256.0;
        color.rgb = floor(clamp(color.rgb,0.0,1.0)*255.0+vec3(t))/255.0;
    }
}
)GLSL";
    return foveal ? Layer::Fovea : Layer::Background;
}
}
