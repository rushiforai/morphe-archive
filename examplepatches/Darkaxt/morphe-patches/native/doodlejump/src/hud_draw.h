#pragma once

#include <GLES/gl.h>
#include <cmath>
#include <cstdio>

namespace hud_draw {

inline void draw_rect(float x, float y, float w, float h,
                      float r, float g, float b, float a) {
    const float v[8] = {
        x,     y,
        x + w, y,
        x,     y + h,
        x + w, y + h,
    };
    glColor4f(r, g, b, a);
    glVertexPointer(2, GL_FLOAT, 0, v);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

// Draws a scaled-down stylized Doodler icon centered around (cx, cy) with scale `s`.
// `alive == true` draws bright classic green Doodler; `alive == false` draws a faint outline/silhouette.
inline void draw_mini_doodler(float cx, float cy, float s, bool alive, float alpha = 1.0f) {
    // Colors
    float br = alive ? 0.52f : 0.25f;
    float bg = alive ? 0.85f : 0.25f;
    float bb = alive ? 0.18f : 0.25f;
    float ba = alive ? alpha : (0.35f * alpha);

    // Legs (4 little vertical legs under body)
    float legW = 1.6f * s;
    float legH = 4.5f * s;
    float legY = cy - 7.5f * s;
    draw_rect(cx - 5.2f * s, legY, legW, legH, 0.22f, 0.45f, 0.10f, ba);
    draw_rect(cx - 2.2f * s, legY, legW, legH, 0.22f, 0.45f, 0.10f, ba);
    draw_rect(cx + 0.8f * s, legY, legW, legH, 0.22f, 0.45f, 0.10f, ba);
    draw_rect(cx + 3.8f * s, legY, legW, legH, 0.22f, 0.45f, 0.10f, ba);

    // Lower striped torso (darker green)
    draw_rect(cx - 6.0f * s, cy - 3.5f * s, 12.0f * s, 4.0f * s,
              alive ? 0.25f : 0.20f, alive ? 0.62f : 0.20f, alive ? 0.14f : 0.20f, ba);

    // Main body / head (bright green)
    draw_rect(cx - 6.0f * s, cy + 0.2f * s, 12.0f * s, 7.2f * s, br, bg, bb, ba);
    // Rounded top cap
    draw_rect(cx - 4.5f * s, cy + 7.2f * s, 9.0f * s, 2.0f * s, br, bg, bb, ba);

    // Iconic Doodler snout pointing right
    draw_rect(cx + 5.5f * s, cy + 2.2f * s, 5.2f * s, 3.2f * s, br, bg, bb, ba);
    // Snout tip ring
    draw_rect(cx + 10.2f * s, cy + 1.8f * s, 1.4f * s, 4.0f * s,
              alive ? 0.30f : 0.18f, alive ? 0.55f : 0.18f, alive ? 0.10f : 0.18f, ba);

    // Eyes (two dark dots)
    if (alive) {
        draw_rect(cx + 0.5f * s, cy + 4.4f * s, 1.6f * s, 1.8f * s, 0.08f, 0.08f, 0.08f, alpha);
        draw_rect(cx + 3.2f * s, cy + 4.4f * s, 1.6f * s, 1.8f * s, 0.08f, 0.08f, 0.08f, alpha);
    }
}

// 3x5 bitmap font for digits 0-9 and uppercase 'P','E','A','K',':'
inline uint16_t glyph_3x5(char c) {
    switch (c) {
        case '0': return 0b111101101101111;
        case '1': return 0b010110010010111;
        case '2': return 0b111001111100111;
        case '3': return 0b111001111001111;
        case '4': return 0b101101111001001;
        case '5': return 0b111100111001111;
        case '6': return 0b111100111101111;
        case '7': return 0b111001001001001;
        case '8': return 0b111101111101111;
        case '9': return 0b111101111001111;
        case 'P': return 0b111101111100100;
        case 'E': return 0b111100110100111;
        case 'A': return 0b010101111101101;
        case 'K': return 0b101101110101101;
        case ':': return 0b000010000010000;
        default:  return 0;
    }
}

inline void draw_text_3x5(const char* text, float x, float y, float px,
                          float r, float g, float b, float a) {
    float curX = x;
    for (const char* p = text; *p; ++p) {
        uint16_t bits = glyph_3x5(*p);
        if (bits != 0) {
            for (int row = 0; row < 5; ++row) {
                for (int col = 0; col < 3; ++col) {
                    int bitIndex = (4 - row) * 3 + (2 - col);
                    if ((bits >> bitIndex) & 1) {
                        // row 0 is top, in GLES Y-up that is y + (4 - row)*px
                        draw_rect(curX + col * px, y + (4 - row) * px, px, px, r, g, b, a);
                    }
                }
            }
        }
        curX += (*p == ' ' ? 2.5f : 4.0f) * px;
    }
}

// Draws the actual themed Doodler sprite from the game's Sprite struct:
//   +0x00: GLuint texId
//   +0x28: float halfWidth
//   +0x2c: float halfHeight
//   +0x30: float uvs[8] (GL_TRIANGLE_STRIP)
// Returns true if drawn via sprite, false if caller should fall back to draw_mini_doodler.
inline bool draw_themed_doodler(const void* sprite, float cx, float cy,
                                float target_h, bool alive, float alpha = 1.0f) {
    if (!sprite) return false;
    const auto* p = static_cast<const uint8_t*>(sprite);
    GLuint tex_id = *reinterpret_cast<const GLuint*>(p + 0x00);
    float hw = *reinterpret_cast<const float*>(p + 0x28);
    float hh = *reinterpret_cast<const float*>(p + 0x2c);
    if (tex_id == 0 || hw <= 1.0f || hh <= 1.0f || hw > 256.0f || hh > 256.0f) {
        return false;
    }

    float scale = (target_h * 0.5f) / hh;
    float dw = hw * scale;
    float dh = hh * scale;

    const GLfloat verts[8] = {
        cx - dw, cy - dh,
        cx + dw, cy - dh,
        cx - dw, cy + dh,
        cx + dw, cy + dh,
    };
    const auto* uvs = reinterpret_cast<const GLfloat*>(p + 0x30);

    GLint prev_tex = 0;
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &prev_tex);

    glEnable(GL_TEXTURE_2D);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

    if (alive) {
        glColor4f(alpha, alpha, alpha, alpha);
    } else {
        glColor4f(0.10f * alpha, 0.10f * alpha, 0.10f * alpha, 0.35f * alpha);
    }

    glBindTexture(GL_TEXTURE_2D, tex_id);
    glTexCoordPointer(2, GL_FLOAT, 0, uvs);
    glVertexPointer(2, GL_FLOAT, 0, verts);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

    glBindTexture(GL_TEXTURE_2D, static_cast<GLuint>(prev_tex));
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisable(GL_TEXTURE_2D);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    return true;
}

inline void render_overlay(int lives, int max_lives, int peak_score,
                           float screen_left, float screen_width,
                           float screen_height, float top_inset,
                           float invuln_timer, float damage_flash,
                           const void* doodler_sprite = nullptr,
                           float extra_x = 0.0f) {
    // Save GLES 1.1 state we touch
    GLboolean tex_enabled = glIsEnabled(GL_TEXTURE_2D);
    GLboolean blend_enabled = glIsEnabled(GL_BLEND);

    glDisable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);

