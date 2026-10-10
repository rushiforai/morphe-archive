// Block themes: the app's block looks as PNGs under assets/blocks/<style>/<1..8|gray>.png. A picked
// style replaces every cube sprite the game takes from its atlas (game_cube_1..8) and keeps the skin
// block material off so skins cannot recolour underneath; each style previews as six cubes.
(function () {
    var frames = {}; // style -> { colourId -> SpriteFrame }

    function frame(style, id, ready) {
        var byId = frames[style] = frames[style] || {};
        if (byId[id]) return ready(byId[id]);
        cc.assetManager.loadRemote('blocks/' + style + '/' + id + '.png', { ext: '.png' }, function (err, texture) {
            if (err || !texture) return bb.log('blockTheme: load failed', style, id, err);
            if (!byId[id]) byId[id] = new cc.SpriteFrame(texture);
            ready(byId[id]);
        });
    }

    bb.feature('blockTheme', {
    title: 'Block theme',
    settings: [
        {
            key: 'style', type: 'theme', label: 'Block theme', def: 'original', order: 3,
            values: (window.__bbmod.blockTheme && window.__bbmod.blockTheme.styles) || [{ v: 'original', label: 'Original' }],
            preview: function (v, w, h) {
                var node = bb.color.sprite('#10131c', w, h);
                var cell = Math.min(h * 0.42, w / 3.6);
                for (var i = 0; i < 6; i++) {
                    var cube = bb.color.sprite(bb.color.CUBES[i], cell, cell);
                    cube.x = (i % 3 - 1) * cell;
                    cube.y = (i < 3 ? 0.5 : -0.5) * cell;
                    node.addChild(cube);
                    if (v !== 'original') (function (cube) {
                        frame(v, i + 1, function (sf) {
                            if (!cc.isValid(cube)) return;
                            cube.color = cc.Color.WHITE;
                            cube.getComponent(cc.Sprite).spriteFrame = sf;
                        });
                    })(cube);
                }
                return node;
            },
        },
    ],
    start: function () {
        function styleActive() {
            var style = bb.get('blockTheme', 'style');
            return style && style !== 'original' ? style : null;
        }

        bb.on('Block', function (exports) {
            bb.wrap(exports.default.prototype, 'loadBlockSpriteFrame', function (original) {
                return function (id) {
                    var style = styleActive();
                    if (!style || !(id >= 1 && id <= 8)) return original.apply(this, arguments);
                    var self = this;
                    frame(style, id, function (sf) {
                        if (self.block && cc.isValid(self.block.node)) self.block.spriteFrame = sf;
                    });
                };
            });
        });

        // With a theme on, the skin path must not swap the sprite to the skin's block asset.
        bb.on('BlockMaterialUpdate', function (exports) {
            bb.wrap(exports.default.prototype, 'setMaterial', function (original) {
                return function (useSkin) {
                    return original.call(this, styleActive() ? false : useSkin);
                };
            });
        });

        // A style change repaints every block that is already on screen.
        bb.sub(function (id, key) {
            if (id !== 'blockTheme') return;
            var Block = bb.module('Block');
            if (!Block) return;
            (function walk(node) {
                var comp = node.getComponent(Block.default);
                if (comp && comp.state) {
                    try {
                        comp._lastColor = -999;
                        comp.render();
                    } catch (e) { }
                }
                for (var i = 0; i < node.children.length; i++) walk(node.children[i]);
            })(cc.director.getScene());
        });
    },
    });
})();
