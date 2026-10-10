// The app's seven extra effects on the game's own hooks, all off by default. Values follow the app
// one-to-one; its CSS-pixel lengths are scaled by U = BLOCK_SIZE / 46 (its board cell in CSS pixels).
(function () {
    function on(key) { return bb.get('extraFx', key); }
    function BLOCK() { var m = bb.module('BoardRendererInfo'); return (m && m.BLOCK_SIZE) || 106; }
    function U() { return BLOCK() / 46; }
    function rand(a, b) { return a + Math.random() * (b - a); }

    // The overlay canvas: rings and particles drawn once a frame on the game effect layer.
    var overlay = null, gfx = null, parts = [], rings = [], timers = [];
    function ensureOverlay() {
        if (overlay && cc.isValid(overlay)) return overlay;
        var layer = cc.find('persist/gameEffectLayer');
        if (!layer) return null;
        overlay = new cc.Node('bbmodParticles');
        overlay.setContentSize(cc.winSize.width, cc.winSize.height);
        overlay.zIndex = -10;
        gfx = overlay.addComponent(cc.Graphics);
        layer.addChild(overlay);
        return overlay;
    }
    function toOverlay(world) { return ensureOverlay() ? overlay.convertToNodeSpaceAR(world) : cc.v2(0, 0); }
    function center() { return toOverlay(cc.v2(cc.winSize.width / 2, cc.winSize.height / 2)); }
    function later(ms, fn) { timers.push({ at: Date.now() + ms, fn: fn }); }

    function spawnShatter(pos, hex, power, size) {
        var color = new cc.Color().fromHEX(hex), u = U();
        for (var i = 0; i < 7; i++) {
            var a = Math.random() * Math.PI * 2, v = rand(80, 320) * power * u;
            parts.push({ kind: 'rect', x: pos.x + rand(-size / 3, size / 3), y: pos.y + rand(-size / 3, size / 3),
                vx: Math.cos(a) * v, vy: Math.sin(a) * v + rand(120, 260) * power * u, g: -900 * u, drag: 0,
                life: rand(0.55, 0.9), t: 0, s: rand(0.14, 0.3) * BLOCK(), sy: 1, rot: Math.random() * Math.PI * 2,
                vr: rand(-10, 10), color: color });
        }
        for (i = 0; i < 3; i++) {
            a = Math.random() * Math.PI * 2; v = rand(40, 160) * u;
            parts.push({ kind: 'spark', x: pos.x, y: pos.y, vx: Math.cos(a) * v, vy: Math.sin(a) * v, g: 0, drag: 0,
                life: rand(0.3, 0.5), t: 0, s: rand(2, 4) * u, color: cc.Color.WHITE });
        }
    }
    function shatter(pos, hex, power, delayMs, size) {
        later(delayMs, function () { spawnShatter(pos, hex, power, size); });
    }
    function ring(pos, hex, maxR, life, width) {
        rings.push({ x: pos.x, y: pos.y, maxR: maxR, life: life, t: 0, w: width, color: new cc.Color().fromHEX(hex) });
    }
    function burst(pos, n, palette) {
        var u = U();
        for (var i = 0; i < n; i++) {
            var a = (i / n) * Math.PI * 2 + rand(-0.1, 0.1), v = rand(220, 520) * u;
            var hex = palette ? palette[Math.floor(Math.random() * palette.length)] : bb.color.CUBES[Math.floor(Math.random() * 7)];
            parts.push({ kind: 'spark', x: pos.x, y: pos.y, vx: Math.cos(a) * v, vy: Math.sin(a) * v, g: -260 * u,
                drag: 1.8, life: rand(0.8, 1.3), t: 0, s: rand(2.5, 5) * u, color: new cc.Color().fromHEX(hex) });
        }
    }
    function confetti(n) {
        var u = U(), w = cc.winSize.width, h = cc.winSize.height;
        for (var i = 0; i < n; i++) {
            parts.push({ kind: 'confetti', x: rand(-w / 2, w / 2), y: h / 2 + rand(10, 0.3 * h),
                vx: rand(-60, 60) * u, vy: -rand(120, 320) * u, g: -120 * u, drag: 0, life: rand(2.2, 3.4), t: 0,
                s: rand(5, 10) * u, rot: Math.random() * Math.PI * 2, vr: rand(-8, 8), wob: Math.random() * Math.PI * 2,
                color: new cc.Color().fromHEX(bb.color.CUBES[Math.floor(Math.random() * 7)]) });
        }
    }
    function drawRect(g, p) {
        var c = Math.cos(p.rot), s = Math.sin(p.rot), hw = p.s / 2, hh = (p.kind === 'confetti' ? p.s * 0.55 : p.s) / 2 * (p.sy || 1);
        g.moveTo(p.x + c * -hw - s * -hh, p.y + s * -hw + c * -hh);
        g.lineTo(p.x + c * hw - s * -hh, p.y + s * hw + c * -hh);
        g.lineTo(p.x + c * hw - s * hh, p.y + s * hw + c * hh);
        g.lineTo(p.x + c * -hw - s * hh, p.y + s * -hw + c * hh);
        g.close();
        g.fill();
    }
    function step(dt) {
        var now = Date.now();
        for (var i = timers.length - 1; i >= 0; i--) if (timers[i].at <= now) { var fn = timers[i].fn; timers.splice(i, 1); try { fn(); } catch (e) { bb.log('extraFx timer failed:', e); } }
        if (!parts.length && !rings.length) { if (gfx && cc.isValid(overlay)) gfx.clear(); return; }
        if (!ensureOverlay()) return;
        dt = Math.min(dt, 0.05);
        gfx.clear();
        for (i = rings.length - 1; i >= 0; i--) {
            var r = rings[i];
            r.t += dt;
            var k = r.t / r.life;
            if (k >= 1) { rings.splice(i, 1); continue; }
            gfx.strokeColor = cc.color(r.color.r, r.color.g, r.color.b, Math.round(255 * (1 - k) * 0.9));
            gfx.lineWidth = r.w * (1 - k) + 1;
            gfx.circle(r.x, r.y, r.maxR * (1 - Math.pow(1 - k, 2)));
            gfx.stroke();
        }
        for (i = parts.length - 1; i >= 0; i--) {
            var p = parts[i];
            p.t += dt;
            var kk = p.t / p.life;
            if (kk >= 1) { parts.splice(i, 1); continue; }
            if (p.drag) { p.vx *= 1 - p.drag * dt; p.vy *= 1 - p.drag * dt; }
            p.vy += p.g * dt;
            p.x += p.vx * dt;
            p.y += p.vy * dt;
            if (p.vr) p.rot += p.vr * dt;
            var alpha = kk < 0.7 ? 1 : (1 - kk) / 0.3;
            gfx.fillColor = cc.color(p.color.r, p.color.g, p.color.b, Math.round(255 * alpha));
            if (p.kind === 'spark') { gfx.circle(p.x, p.y, p.s * (1 - 0.6 * kk)); gfx.fill(); }
            else { if (p.kind === 'confetti') p.sy = Math.cos(p.t * 6 + p.wob); drawRect(gfx, p); }
        }
    }

    // The thumbs-up (dianzan) armature, shipped under assets/fx/dianzan from the app's IPA export.
    var dianzan = null, dianzanLoading = null;
    function loadDianzan(ready) {
        if (dianzan) return ready(dianzan);
        if (dianzanLoading) return dianzanLoading.push(ready);
        dianzanLoading = [ready];
        var got = {};
        function done() {
            if (!('ske' in got) || !('tex' in got) || !('png' in got)) return;
            try {
                var asset = new dragonBones.DragonBonesAsset();
                asset.dragonBonesJson = JSON.stringify(got.ske);
                var atlas = new dragonBones.DragonBonesAtlasAsset();
                atlas.atlasJson = JSON.stringify(got.tex);
                atlas.texture = got.png;
                dianzan = { asset: asset, atlas: atlas };
            } catch (e) { bb.log('extraFx: dianzan build failed:', e); }
            dianzanLoading.forEach(function (fn) { fn(dianzan); });
            dianzanLoading = null;
        }
        function json(name) {
            cc.assetManager.loadRemote('fx/dianzan/' + name + '.json', { ext: '.json' }, function (err, asset) {
                if (err) { bb.log('extraFx: dianzan ' + name + ' load failed:', err); got[name] = null; } else got[name] = asset && asset.json ? asset.json : asset;
                done();
            });
        }
        json('ske');
        json('tex');
        cc.assetManager.loadRemote('fx/dianzan/tex.png', { ext: '.png' }, function (err, texture) {
            got.png = err ? null : texture;
            if (err) bb.log('extraFx: dianzan texture load failed:', err);
            done();
        });
    }
    function thumbs(anim, pos) {
        loadDianzan(function (d) {
            if (!d) return;
            var layer = cc.find('persist/gameEffectLayer');
            if (!layer) return;
            var node = new cc.Node('bbmodThumbs');
            var display = node.addComponent(dragonBones.ArmatureDisplay);
            display.dragonAsset = d.asset;
            display.dragonAtlasAsset = d.atlas;
            display.armatureName = 'armatureName';
            node.setPosition(layer.convertToNodeSpaceAR(overlay && cc.isValid(overlay) ? overlay.convertToWorldSpaceAR(pos) : pos));
            layer.addChild(node, 60);
            display.addEventListener(dragonBones.EventObject.COMPLETE, function () { if (cc.isValid(node)) node.destroy(); });
            display.playAnimation(anim, 1);
        });
    }

    var drag = null, lastSnapKey = null;

    bb.feature('extraFx', {
        title: 'Extra effects',
        settings: [
            { key: 'fxMagnet', type: 'toggle', label: 'Magnet drag', def: false, note: 'The held piece glides onto its drop cell' },
            { key: 'fxParticles', type: 'toggle', label: 'Particles', def: false, note: 'Shatter, rings and confetti on clears' },
            { key: 'fxBounce', type: 'toggle', label: 'Landing bounce', def: false },
            { key: 'fxFlash', type: 'toggle', label: 'Big-clear flash', def: false, note: 'Three or more lines flash the board' },
            { key: 'fxScorePulse', type: 'toggle', label: 'Score pulse', def: false },
            { key: 'fxThumbs', type: 'toggle', label: 'Thumbs-up', def: false, note: 'At combo 5, 10, 15, 20 and on Perfect' },
            { key: 'fxTouchHaptics', type: 'toggle', label: 'Touch haptics', def: false, note: 'Ticks on pick-up, snap and drop' },
        ],
        start: function () {
            // Crisper pulses than the game's named haptic types: one-shot amplitude vibrations, the
            // web app's bridge feel (light tick on pick-up/snap, a firmer click on drop). Respects the
            // game's own vibration switch.
            function vibrate(kind) {
                var shake = bb.module('ShakeInfo');
                if (shake && !shake.shakeInfo.shakeSwitch) return;
                var m = bb.module('NativeVibrator');
                if (!m) return;
                if (kind === 2) m.NativeVibrator.shakeOnce(210, 16);
                else m.NativeVibrator.shakeOnce(140, 10);
            }

            // Magnet: the item node is a DRAWING between frames only. Every game update (grid math, drag
            // tracking, traits) runs with the finger-derived position restored, so placement is identical
            // with the magnet on or off; the eased position is applied after updates, right before drawing.
            function logicPos() {
                if (drag && cc.isValid(drag.item) && drag.logic) drag.item.setPosition(drag.logic.x, drag.logic.y);
            }
            cc.director.on(cc.Director.EVENT_BEFORE_UPDATE, logicPos);

            bb.frame(function (dt) {
                step(dt);
                if (drag) {
                    var touch = drag.touch, item = drag.item;
                    if (!on('fxMagnet') || !cc.isValid(item) || !touch._isTouchDown || touch._selectItem !== item) { drag = null; return; }
                    if (!drag.target) return; // no onTouchMove yet: nothing to ease toward
                    var tau = drag.anchored ? 0.055 : 0.040;
                    var k = 1 - Math.exp(-Math.max(dt, 0.001) / tau);
                    drag.vis.x += (drag.target.x - drag.vis.x) * k;
                    drag.vis.y += (drag.target.y - drag.vis.y) * k;
                    item.setPosition(drag.vis.x, drag.vis.y);
                }
            });

            bb.on('BlocksProducerTouch', function (exports) {
                var proto = exports.default.prototype;
                bb.wrap(proto, 'onTouchStart', function (original) {
                    return function () {
                        var result = original.apply(this, arguments);
                        lastSnapKey = null;
                        if (bb.isClassic() && this._selectItem) {
                            if (on('fxTouchHaptics')) vibrate(1);
                            if (on('fxMagnet')) drag = { touch: this, item: this._selectItem,
                                vis: { x: this._selectItem.x, y: this._selectItem.y }, target: null, anchored: false };
                        }
                        return result;
                    };
                });
                bb.wrap(proto, 'onTouchMove', function (original) {
                    return function () {
                        var result = original.apply(this, arguments);
                        var item = this._selectItem;
                        if (!bb.isClassic() || !item || !this._isMove) return result;
                        if (on('fxTouchHaptics') && this._canSnap) {
                            var key = Math.round(this._lastCanPutX) + ',' + Math.round(this._lastCanPutY);
                            if (key !== lastSnapKey) { lastSnapKey = key; vibrate(1); }
                        }
                        if (!on('fxMagnet')) { drag = null; return result; }
                        if (!drag || drag.item !== item) drag = { touch: this, item: item, vis: { x: item.x, y: item.y }, target: null, anchored: false };
                        // the game's own position for this move: every logic read gets exactly this
                        drag.logic = { x: this._targetPosX, y: this._targetPosY };
                        var target = { x: drag.logic.x, y: drag.logic.y };
                        drag.anchored = !!(this._canSnap && this._selectItemFirstItem && isFinite(this._lastCanPutX) && isFinite(this._lastCanPutY));
                        if (drag.anchored) {
                            // 85% of the way from the finger position onto the snap-aligned position
                            var first = this._selectItemFirstItem.convertToWorldSpaceAR(cc.Vec2.ZERO);
                            var parent = item.parent;
                            var here = parent.convertToNodeSpaceAR(first);
                            var snap = parent.convertToNodeSpaceAR(cc.v2(this._lastCanPutX, this._lastCanPutY));
                            target = { x: target.x + (snap.x - here.x) * 0.85, y: target.y + (snap.y - here.y) * 0.85 };
                        }
                        drag.target = target;
                        return result;
                    };
                });
                // The drop runs with the finger-derived position restored, identical magnet on or off.
                ['onTouchEnd', 'onTouchCancel'].forEach(function (name) {
                    if (!proto[name]) return;
                    bb.wrap(proto, name, function (original) {
                        return function () {
                            if (drag && drag.touch === this && cc.isValid(drag.item) && drag.logic) {
                                drag.item.setPosition(drag.logic.x, drag.logic.y);
                            }
                            drag = null;
                            return original.apply(this, arguments);
                        };
                    });
                });
            });

            bb.onEvent('E_BlocksProducer_TouchEnd', function (event) {
                var st = event.state;
                if (!st || !bb.isClassic()) return;
                if (on('fxTouchHaptics')) vibrate(2);
                if (on('fxBounce')) {
                    // only the cells of the piece just placed: putPos lists them as Vec2(row, col)
                    // (putUnEliminates also collects the whole board's re-rendered survivors on clears)
                    var bri = bb.module('BoardRendererInfo').boardRendererInfo;
                    var targets = (st.putPos || []).map(function (p) {
                        var row = bri.blocks[p.x];
                        return row && row[p.y];
                    }).filter(function (node) { return cc.isValid(node) && node.opacity > 0; });
                    targets.forEach(function (node) {
                        if (node.__bbBounce) cc.Tween.stopAllByTarget(node);
                        if (node.__bbBounceBase === undefined) node.__bbBounceBase = node.scale || 1;
                        var base = node.__bbBounceBase;
                        node.__bbBounce = true;
                        node.scale = base * 0.82;
                        cc.tween(node).to(0.168, { scale: base * 1.08 }, { easing: 'quadOut' })
                            .to(0.112, { scale: base }, { easing: 'quadIn' })
                            .call(function () { node.__bbBounce = false; }).start();
                    });
                }
                if (!st.canEliminate) return;
                var rows = (st.eliminateRows || []).length, cols = (st.eliminateCols || []).length, n = rows + cols;
                var combo = st.continuousEliminateTimes || 0;
                var cleared = (st.putEliminates || []).filter(function (nd) { return cc.isValid(nd); })
                    .map(function (nd) { return toOverlay(nd.convertToWorldSpaceAR(cc.Vec2.ZERO)); });
                var mid = cleared.length ? cleared.reduce(function (a, p) { return { x: a.x + p.x / cleared.length, y: a.y + p.y / cleared.length }; }, { x: 0, y: 0 }) : center();
                if (on('fxParticles') && n > 0) {
                    var u = U(), hex = bb.color.CUBES[(st.color || 1) - 1] || bb.color.CUBES[0];
                    var power = Math.min(2, 1 + (n - 1) * 0.25 + Math.max(0, combo - 1) * 0.05);
                    cleared.forEach(function (p) {
                        var dist = Math.sqrt(Math.pow(p.x - mid.x, 2) + Math.pow(p.y - mid.y, 2));
                        shatter(p, hex, power, (dist / u) * 0.6, BLOCK());
                    });
                    ring(mid, hex, (120 + 60 * n) * u, 0.5 + 0.08 * n, (6 + 2 * n) * u);
                    if (st.clearScreen) later(500, function () {
                        var grid = bb.module('BoardRendererInfo').boardRendererInfo.shaderBlockSprites;
                        var a = grid && grid[0] && grid[0][0] && toOverlay(grid[0][0].node.convertToWorldSpaceAR(cc.Vec2.ZERO));
                        var b = grid && grid[7] && grid[7][7] && toOverlay(grid[7][7].node.convertToWorldSpaceAR(cc.Vec2.ZERO));
                        var boardMid = a && b ? { x: (a.x + b.x) / 2, y: (a.y + b.y) / 2 } : center();
                        burst(boardMid, 90);
                        ring(boardMid, '#ffffff', a && b ? Math.abs(b.x - a.x) + BLOCK() : 8 * BLOCK(), 0.8, 14 * u);
                        confetti(120);
                    });
                }
                if (on('fxFlash') && n >= 3) {
                    var grid = bb.module('BoardRendererInfo').boardRendererInfo.shaderBlockSprites;
                    var a = grid && grid[0] && grid[0][0] && grid[0][0].node.convertToWorldSpaceAR(cc.Vec2.ZERO);
                    var b = grid && grid[7] && grid[7][7] && grid[7][7].node.convertToWorldSpaceAR(cc.Vec2.ZERO);
                    if (a && b && ensureOverlay()) {
                        var flash = bb.color.sprite('#ffffff', Math.abs(b.x - a.x) + BLOCK(), Math.abs(a.y - b.y) + BLOCK());
                        var p = toOverlay(cc.v2((a.x + b.x) / 2, (a.y + b.y) / 2));
                        flash.setPosition(p.x, p.y);
                        flash.opacity = 140;
                        overlay.addChild(flash);
                        cc.tween(flash).to(0.35, { opacity: 0 }, { easing: 'quadOut' })
                            .call(function () { flash.destroy(); }).start();
                    }
                }
                if (on('fxThumbs') && combo >= 5 && combo % 5 === 0) {
                    var tier = ['blue', 'silver', 'gold', 'copper'][Math.min(3, Math.floor(combo / 5) - 1)];
                    var score = cc.find('persist/gameUiLayer/ClassGame/topContainer/ClassTopInfo/currentNode');
                    var pos = score ? toOverlay(score.convertToWorldSpaceAR(cc.Vec2.ZERO)) : center();
                    thumbs(tier, { x: 90 * U(), y: pos.y });
                }
            });

            bb.on('NewBestScoreEffect', function (exports) {
                bb.wrap(exports.default.prototype, 'render', function (original) {
                    return function () {
                        var result = original.apply(this, arguments);
                        if (on('fxParticles') && bb.isClassic()) later(300, function () { confetti(160); });
                        return result;
                    };
                });
            });

            bb.on('RightPutTrait', function (exports) {
                bb.wrap(exports.RightPutTrait.prototype, 'playPerfectEffect', function (original) {
                    return function () {
                        var result = original.apply(this, arguments);
                        if (bb.isClassic()) {
                            if (on('fxParticles')) burst({ x: 0, y: 100 * U() }, 60, ['#ffe066', '#ffd23f', '#fff3b0', '#ffffff']);
                            if (on('fxThumbs')) later(250, function () { thumbs('gold', { x: 0, y: -20 * U() }); });
                        }
                        return result;
                    };
                });
            });

            bb.on('ClassTopInfo', function (exports) {
                bb.wrap(exports.default.prototype, 'playScoreAnim', function (original) {
                    return function () {
                        var result = original.apply(this, arguments);
                        if (on('fxScorePulse') && this.curScore && this.curScore.node && this.curScore.node.parent) {
                            var parent = this.curScore.node.parent;
                            if (!parent.__bbPulsing) {
                                parent.__bbPulsing = true;
                                var base = parent.scale;
                                cc.tween(parent).to(0.13, { scale: base * 1.12 }, { easing: 'quadOut' })
                                    .to(0.13, { scale: base }, { easing: 'quadOut' })
                                    .call(function () { parent.__bbPulsing = false; }).start();
                            }
                        }
                        return result;
                    };
                });
            });
        },
    });
})();
