// Menu theme: the app's [data-menu-theme] looks (themes/menu.json) on the home screen, which draws its
// own "gradient" sprite over persist/bg. Original follows the colour theme, as the app's --menu-top
// fallback does; a picked theme also filters the Classic button.
(function () {
    var THEMES = (window.__bbmod.menuTheme && window.__bbmod.menuTheme.themes) || [{ id: 'original', label: 'Original', top: null, bottom: null, btnFilter: null }];
    var DATA = {};
    THEMES.forEach(function (t) { DATA[t.id] = t; });

    function colourTheme() {
        var themes = (window.__bbmod.theme && window.__bbmod.theme.themes) || [];
        var id = bb.get('theme', 'value');
        for (var i = 0; i < themes.length; i++) if (themes[i].id === id) return themes[i];
        return { bgTop: '#4a6fd0', bgBottom: '#2f4a9a' };
    }

    function picked() { return DATA[bb.get('menuTheme', 'value')] || DATA.original; }

    bb.feature('menuTheme', {
        title: 'Menu theme',
        settings: [
            {
                key: 'value', type: 'theme', label: 'Menu theme', def: 'original', order: 2,
                values: THEMES.map(function (t) { return { v: t.id, label: t.label }; }),
                preview: function (v, w, h) {
                    var t = DATA[v], base = colourTheme();
                    var node = bb.color.gradientNode(t.top || base.bgTop, t.bottom || base.bgBottom, w, h);
                    node.__bbRefresh = function () { // Original follows the colour theme pick
                        var b = colourTheme();
                        bb.color.paintGradient(node, t.top || b.bgTop, t.bottom || b.bgBottom);
                    };
                    // the real home art: the logo above the Classic button, the button carrying the filter
                    var logo = cc.find('persist/logo'), logoSprite = logo && logo.getComponent(cc.Sprite);
                    if (logoSprite && logoSprite.spriteFrame) {
                        var l = new cc.Node('logo');
                        var ls = l.addComponent(cc.Sprite);
                        ls.spriteFrame = logoSprite.spriteFrame;
                        l.scale = (w * 0.55) / Math.max(1, logoSprite.spriteFrame.getRect().width);
                        l.y = h * 0.22;
                        node.addChild(l);
                    }
                    var btnNode = cc.find('persist/uiLayer/homePage/btn_layout/btn_Classics');
                    var btnSprite = btnNode && btnNode.getComponent(cc.Sprite);
                    var btn;
                    if (btnSprite && btnSprite.spriteFrame) {
                        btn = new cc.Node('classic');
                        var bs = btn.addComponent(cc.Sprite);
                        bs.spriteFrame = btnSprite.spriteFrame;
                        btn.scale = (w * 0.6) / Math.max(1, btnSprite.spriteFrame.getRect().width);
                    } else {
                        btn = bb.color.sprite('#2fbf8f', w * 0.6, h * 0.24);
                    }
                    btn.y = -h * 0.18;
                    bb.color.apply(btn.getComponent(cc.Sprite), bb.color.parse(t.btnFilter));
                    node.addChild(btn);
                    return node;
                },
            },
        ],
        start: function () {
            // The gear popup and the Mod panel (bb.menuTint) follow the menu look, driven by the
            // theme's gradient blends rather than its brightest stop; Original restores the stock tint.
            function currentGradient() {
                var t = picked();
                if (t.top) return [t.top, t.bottom];
                var base = colourTheme();
                return base.id && base.id !== 'classic' ? [base.bgTop, base.bgBottom] : null;
            }
            function mix(a, b, t) {
                var ca = new cc.Color().fromHEX(a), cb = new cc.Color().fromHEX(b);
                return cc.color(Math.round(ca.r + (cb.r - ca.r) * t), Math.round(ca.g + (cb.g - ca.g) * t),
                    Math.round(ca.b + (cb.b - ca.b) * t), 255);
            }
            bb.menuTint = function () {
                var g = currentGradient();
                if (!g) return null;
                var c = mix(g[0], g[1], 0.5);
                return '#' + [c.r, c.g, c.b].map(function (v) { return (256 + v).toString(16).slice(1); }).join('');
            };

            // Every background sprite of the popup; buttons, icons and labels keep their own colours.
            // The art is saturated blue, so a node tint could only darken it: a luminance->colour
            // matrix through the shader re-hues it and keeps the art's shading.
            function lumaTint(color, gain) {
                var L = [0.2126, 0.7152, 0.0722], t = { r: [], o: [0, 0, 0] };
                [color.r, color.g, color.b].forEach(function (v) {
                    L.forEach(function (l) { t.r.push((v / 255) * gain * l); });
                });
                return t;
            }
            function tintSetup() {
                var setup = cc.find('persist/gameAlertLayer/Setup');
                if (!setup) return;
                var g = currentGradient();
                var outer = g && lumaTint(mix(g[0], g[1], 0.65), 1.6);
                var inner = g && lumaTint(mix(g[0], g[1], 0.3), 1.6);
                (function walk(node) {
                    var sprite = node.getComponent(cc.Sprite);
                    var frame = sprite && sprite.spriteFrame && sprite.spriteFrame.name;
                    if (frame && (frame.lastIndexOf('common_bg', 0) === 0 || frame.lastIndexOf('setting_bg', 0) === 0)) {
                        node.color = cc.Color.WHITE;
                        bb.color.apply(sprite, g ? (frame.indexOf('_up') >= 0 || frame.indexOf('steUp') >= 0 ? inner : outer) : null);
                    }
                    node.children.forEach(walk);
                })(setup);
            }
            bb.ui.onScreen('Setup', function () { tintSetup(); });

            function paint() {
                tintSetup();
                var home = cc.find('persist/uiLayer/homePage');
                var sprite = home && home.getComponent(cc.Sprite);
                var material = sprite && sprite.getMaterial(0);
                if (!material || !material.effectAsset || material.effectAsset.name !== 'gradient') return false;
                var t = picked(), base = colourTheme();
                var v = function (hex) { var c = new cc.Color().fromHEX(hex); return new cc.Vec4(c.r / 255, c.g / 255, c.b / 255, 1); };
                material.setProperty('topColor', v(t.top || base.bgTop));
                material.setProperty('bottomColor', v(t.bottom || base.bgBottom));
                var btn = cc.find('persist/uiLayer/homePage/btn_layout/btn_Classics');
                if (btn) {
                    var matrix = bb.color.parse(t.btnFilter);
                    (function walk(node) {
                        var render = node.getComponent(cc.Sprite) || node.getComponent(cc.Label);
                        if (render) bb.color.apply(render, matrix);
                        node.children.forEach(walk);
                    })(btn);
                }
                return true;
            }

            var stop = bb.frame(function () { if (paint()) stop(); });
            bb.sub(function (id) { if (id === 'menuTheme' || id === 'theme') paint(); });
            bb.ui.onScreen('HomePage', function () { paint(); });
        },
    });
})();