    // Subtle red full-viewport flash when taking fall or monster damage
    if (damage_flash > 0.0f) {
        float a = damage_flash * 0.38f;
        if (a > 0.25f) a = 0.25f;
        draw_rect(screen_left - extra_x, 0.0f, screen_width + extra_x * 2.0f, screen_height,
                  0.95f, 0.12f, 0.12f, a);
    }

    // Place lives + peak score cleanly inside the vanilla top HUD bar (between score and pause)
    float bar_center_y = screen_height - top_inset - 21.0f;
    float icons_x = screen_left + 114.0f;

    // Blink icons gently while invulnerable
    float icon_alpha = 1.0f;
    if (invuln_timer > 0.0f) {
        icon_alpha = (std::fmod(invuln_timer, 0.24f) < 0.12f) ? 0.45f : 1.0f;
    }

    for (int i = 0; i < max_lives; ++i) {
        float cx = icons_x + i * 21.0f;
        float cy = bar_center_y - 1.0f;
        if (!draw_themed_doodler(doodler_sprite, cx, cy, 24.0f, i < lives, icon_alpha)) {
            draw_mini_doodler(cx, cy, 0.72f, i < lives, icon_alpha);
        }
    }

    // Peak score label neatly inside the right-center of the top bar (left of pause button)
    char buf[32];
    std::snprintf(buf, sizeof(buf), "PEAK:%d", peak_score);
    float peak_x = screen_left + 178.0f;
    draw_rect(peak_x - 3.0f, bar_center_y - 6.0f, 88.0f, 13.0f, 0.0f, 0.0f, 0.0f, 0.28f);
    draw_text_3x5(buf, peak_x, bar_center_y - 4.0f, 1.75f, 1.0f, 0.92f, 0.30f, 0.98f);

    // Restore GLES 1.1 state
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    if (tex_enabled) glEnable(GL_TEXTURE_2D);
    if (!blend_enabled) glDisable(GL_BLEND);
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
}

} // namespace hud_draw
