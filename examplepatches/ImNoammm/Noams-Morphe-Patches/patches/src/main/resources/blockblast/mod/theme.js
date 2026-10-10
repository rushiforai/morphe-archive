// Colour theme: the app's [data-theme] looks (themes/color.json) on the game screen. Paints the root and
// Classic background gradients, puts the theme's filter matrix on the board frame (Board/boardGrid) and
// colours the ClassWin/ClassFail gradients; Original restores the captured stock values.
(function () {
    var THEMES = (window.__bbmod.theme && window.__bbmod.theme.themes) || [{ id: 'classic', label: 'Original', bgTop: '#4a6fd0', bgBottom: '#2f4a9a', boardFilter: 'none', resultTop: '#183db2', resultBottom: '#1487d8' }];
    var DATA = {};
    THEMES.forEach(function (t) { DATA[t.id] = t; });

    function picked() { return DATA[bb.get('theme', 'value')] || DATA.classic; }

    // The game paints backgrounds with two gradient materials: "gradient" (topColor/bottomColor; the root,
    // home and result screens) and "gradient_mid" (beginColor bottom, middleColor top; the Classic game
    // background). Stock colours are captured from the variant on first touch, so Original restores exactly.
    function gradientMaterial(node) {
        var sprite = node && node.getComponent(cc.Sprite);
        var material = sprite && sprite.getMaterial(0);
        var name = material && material.effectAsset && material.effectAsset.name;
        return name === 'gradient' || name === 'gradient_mid' ? material : null;
    }

    function vec4(hex) { var c = new cc.Color().fromHEX(hex); return new cc.Vec4(c.r / 255, c.g / 255, c.b / 255, 1); }
    function clone4(v) { return v && v.x !== undefined ? new cc.Vec4(v.x, v.y, v.z, v.w) : null; }

    // top/bottom null -> restore the captured stock colours.
    function paintGradientOn(node, top, bottom) {
        var material = gradientMaterial(node);
        if (!material) return false;
        var mid = material.effectAsset.name === 'gradient_mid';
        var keys = mid ? ['middleColor', 'beginColor'] : ['topColor', 'bottomColor']; // [top, bottom]
        if (!material.__bbStock) {
            try {
                material.__bbStock = { top: clone4(material.getProperty(keys[0], 0)), bottom: clone4(material.getProperty(keys[1], 0)) };
            } catch (e) { material.__bbStock = null; }
        }
        var stock = material.__bbStock;
        if (!top || !bottom) {
            if (!stock || !stock.top) return false;
            material.setProperty(keys[0], stock.top);
            material.setProperty(keys[1], stock.bottom);
            return true;
        }
        material.setProperty(keys[0], vec4(top));
        material.setProperty(keys[1], vec4(bottom));
        return true;
    }

    bb.feature('theme', {
        title: 'Color theme',
        settings: [
            {
                key: 'value', type: 'theme', label: 'Color theme', def: 'classic', order: 1,
                values: THEMES.map(function (t) { return { v: t.id, label: t.label }; }),
                preview: function (v, w, h) {
                    var t = DATA[v];
                    var node = bb.color.gradientNode(t.bgTop, t.bgBottom, w, h);
                    // the board frame with the theme's filter, cubes in the original palette (as the app's tile)
                    var board = bb.color.sprite('#252e5c', h * 0.62, h * 0.62);
                    var grid = cc.find('persist/gameUiLayer/ClassGame/boardContainer/Board/boardGrid');
                    var gridSprite = grid && grid.getComponent(cc.Sprite);
                    if (gridSprite && gridSprite.spriteFrame) {
                        board.getComponent(cc.Sprite).spriteFrame = gridSprite.spriteFrame;
                        board.color = cc.Color.WHITE;
                    }
                    bb.color.apply(board.getComponent(cc.Sprite), bb.color.parse(t.boardFilter));
                    node.addChild(board);
                    // the app's colour tile: cubes 1,5,2 on one row, 7,4 under them
                    var cubes = [[1, 0, 0], [5, 1, 0], [2, 2, 0], [7, 0, 1], [4, 1, 1]], cell = h * 0.62 / 4;
                    cubes.forEach(function (c) {
                        var cube = bb.color.sprite(bb.color.CUBES[c[0] - 1], cell - 3, cell - 3);
                        cube.x = -cell * 1.5 + c[1] * cell;
                        cube.y = cell / 2 - c[2] * cell;
                        board.addChild(cube);
                    });
                    return node;
                },
            },
        ],
        start: function () {
            function paint() {
                var t = picked(), original = t.id === 'classic';
                var top = original ? null : t.bgTop, bottom = original ? null : t.bgBottom;
                var okBg = paintGradientOn(cc.find('persist/bg'), top, bottom);
                // the Classic game screen draws its own gradient over the root; paint it too
                var okGame = paintGradientOn(cc.find('persist/gameUiLayer/ClassGame/bgContainer'), top, bottom);
                var grid = cc.find('persist/gameUiLayer/ClassGame/boardContainer/Board/boardGrid');
                var sprite = grid && grid.getComponent(cc.Sprite);
                if (sprite) bb.color.apply(sprite, original ? null : bb.color.parse(t.boardFilter));
                return okBg && okGame && !!sprite;
            }

            // The nodes appear during boot; keep trying once a frame until the first paint lands.
            var stop = bb.frame(function () { if (paint()) stop(); });

            bb.sub(function (id) { if (id === 'theme') { paint(); paintResults(); } });
            // A skin change repaints the shared background; assert the theme's colours after it.
            bb.onEvent('E_ClassSkin_GameBg', function () { setTimeout(paint, 0); });

            function paintResultRoot(screen) {
                var t = picked(), original = t.id === 'classic';
                for (var i = 0; i < 6 && screen; i++) {
                    if (paintGradientOn(screen, original ? null : t.resultTop, original ? null : t.resultBottom)) return;
                    var next = null;
                    for (var j = 0; j < screen.children.length && !next; j++) if (gradientMaterial(screen.children[j])) next = screen.children[j];
                    screen = next || screen.children[0];
                }
            }
            function paintResults() {
                ['ClassFail', 'ClassWin', 'classFail', 'classWin'].forEach(function (name) {
                    var node = bb.ui.find(cc.director.getScene(), name);
                    if (node && node.activeInHierarchy) paintResultRoot(node);
                });
            }
            bb.ui.onScreen('ClassFail', paintResultRoot);
            bb.ui.onScreen('ClassWin', paintResultRoot);
        },
    });
})();
