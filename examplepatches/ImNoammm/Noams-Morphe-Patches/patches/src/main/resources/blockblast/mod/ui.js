// The Mod settings screen: a panel listing every feature's controls (core.js holds the values), built
// from plain nodes so no art is added to the APK. 'theme' settings are not rows: they fill a Themes page
// of preview tiles; each supplies preview(value, w, h) -> node (optional __bbRefresh) and live(w, h).
(function () {
    var PANEL_W = 850, ROW_H = 96, HEADER_H = 76, PAD = 40;
    var TILE_COLS = 3, TILE_GAP = 18, TILE_PAD = 10, PREVIEW_H = 150, TILE_LABEL_H = 44;
    var COLORS = {
        backdrop: cc.color(0, 0, 0, 160),
        panel: cc.color(38, 53, 114),
        header: cc.color(150, 165, 215),
        row: cc.color(255, 255, 255, 14),
        text: cc.color(255, 255, 255),
        note: cc.color(160, 172, 210),
        on: cc.color(88, 199, 92),
        off: cc.color(84, 96, 140),
        control: cc.color(255, 255, 255, 28),
        tile: cc.color(0, 0, 0, 46),
        tileOn: cc.color(101, 196, 107),
    };
    var root = null, scrolled = false;
    var screenCallbacks = {};
    var panel = null; // { title, back, content, viewH, page, tiles }

    function node(name, w, h) {
        var n = new cc.Node(name);
        if (w !== undefined) { n.width = w; n.height = h; }
        return n;
    }

    function roundRect(name, w, h, color, radius) {
        var n = node(name, w, h);
        var g = n.addComponent(cc.Graphics);
        g.fillColor = color;
        g.roundRect(-w / 2, -h / 2, w, h, Math.min(radius || 0, h / 2));
        g.fill();
        return n;
    }

    function repaintRect(n, color, radius) {
        var g = n.getComponent(cc.Graphics);
        g.clear();
        g.fillColor = color;
        g.roundRect(-n.width / 2, -n.height / 2, n.width, n.height, Math.min(radius || 0, n.height / 2));
        g.fill();
    }

    function label(text, size, color, bold) {
        var n = new cc.Node('label');
        var l = n.addComponent(cc.Label);
        l.string = text;
        l.fontSize = size;
        l.lineHeight = size + 8;
        if (bold && 'enableBold' in l) l.enableBold = true;
        n.color = color || COLORS.text;
        return n;
    }

    function bound(n, w, h) {
        var l = n.getComponent(cc.Label);
        l.overflow = cc.Label.Overflow.SHRINK;
        l.horizontalAlign = cc.Label.HorizontalAlign.LEFT;
        l.verticalAlign = cc.Label.VerticalAlign.CENTER;
        n.anchorX = 0;
        n.width = w;
        n.height = h;
    }

    // A tap that never fires when the finger was scrolling the list.
    function tap(n, fn) {
        n.on(cc.Node.EventType.TOUCH_END, function () {
            if (scrolled) return;
            try { fn(); } catch (e) { bb.log('ui tap failed:', e, e && e.stack); }
        });
    }

    function findNode(base, name) {
        if (base.name === name) return base;
        var children = base.children;
        for (var i = 0; i < children.length; i++) {
            var hit = findNode(children[i], name);
            if (hit) return hit;
        }
        return null;
    }

    function controlToggle(id, s) {
        var n = roundRect('toggle', 120, 60, COLORS.off, 30);
        var g = n.getComponent(cc.Graphics);
        var knob = node('knob', 48, 48);
        var kg = knob.addComponent(cc.Graphics);
        kg.fillColor = cc.Color.WHITE;
        kg.circle(0, 0, 24);
        kg.fill();
        n.addChild(knob);
        function paint() {
            var on = !!bb.get(id, s.key);
            g.clear();
            g.fillColor = on ? COLORS.on : COLORS.off;
            g.roundRect(-60, -30, 120, 60, 30);
            g.fill();
            knob.x = on ? 28 : -28;
        }
        paint();
        tap(n, function () { bb.set(id, s.key, !bb.get(id, s.key)); paint(); });
        return n;
    }

    function smallButton(text, fn, w) {
        var n = roundRect('btn', w || 64, 64, COLORS.control, 16);
        var t = label(text, w ? 30 : 40, COLORS.text, !!w);
        t.y = 2;
        n.addChild(t);
        tap(n, fn);
        return n;
    }

    function valueLabel(width, size) {
        var n = label('', size || 32, COLORS.text);
        var l = n.getComponent(cc.Label);
        l.overflow = cc.Label.Overflow.SHRINK;
        l.horizontalAlign = cc.Label.HorizontalAlign.CENTER;
        l.verticalAlign = cc.Label.VerticalAlign.CENTER;
        n.width = width;
        n.height = 52;
        return n;
    }

    function controlNumber(id, s) {
        var n = node('number', 300, 64);
        var value = valueLabel(140);
        function paint() { value.getComponent(cc.Label).string = String(bb.get(id, s.key)); }
        function move(dir) {
            var step = s.step || 1;
            var next = Math.round(((Number(bb.get(id, s.key)) || 0) + dir * step) * 1000) / 1000;
            if (s.min !== undefined) next = Math.max(s.min, next);
            if (s.max !== undefined) next = Math.min(s.max, next);
            bb.set(id, s.key, next);
            paint();
        }
        var minus = smallButton('−', function () { move(-1); });
        var plus = smallButton('+', function () { move(1); });
        minus.x = -118; plus.x = 118;
        paint();
        n.addChild(minus); n.addChild(value); n.addChild(plus);
        return n;
    }

    function controlChoice(id, s) {
        var n = node('choice', 340, 64);
        var value = valueLabel(200, 30);
        function index() {
            var v = bb.get(id, s.key);
            for (var i = 0; i < s.values.length; i++) if (s.values[i].v === v) return i;
            return 0;
        }
        function paint() { value.getComponent(cc.Label).string = s.values[index()].label; }
        function move(dir) {
            var list = s.values;
            bb.set(id, s.key, list[(index() + dir + list.length) % list.length].v);
            paint();
        }
        var prev = smallButton('<', function () { move(-1); });
        var next = smallButton('>', function () { move(1); });
        prev.x = -138; next.x = 138;
        paint();
        n.addChild(prev); n.addChild(value); n.addChild(next);
        return n;
    }

    // A two-step button ('action' settings): the first tap arms it, the second runs s.run().
    function controlAction(id, s) {
        var armed = false;
        var btn = smallButton(s.button || 'Run', function () {
            if (s.confirm && !armed) {
                armed = true;
                btn.getComponentInChildren(cc.Label).string = s.confirm;
                return;
            }
            armed = false;
            btn.getComponentInChildren(cc.Label).string = s.button || 'Run';
            s.run();
        }, 220);
        return btn;
    }

    // Every theme setting of every enabled feature, in the order the app lists them.
    function themeSettings() {
        var list = [];
        bb.order.forEach(function (id) {
            var def = bb.features[id];
            ((def && def.settings) || []).forEach(function (s) { if (s.type === 'theme') list.push({ id: id, s: s }); });
        });
        return list.sort(function (a, b) { return (a.s.order || 0) - (b.s.order || 0); });
    }

    function makePlacer(content) {
        var y = 0;
        return {
            place: function (n, h) {
                n.y = y - h / 2;
                content.addChild(n);
                y -= h;
            },
            height: function () { return -y; },
        };
    }

    function header(text, width) {
        var h = label(text.toUpperCase(), 26, COLORS.header, true);
        h.anchorX = 0;
        h.x = -width / 2 + 10;
        return h;
    }

    // A row: label (+ note) on the left, the control on the right; tapping anywhere runs onTap if given.
    function row(text, note, width, control, onTap) {
        var h = note ? ROW_H + 26 : ROW_H;
        var r = roundRect('row', width, h - 12, COLORS.row, 20);
        var textWidth = width - 52 - (control ? control.width + 30 : 0);
        var t = label(text, 32, COLORS.text);
        bound(t, textWidth, 44);
        t.x = -width / 2 + 26;
        t.y = note ? 16 : 0;
        r.addChild(t);
        if (note) {
            var nt = label(note, 22, COLORS.note);
            bound(nt, textWidth, 30);
            nt.x = -width / 2 + 26;
            nt.y = -22;
            r.addChild(nt);
        }
        if (control) {
            control.x = width / 2 - 26 - control.width / 2;
            r.addChild(control);
        }
        if (onTap) tap(r, onTap);
        return { node: r, height: h };
    }

    function buildRows(content, width) {
        var at = makePlacer(content);
        var themes = themeSettings();
        if (themes.length) {
            var chevron = label('›', 56, COLORS.text, true);
            chevron.width = 40;
            var names = themes.map(function (t) { return t.s.label.replace(/ theme$/i, '').toLowerCase(); });
            var r = row('Themes', 'Pick the ' + names.join(', ') + ' look, with previews', width, chevron, function () { showPage('themes'); });
            at.place(node('gap', width, 12), 12);
            at.place(r.node, r.height);
        }
        bb.order.forEach(function (id) {
            var def = bb.features[id];
            var settings = ((def && def.settings) || []).filter(function (s) { return s.type !== 'theme'; });
            if (!settings.length) return;
            at.place(header(def.title || id, width), HEADER_H);
            settings.forEach(function (s) {
                var control = null;
                if (s.type === 'toggle') control = controlToggle(id, s);
                else if (s.type === 'number') control = controlNumber(id, s);
                else if (s.type === 'choice') control = controlChoice(id, s);
                else if (s.type === 'action') control = controlAction(id, s);
                var r = row(s.label, s.note, width, control);
                if (s.type === 'info') r.node.children[0].color = COLORS.note;
                at.place(r.node, r.height);
            });
        });
        // Data: every mod setting back to its default (the app's Reset settings)
        at.place(header('Data', width), HEADER_H);
        var reset = { button: 'Reset', confirm: 'Confirm', run: function () { bb.reset(); showPage('main'); } };
        var r = row('Reset mod settings', 'Every setting here back to its default', width, controlAction('modData', reset));
        at.place(r.node, r.height);
        return at.height();
    }

    // The Themes page: one grid of preview tiles per theme setting.
    function tile(id, s, value, width) {
        var h = TILE_PAD * 2 + PREVIEW_H + TILE_LABEL_H;
        var n = roundRect('tile', width, h, COLORS.tile, 22);
        var preview = null;
        try { preview = s.preview(value.v, width - TILE_PAD * 2, PREVIEW_H); } catch (e) { bb.log('theme preview failed:', id, value.v, e, e && e.stack); }
        if (preview) {
            preview.y = h / 2 - TILE_PAD - PREVIEW_H / 2;
            n.addChild(preview);
        }
        var t = label(value.label, 26, COLORS.text, true);
        var l = t.getComponent(cc.Label);
        l.cacheMode = cc.Label.CacheMode.CHAR;
        l.overflow = cc.Label.Overflow.SHRINK;
        l.horizontalAlign = cc.Label.HorizontalAlign.CENTER;
        l.verticalAlign = cc.Label.VerticalAlign.CENTER;
        t.width = width - TILE_PAD * 2;
        t.height = TILE_LABEL_H;
        t.y = -h / 2 + TILE_PAD + TILE_LABEL_H / 2;
        n.addChild(t);
        var entry = { id: id, s: s, v: value.v, node: n, preview: preview };
        panel.tiles.push(entry);
        tap(n, function () { bb.set(id, s.key, value.v); });
        return entry;
    }

    function paintTiles() {
        if (!panel || !panel.tiles) return;
        panel.tiles.forEach(function (t) {
            if (!cc.isValid(t.node)) return;
            repaintRect(t.node, bb.get(t.id, t.s.key) === t.v ? COLORS.tileOn : COLORS.tile, 22);
            if (t.preview && t.preview.__bbRefresh) {
                try { t.preview.__bbRefresh(); } catch (e) { bb.log('theme preview refresh failed:', e); }
            }
        });
    }

    function buildThemes(content, width) {
        var at = makePlacer(content);
        panel.tiles = [];
        var tileW = (width - TILE_GAP * (TILE_COLS - 1)) / TILE_COLS;
        var tileH = TILE_PAD * 2 + PREVIEW_H + TILE_LABEL_H;
        themeSettings().forEach(function (entry) {
            var id = entry.id, s = entry.s;
            at.place(header(s.label, width), HEADER_H);
            if (s.live) {
                var liveH = 300, live = null;
                try { live = s.live(width, liveH); } catch (e) { bb.log('theme live preview failed:', id, e, e && e.stack); }
                if (live) { at.place(live, liveH); at.place(node('gap', width, TILE_GAP), TILE_GAP); }
            }
            for (var i = 0; i < s.values.length; i += TILE_COLS) {
                var line = node('tiles', width, tileH);
                for (var c = 0; c < TILE_COLS && i + c < s.values.length; c++) {
                    var t = tile(id, s, s.values[i + c], tileW);
                    t.node.x = -width / 2 + tileW / 2 + c * (tileW + TILE_GAP);
                    line.addChild(t.node);
                }
                at.place(line, tileH + TILE_GAP);
            }
        });
        paintTiles();
        return at.height();
    }

    function showPage(name) {
        if (!panel || !cc.isValid(panel.content)) return;
        panel.page = name;
        var content = panel.content, old = content.children.slice();
        content.removeAllChildren();
        old.forEach(function (c) { c.destroy(); });
        panel.tiles = null;
        var width = PANEL_W - 88;
        content.height = name === 'themes' ? buildThemes(content, width) : buildRows(content, width);
        content.y = panel.viewH / 2;
        panel.title.getComponent(cc.Label).string = name === 'themes' ? 'Themes' : 'Mod settings';
        panel.back.active = name !== 'main';
    }

    function openPanel() {
        if (root && cc.isValid(root)) return;
        var scene = cc.director.getScene();
        var parent = scene.getChildByName('persist') || scene;
        var win = cc.winSize;
        root = node('bbmodUI');
        root.zIndex = 9999;
        parent.addChild(root);

        var backdrop = roundRect('backdrop', win.width + 4, win.height + 4, COLORS.backdrop, 0);
        backdrop.addComponent(cc.BlockInputEvents);
        tap(backdrop, closePanel);
        root.addChild(backdrop);

        var panelH = Math.min(win.height - 260, 1560);
        // the panel follows the menu theme's tone (bb.menuTint, from the menu-theme feature)
        var fill = COLORS.panel;
        var tint = bb.menuTint && bb.menuTint();
        if (tint) {
            var c = new cc.Color().fromHEX(tint);
            fill = cc.color(Math.round((c.r + COLORS.panel.r) / 2 * 0.8), Math.round((c.g + COLORS.panel.g) / 2 * 0.8),
                Math.round((c.b + COLORS.panel.b) / 2 * 0.8), 255);
        }
        var box = roundRect('panel', PANEL_W, panelH, fill, 36);
        tap(box, function () {});
        root.addChild(box);

        var title = label('Mod settings', 44, COLORS.text, true);
        title.y = panelH / 2 - 64;
        box.addChild(title);

        var close = roundRect('close', 84, 84, COLORS.control, 24);
        var closeText = label('✕', 40, COLORS.text);
        closeText.y = 2;
        close.addChild(closeText);
        close.x = PANEL_W / 2 - 70;
        close.y = panelH / 2 - 64;
        tap(close, closePanel);
        box.addChild(close);

        var back = roundRect('back', 150, 84, COLORS.control, 24);
        var backText = label('‹ Back', 32, COLORS.text, true);
        backText.y = 2;
        back.addChild(backText);
        back.x = -PANEL_W / 2 + 104;
        back.y = panelH / 2 - 64;
        back.active = false;
        tap(back, function () { showPage('main'); });
        box.addChild(back);

        var viewH = panelH - 160;
        var view = node('view', PANEL_W - 48, viewH);
        view.y = -56;
        view.addComponent(cc.Mask);
        box.addChild(view);

        var content = node('content', PANEL_W - 88, 0);
        content.anchorY = 1;
        view.addChild(content);
        panel = { title: title, back: back, content: content, viewH: viewH, page: 'main', tiles: null };
        showPage('main');

        // Drag anywhere on the panel to scroll (capture phase, so taps on controls still land).
        var startY = 0, lastY = 0;
        box.on(cc.Node.EventType.TOUCH_START, function (ev) {
            startY = lastY = ev.getLocation().y;
            scrolled = false;
        }, null, true);
        box.on(cc.Node.EventType.TOUCH_MOVE, function (ev) {
            var y = ev.getLocation().y;
            var dy = y - lastY;
            lastY = y;
            if (Math.abs(y - startY) > 26) scrolled = true;
            var top = viewH / 2, maxY = top + Math.max(0, content.height - viewH);
            content.y = Math.min(maxY, Math.max(top, content.y + dy));
        }, null, true);
    }

    function closePanel() {
        if (root && cc.isValid(root)) root.destroy();
        root = null;
        panel = null;
    }

    // Tiles follow every change (a pick, or a setting another tile's preview depends on).
    bb.sub(function () { if (panel && panel.page === 'themes') paintTiles(); });

    // Features can watch any screen the game opens (bb.ui.onScreen); callbacks get the screen's root
    // node each time it opens.
    // Key-list transforms for the gear popup, run inside Setup.render where the list is final (later
    // steps still append keys after onSetupShow) and the popup is sized from it.
    var keyTransforms = [];
    bb.ui = {
        open: openPanel,
        close: closePanel,
        find: findNode,
        onScreen: function (name, fn) { (screenCallbacks[name] = screenCallbacks[name] || []).push(fn); },
        onSetupKeys: function (fn) { keyTransforms.push(fn); },
    };
    // "Mod settings" as a real bottom row in the gear popup: register a key the game lays out itself, then
    // skin its blank button (its sprite paths do not exist, so the game leaves it empty for us to fill).
    var MOD_KEY = 'bbmod';

    bb.on('SetupConfig', function (exports) {
        var cfg = exports.SetupConfig;
        if (cfg.bottomList.indexOf(MOD_KEY) < 0) cfg.bottomList.push(MOD_KEY);
        cfg.keysInstallSizes[MOD_KEY] = { width: 625, height: 148 };
        cfg.itemIndex[MOD_KEY] = 999; // the bottom-most row, below Home and Replay
    });

    bb.ui.onSetupKeys(function (keys) {
        return keys.filter(function (k) { return k !== MOD_KEY; }).concat([MOD_KEY]);
    });

    bb.on('Setup_Proxy', function (exports) {
        bb.wrap(exports.Setup_Proxy.prototype, 'dispatchClickAction', function (original) {
            return function (key) {
                if (key === MOD_KEY) { openPanel(); return; }
                return original.apply(this, arguments);
            };
        });
    });

    bb.on('SetupBtnItem', function (exports) {
        bb.wrap(exports.SetupBtnItem.prototype, 'render', function (original) {
            return function () {
                var result = original.apply(this, arguments);
                if (this.state && this.state.key === MOD_KEY && this.node && !this.node.getChildByName('bbmodLabel')) {
                    // hide the blank stock icon/text sprites
                    [this.icon_img, this.txt_img].forEach(function (sp) { if (sp && sp.node) sp.node.active = false; });
                    var tag = roundRect('bbmodTag', 84, 84, cc.color(255, 255, 255, 40), 22);
                    tag.x = -208;
                    var tagText = label('M', 46, cc.Color.WHITE, true);
                    tagText.y = 2;
                    tag.addChild(tagText);
                    this.node.addChild(tag);
                    var text = label('Mod settings', 46, cc.Color.WHITE, true);
                    text.name = 'bbmodLabel';
                    text.anchorX = 0;
                    text.x = -150;
                    this.node.addChild(text);
                }
                return result;
            };
        });
    });

    // The gear popup re-renders (and can be recreated) after it opens, so the one-shot hook after
    // UI.show is not enough for it: run the Setup callbacks after every render of the component too.
    bb.on('Setup', function (exports) {
        bb.wrap(exports.default.prototype, 'render', function (original) {
            return function () {
                if (this.state && this.state.keys && this.state.keys.length) {
                    var keys = this.state.keys.slice();
                    keyTransforms.forEach(function (fn) {
                        try { keys = fn(keys) || keys; } catch (e) { bb.log('setup keys transform failed:', e, e && e.stack); }
                    });
                    this.state.keys = keys.filter(function (k, i) { return keys.indexOf(k) === i; });
                }
                var result = original.apply(this, arguments);
                var node = this.node;
                (screenCallbacks['Setup'] || []).forEach(function (fn) {
                    try { fn(node); } catch (e) { bb.log('Setup hook failed:', e, e && e.stack); }
                });
                return result;
            };
        });
    });

    bb.on('UI', function (exports) {
        bb.wrap(exports.UI, 'show', function (original) {
            return function (config) {
                var result = original.apply(this, arguments);
                var fns = config && screenCallbacks[config.name];
                if (fns && fns.length) {
                    var tries = 0;
                    (function attempt() {
                        var screen = findNode(cc.director.getScene(), config.name) ||
                            findNode(cc.director.getScene(), config.name.charAt(0).toLowerCase() + config.name.slice(1));
                        if (screen && screen.activeInHierarchy) {
                            fns.forEach(function (fn) {
                                try { fn(screen); } catch (e) { bb.log(config.name, 'hook failed:', e, e && e.stack); }
                            });
                        } else if (++tries < 30) setTimeout(attempt, 100);
                        else bb.log(config.name, 'screen not found');
                    })();
                }
                return result;
            };
        });
    });
})();
