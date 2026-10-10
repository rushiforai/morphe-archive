// Colour transforms for the theme features. The iOS-based app describes its board tints, button tints and
// animation themes as CSS filter chains (index.css, fx/fxTheme.js); here each chain becomes the same affine
// colour matrix the app's effect shader uses (Filter Effects 1 matrices, in the order CSS applies them), and
// one runtime shader applies it: the engine's own 2d-sprite shader with a matrix step after the vertex colour.
// Works for sprites, labels, DragonBones armatures and Spine skeletons (their native renderers take the effect).
(function () {
    // CSS filter functions as affine colour transforms: { r: row-major 3x3, o: offset } in sRGB 0..1
    function id3() { return { r: [1, 0, 0, 0, 1, 0, 0, 0, 1], o: [0, 0, 0] }; }
    function grayscale(a) {
        var k = 1 - Math.min(1, a);
        return { r: [0.2126 + 0.7874 * k, 0.7152 - 0.7152 * k, 0.0722 - 0.0722 * k, 0.2126 - 0.2126 * k, 0.7152 + 0.2848 * k, 0.0722 - 0.0722 * k,
            0.2126 - 0.2126 * k, 0.7152 - 0.7152 * k, 0.0722 + 0.9278 * k], o: [0, 0, 0] };
    }
    function sepia(a) {
        var k = 1 - Math.min(1, a);
        return { r: [0.393 + 0.607 * k, 0.769 - 0.769 * k, 0.189 - 0.189 * k, 0.349 - 0.349 * k, 0.686 + 0.314 * k, 0.168 - 0.168 * k,
            0.272 - 0.272 * k, 0.534 - 0.534 * k, 0.131 + 0.869 * k], o: [0, 0, 0] };
    }
    function saturate(s) {
        return { r: [0.213 + 0.787 * s, 0.715 - 0.715 * s, 0.072 - 0.072 * s, 0.213 - 0.213 * s, 0.715 + 0.285 * s, 0.072 - 0.072 * s,
            0.213 - 0.213 * s, 0.715 - 0.715 * s, 0.072 + 0.928 * s], o: [0, 0, 0] };
    }
    function hueRotate(deg) {
        var c = Math.cos((deg * Math.PI) / 180), s = Math.sin((deg * Math.PI) / 180);
        return { r: [0.213 + c * 0.787 - s * 0.213, 0.715 - c * 0.715 - s * 0.715, 0.072 - c * 0.072 + s * 0.928,
            0.213 - c * 0.213 + s * 0.143, 0.715 + c * 0.285 + s * 0.14, 0.072 - c * 0.072 - s * 0.283,
            0.213 - c * 0.213 - s * 0.787, 0.715 - c * 0.715 + s * 0.715, 0.072 + c * 0.928 + s * 0.072], o: [0, 0, 0] };
    }
    function scaleBias(k, b) { return { r: [k, 0, 0, 0, k, 0, 0, 0, k], o: [b, b, b] }; }
    var FNS = {
        grayscale: grayscale, sepia: sepia, saturate: saturate, 'hue-rotate': hueRotate,
        brightness: function (v) { return scaleBias(v, 0); },
        contrast: function (v) { return scaleBias(v, 0.5 - 0.5 * v); },
        invert: function (v) { return scaleBias(1 - 2 * Math.min(1, v), Math.min(1, v)); },
    };

    // b after a: x -> B(A x + a) + b
    function then(a, b) {
        var r = [], o = [];
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 3; j++) r.push(b.r[i * 3] * a.r[j] + b.r[i * 3 + 1] * a.r[3 + j] + b.r[i * 3 + 2] * a.r[6 + j]);
            o.push(b.r[i * 3] * a.o[0] + b.r[i * 3 + 1] * a.o[1] + b.r[i * 3 + 2] * a.o[2] + b.o[i]);
        }
        return { r: r, o: o };
    }

    // "grayscale(1) sepia(1) hue-rotate(-8deg)" -> transform, or null for none/empty
    function parse(css) {
        if (!css || css === 'none') return null;
        var t = id3(), re = /([a-z-]+)\(([-\d.]+)(?:deg)?\)/g, m, any = false;
        while ((m = re.exec(css))) if (FNS[m[1]]) { t = then(t, FNS[m[1]](Number(m[2]))); any = true; }
        return any ? t : null;
    }

    // The builtin 2d-sprite program with the matrix applied to the final colour
    var effectAsset = null;
    var MATRIX_STEP = '  o *= v_color;\n  ALPHA_TEST(o);\n' +
        '  vec3 c = o.rgb;\n' +
        '  #if CM_PREMULT\n  c = o.a > 0.0 ? c / o.a : vec3(0.0);\n  #endif\n' +
        '  c = clamp(vec3(dot(cmR.xyz, c) + cmR.w, dot(cmG.xyz, c) + cmG.w, dot(cmB.xyz, c) + cmB.w), 0.0, 1.0);\n' +
        '  #if CM_PREMULT\n  c *= o.a;\n  #endif\n' +
        '  o.rgb = c;';

    function copy(list) {
        return JSON.parse(JSON.stringify(list, function (k, v) { return k === '_offset' || k === '_map' ? undefined : v; }));
    }

    function effect() {
        if (effectAsset) return effectAsset;
        var base = cc.Material.getBuiltinMaterial('2d-sprite').effectAsset.shaders[0];
        var name = 'bbmod-color-matrix';
        function frag(src, uniforms) {
            var out = src.replace('uniform sampler2D texture;\n#endif', 'uniform sampler2D texture;\n#endif\n' + uniforms)
                .replace('  o *= v_color;\n  ALPHA_TEST(o);', MATRIX_STEP);
            if (out.indexOf('cmR.xyz') < 0) throw new Error('2d-sprite shader layout changed');
            return out;
        }
        var defines = copy(base.defines);
        defines.push({ name: 'CM_PREMULT', type: 'boolean', defines: [] });
        var blocks = copy(base.blocks);
        blocks.push({ name: 'ColorMatrix', binding: blocks.length, defines: [],
            members: [{ name: 'cmR', type: 16, count: 1 }, { name: 'cmG', type: 16, count: 1 }, { name: 'cmB', type: 16, count: 1 }] });
        var ea = new cc.EffectAsset();
        ea.name = name;
        ea.shaders = [{
            name: name + '|vs|fs', hash: 0x6b6d6f64, record: null,
            glsl1: { vert: base.glsl1.vert, frag: frag(base.glsl1.frag, 'uniform vec4 cmR;\nuniform vec4 cmG;\nuniform vec4 cmB;') },
            glsl3: { vert: base.glsl3.vert, frag: frag(base.glsl3.frag, 'uniform ColorMatrix { vec4 cmR; vec4 cmG; vec4 cmB; };') },
            builtins: copy(base.builtins), defines: defines, blocks: blocks, samplers: copy(base.samplers),
        }];
        ea.techniques = [{ passes: [{
            program: name + '|vs|fs', blendState: { targets: [{ blend: true }] }, rasterizerState: { cullMode: 0 },
            properties: {
                texture: { value: 'white', type: 29 }, alphaThreshold: { type: 13, value: [0.5] },
                cmR: { type: 16, value: [1, 0, 0, 0] }, cmG: { type: 16, value: [0, 1, 0, 0] }, cmB: { type: 16, value: [0, 0, 1, 0] },
            },
        }] }];
        ea.onLoad();
        effectAsset = ea;
        return ea;
    }

    function premultiplied(comp) {
        if ('premultipliedAlpha' in comp && (comp instanceof dragonBones.ArmatureDisplay || (window.sp && comp instanceof sp.Skeleton))) {
            return !!comp.premultipliedAlpha;
        }
        return comp.srcBlendFactor === cc.macro.BlendFactor.ONE;
    }

    function upload(material, t) {
        material.setProperty('cmR', new cc.Vec4(t.r[0], t.r[1], t.r[2], t.o[0]));
        material.setProperty('cmG', new cc.Vec4(t.r[3], t.r[4], t.r[5], t.o[1]));
        material.setProperty('cmB', new cc.Vec4(t.r[6], t.r[7], t.r[8], t.o[2]));
    }

    function clamp01(v) { return v < 0 ? 0 : v > 1 ? 1 : v; }

    // Labels render from alpha-only glyph textures, which the matrix shader turns into solid quads;
    // their colour is transformed on the node instead. The game may recolour a label itself: when the
    // node's colour is not the one written here, it is re-captured as the new original.
    function applyLabel(comp, t) {
        var state = comp.__bbColor;
        if (!state) {
            state = comp.__bbColor = { label: true, orig: comp.node.color.clone(), last: null };
        }
        var c = comp.node.color;
        if (state.last && (c.r !== state.last.r || c.g !== state.last.g || c.b !== state.last.b)) state.orig = c.clone();
        var o = state.orig, r = o.r / 255, g = o.g / 255, b = o.b / 255;
        var next = cc.color(
            Math.round(clamp01(t.r[0] * r + t.r[1] * g + t.r[2] * b + t.o[0]) * 255),
            Math.round(clamp01(t.r[3] * r + t.r[4] * g + t.r[5] * b + t.o[1]) * 255),
            Math.round(clamp01(t.r[6] * r + t.r[7] * g + t.r[8] * b + t.o[2]) * 255),
            o.a);
        comp.node.color = next;
        state.last = next;
        state.t = t;
    }

    // Puts transform t on a render component (null restores what it had before).
    function apply(comp, t) {
        if (!comp || !cc.isValid(comp)) return;
        if (!t) return restore(comp);
        if (comp instanceof cc.Label) return applyLabel(comp, t);
        var current = comp.getMaterial(0);
        if (!comp.__bbColor) {
            comp.__bbColor = { original: current };
            var material = cc.Material.create(effect(), 0);
            material.define('CM_PREMULT', premultiplied(comp));
            upload(material, t);
            comp.setMaterial(0, material);
        } else {
            upload(current, t);
            if (comp._updateMaterial && !(comp instanceof cc.Sprite) && !(comp instanceof cc.Label)) comp._updateMaterial();
        }
        comp.__bbColor.t = t;
    }

    function restore(comp) {
        var state = comp && comp.__bbColor;
        if (!state) return;
        comp.__bbColor = null;
        if (!cc.isValid(comp)) return;
        if (state.label) comp.node.color = state.orig;
        else comp.setMaterial(0, state.original);
    }

    // The game's own "gradient" material, which the root background (persist/bg) and the home and
    // result screens use: topColor at the top of the quad, bottomColor at the bottom (ratio = v_uv0.y).
    var gradientSource = null;
    function source() {
        if (gradientSource && gradientSource.frame.isValid) return gradientSource;
        var bg = cc.find('persist/bg'), sprite = bg && bg.getComponent(cc.Sprite), variant = sprite && sprite.getMaterial(0);
        if (!sprite || !sprite.spriteFrame || !variant || !variant.effectAsset || variant.effectAsset.name !== 'gradient') return null;
        gradientSource = { material: variant._material || variant, frame: sprite.spriteFrame };
        return gradientSource;
    }

    function vec4(hex) {
        var c = new cc.Color().fromHEX(hex);
        return new cc.Vec4(c.r / 255, c.g / 255, c.b / 255, 1);
    }

    // A sprite node painted top -> bottom ("#rrggbb" colours), w x h; false when the game's material is not there yet.
    function paintGradient(node, top, bottom) {
        var src = source();
        if (!src) return false;
        var sprite = node.getComponent(cc.Sprite) || node.addComponent(cc.Sprite);
        if (sprite.spriteFrame !== src.frame) {
            sprite.sizeMode = cc.Sprite.SizeMode.CUSTOM;
            sprite.type = cc.Sprite.Type.SIMPLE;
            sprite.spriteFrame = src.frame;
            sprite.setMaterial(0, src.material);
        }
        var m = sprite.getMaterial(0);
        m.setProperty('topColor', vec4(top));
        m.setProperty('bottomColor', vec4(bottom));
        return true;
    }

    bb.color = {
        parse: parse,
        then: then,
        hue: hueRotate,
        apply: apply,
        restore: restore,
        paintGradient: paintGradient,
        // The game's cube colours 1..8, as the iOS-based app lists them (palette.js CUBE_HEX).
        CUBES: ['#3a5ce1', '#e8b537', '#8854d2', '#e97724', '#c63133', '#34b73c', '#2fb4e3', '#565f82'],
        // A w x h sprite node in one flat colour (a generated 1x1 white texture tinted), for previews.
        sprite: function (hex, w, h) {
            if (!bb.color.__white || !bb.color.__white.isValid) {
                var texture = new cc.Texture2D();
                texture.initWithData(new Uint8Array([255, 255, 255, 255]), cc.Texture2D.PixelFormat.RGBA8888, 1, 1);
                bb.color.__white = new cc.SpriteFrame(texture);
            }
            var node = new cc.Node('swatch');
            node.setContentSize(w, h);
            var sprite = node.addComponent(cc.Sprite);
            sprite.sizeMode = cc.Sprite.SizeMode.CUSTOM;
            sprite.spriteFrame = bb.color.__white;
            node.color = new cc.Color().fromHEX(hex);
            return node;
        },
        // A w x h node painted with the game's own top -> bottom gradient material, for previews.
        gradientNode: function (top, bottom, w, h) {
            var node = new cc.Node('gradient');
            node.setContentSize(w, h);
            paintGradient(node, top, bottom);
            return node;
        },
    };
})();
