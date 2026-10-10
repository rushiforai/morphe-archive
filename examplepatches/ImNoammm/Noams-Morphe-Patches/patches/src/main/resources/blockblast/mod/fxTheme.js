// Animation theme: the app's fx themes (themes/fx.json) as one colour matrix over the effect art (praise,
// combo, Perfect, new-best, score tips, eliminate effects, the win celebration). Board cubes, tray and UI
// stay untouched. Rainbow re-uploads its matrix every frame (one hue turn each 3 s, saturate first).
(function () {
    var THEMES = (window.__bbmod.fxTheme && window.__bbmod.fxTheme.themes) || [{ id: 'original', label: 'Original', css: 'none', animated: false }];
    var DATA = {}, staticMatrix = {}, liveNodes = [];
    THEMES.forEach(function (t) { DATA[t.id] = t; });

    function matrixFor(id, now) {
        var t = DATA[id];
        if (!t || t.css === 'none') return null;
        if (t.animated) {
            var base = staticMatrix.__rainbowBase = staticMatrix.__rainbowBase || bb.color.parse('saturate(1.4)');
            return bb.color.then(base, bb.color.hue(((now % 3000) / 3000) * 360));
        }
        if (!(id in staticMatrix)) staticMatrix[id] = bb.color.parse(t.css);
        return staticMatrix[id];
    }

    bb.feature('fxTheme', {
        title: 'Animation theme',
        settings: [
            {
                key: 'value', type: 'theme', label: 'Animation theme', def: 'original', order: 4,
                values: THEMES.map(function (t) { return { v: t.id, label: t.label }; }),
                preview: function (v, w, h) {
                    var node = bb.color.sprite('#0d1530', w, h);
                    var comps = [];
                    [[1, -0.28], [5, 0], [2, 0.28]].forEach(function (c) {
                        var cube = bb.color.sprite(bb.color.CUBES[c[0] - 1], h * 0.3, h * 0.3);
                        cube.x = c[1] * w;
                        cube.y = h * 0.16;
                        node.addChild(cube);
                        comps.push(cube.getComponent(cc.Sprite));
                    });
                    var word = new cc.Node('combo');
                    var label = word.addComponent(cc.Label);
                    label.string = 'Combo';
                    label.fontSize = 34;
                    label.enableBold = true;
                    word.color = new cc.Color().fromHEX('#ffc83d');
                    word.y = -h * 0.24;
                    node.addChild(word);
                    comps.push(label);
                    function tint(now) {
                        var m = matrixFor(v, now || 0);
                        comps.forEach(function (comp) { bb.color.apply(comp, m); });
                    }
                    tint(0);
                    if (DATA[v] && DATA[v].animated) {
                        var stop = bb.frame(function () {
                            if (!cc.isValid(node)) return stop();
                            tint(Date.now());
                        });
                    }
                    return node;
                },
                // The app's live preview loops a real effect above the tiles; the Perfect burst is the
                // game's own DragonBones effect. The panel is outside the swept effect layers, so the
                // live node is registered for sweeping explicitly (liveNodes).
                live: function (w, h) {
                    var node = bb.color.sprite('#0d1530', w, h);
                    node.__bbSkipSelf = true; // the dark backdrop itself stays untinted
                    try {
                        var config = bb.module('PrefabConfig').PrefabConfig.RightPutPerfect;
                        bb.module('ResLoader').ResLoader.load(config.url, cc.Prefab, function (err, prefab) {
                            if (err || !cc.isValid(node)) return;
                            var effect = cc.instantiate(prefab);
                            effect.scale = Math.min(0.5, w / 760);
                            node.addChild(effect);
                            var display = effect.getComponent(dragonBones.ArmatureDisplay) ||
                                effect.getComponentInChildren(dragonBones.ArmatureDisplay);
                            if (display) display.addEventListener(dragonBones.EventObject.COMPLETE, function () {
                                if (cc.isValid(display) && display.animationName) display.playAnimation(display.animationName, 1);
                            });
                        });
                    } catch (e) { bb.log('fxTheme live preview failed:', e); }
                    liveNodes.push(node);
                    return node;
                },
            },
        ],
        start: function () {
            var PATHS = [
                'persist/gameEffectLayer',
                'persist/effectLayer',
                'persist/tipLayer',
                'persist/gameUiLayer/ClassGame/boardContainer/Board/EliminateEffectLayer',
                'persist/gameUiLayer/ClassGame/topContainer/ClassTopInfo/currentNode/ComboTipsNew',
                'persist/gameUiLayer/ClassGame/topContainer/ClassTopInfo/currentNode/comnb_ske',
            ];
            var extraRoots = []; // result celebrations while they are open

            function eachRender(node, fn) {
                if (!node || node.name === 'bbmodParticles') return;
                if (!node.__bbSkipSelf) {
                    var comps = node._components;
                    for (var i = 0; i < comps.length; i++) {
                        var comp = comps[i];
                        if (comp instanceof cc.Sprite || comp instanceof cc.Label ||
                            (window.dragonBones && comp instanceof dragonBones.ArmatureDisplay) ||
                            (window.sp && comp instanceof sp.Skeleton)) fn(comp);
                    }
                }
                for (var j = 0; j < node.children.length; j++) eachRender(node.children[j], fn);
            }

            var mine = []; // only the components this feature tinted (the board/button matrices are others')
            bb.frame(function () {
                var id = bb.get('fxTheme', 'value');
                var t = DATA[id];
                if (!t || t.css === 'none') {
                    if (mine.length) {
                        mine.forEach(function (comp) { comp.__bbFxTheme = false; bb.color.restore(comp); });
                        mine = [];
                    }
                    return;
                }
                var m = matrixFor(id, Date.now());
                var apply = function (comp) {
                    if (!comp.__bbColor) {
                        bb.color.apply(comp, m);
                        comp.__bbFxTheme = true;
                        mine.push(comp);
                    } else if (comp.__bbFxTheme && (t.animated || comp.__bbColor.t !== m)) {
                        bb.color.apply(comp, m);
                    }
                };
                for (var i = mine.length - 1; i >= 0; i--) if (!cc.isValid(mine[i])) mine.splice(i, 1);
                for (i = liveNodes.length - 1; i >= 0; i--) {
                    if (!cc.isValid(liveNodes[i])) liveNodes.splice(i, 1);
                    else eachRender(liveNodes[i], apply);
                }
                PATHS.forEach(function (path) { eachRender(cc.find(path), apply); });
                for (var i = extraRoots.length - 1; i >= 0; i--) {
                    if (!cc.isValid(extraRoots[i]) || !extraRoots[i].activeInHierarchy) extraRoots.splice(i, 1);
                    else eachRender(extraRoots[i], function (comp) {
                        // result screens: armatures only, their sprites belong to the colour theme
                        if (window.dragonBones && comp instanceof dragonBones.ArmatureDisplay) apply(comp);
                    });
                }
            });
            ['ClassWin', 'ClassFail'].forEach(function (name) {
                bb.ui.onScreen(name, function (screen) { extraRoots.push(screen); });
            });
            // The praise/combo effects mount on gameUiLayer (next to the game itself), so the layer sweep
            // cannot cover them; each shown effect screen is swept whole instead.
            ['Encourage', 'ComboBase', 'NewBestScoreEffect', 'unbelievable'].forEach(function (name) {
                bb.ui.onScreen(name, function (screen) { liveNodes.push(screen); });
            });
        },
    });
})();
