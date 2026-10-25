// Runs the real Complete badges automatically engine from bootstrap.js against a fake Discord with a fake clock:
// games at once, switching, heartbeats, stopping, the top tier, and every limit of Add hours now.
//   node tests/badge_engine.cjs
const fs = require('node:fs');
const path = require('node:path');
const src = fs.readFileSync(path.join(__dirname, '../patches/src/main/resources/venus/bootstrap.js'), 'utf8');
const cut = (from, to) => {
    const a = src.indexOf(from), b = src.indexOf(to, a);
    if (a < 0 || b < 0) throw new Error('bootstrap.js moved: ' + from);
    return src.slice(a, b);
};
const engine = cut('    // Badge Completer (#81): Game Time', "    // A badge's progress from Discord's Badge Directory");
const limits = cut('    const BADGE_CYCLE_MIN', '    function badgeCycleMinutes') +
    src.slice(src.indexOf('    function badgeCycleMinutes'), src.indexOf('\n', src.indexOf('    function badgeCycleMinutes')) + 1);

let failures = 0, checks = 0;
function ok(cond, name) { checks++; if (!cond) failures++; console.log(cond ? 'ok  ' : 'FAIL', name); }

function world(opts = {}) {
    let now = Date.UTC(2026, 9, 23, 12);
    const timers = [], sent = [], activities = [], dispatched = [];
    const env = {
        settings: Object.assign({badges: true, badgesGameTime: true, badgesUniqueGames: true, badgesCycleMinutes: 15, badgesGamesAtOnce: 2}, opts.settings),
        progress: Object.assign({GAME_TIME: 0, GAME_VARIETY: 0}, opts.progress),
        failScience: false,
    };
    const later = (fn, ms) => { const t = {at: now + ms, fn, id: timers.length + 1}; timers.push(t); return t.id; };
    const clearTimeout = id => { const t = timers.find(x => x.id === id); if (t) t.dead = true; };
    const http = {
        post: async req => {
            if (req.url === '/science') {
                if (env.failScience) { const e = new Error('HTTP 500'); e.status = 500; throw e; }
                sent.push({at: now, events: req.body.events}); return {body: null};
            }
            // Discord answers 404 here for many games; the engine must carry on.
            if (req.url === '/activities') { activities.push(req.body); const e = new Error('HTTP 404'); e.status = 404; throw e; }
            throw new Error('unexpected POST ' + req.url);
        },
        get: async req => {
            if (req.url === '/games/detectable') return {body: []};
            if (req.url.startsWith('/users/@me')) return {body: {analytics_token: 'AT'}};
            throw new Error('unexpected GET ' + req.url);
        },
    };
    const factory = new Function('env', 'later', 'clearTimeout', 'http', 'nowFn', 'dispatched', `
        const Date = (() => { const R = globalThis.Date; function D(...a) { return a.length ? new R(...a) : new R(nowFn()); } D.now = nowFn; D.UTC = R.UTC; return D; })();
        const settings = env.settings, global = {clearTimeout}, features = {badges:true};
        function enabled(k) { return !!settings[k]; }
        function notify() {} function save() {} function backgroundSync() {}
        function currentId() { return "111111111111111111"; }
        function inspectedExport(id) { return id === 502 ? {getAnalyticsToken: () => "AT", getSessionId: () => "S"} : null; }
        function questDesktopProperties() {} const quest = {desktop:{session:"hs", signature:"ls"}};
        function questRequest(url, body, desktop, method, active) {
            const request = {url}; if (body !== undefined) request.body = body;
            return Promise.resolve().then(() => active && !active() ? null : http[method || "post"](request));
        }
        function questHex(n) { let h = ""; for (let i = 0; i < n; i++) h += Math.floor(Math.random() * 16).toString(16); return h; }
        function questUuidText(hex) { return hex.slice(0, 8) + "-" + hex.slice(8, 12) + "-" + hex.slice(12, 16) + "-" + hex.slice(16, 20) + "-" + hex.slice(20, 32); }
        function questUuid() { return questHex(32); }
        function questDispatch(a) { dispatched.push(a); }
        function questSleep(ms) { return new Promise(r => later(r, ms)); }
        function hookExport() {} function replaceValue() {}
        function snowflakeMs(id) { if (typeof id !== "string" || !/^[0-9]{17,20}$/.test(id)) return NaN; try { return Number(BigInt(id) >> BigInt(22)) + 1420070400000; } catch (_) { return NaN; } }
        function badgeInfo(key) { const v = env.progress[key]; return v == null ? null : {current:v, goal:100}; }
        ${limits}
        ${engine}
        return {badges, badgeStartGame, badgesStop, badgesSettingChanged, badgeGrantHours, badgeGrantLimit, badgeGrantWait,
            badgeGrantRecord, badgeGrantsLoad, badgeAdoptLegacyGrant, badgeGrantPendingWait, badgeGrantHave, badgeGrantPlan, badgeGrantRoom, badgeDaySchedule, badgeGrantDays, badgeDayKey, badgeEntries, BADGE_FALLBACK_GAMES, BADGE_GAME_TIME_START};
    `);
    const api = factory(env, later, clearTimeout, http, () => now, dispatched);
    api.badges.user = '111111111111111111';
    const flush = async () => { for (let i = 0; i < 50; i++) await Promise.resolve(); };
    const advance = async ms => {
        const end = now + ms;
        for (;;) {
            await flush();
            const next = timers.filter(t => !t.dead && t.at <= end).sort((x, y) => x.at - y.at)[0];
            if (!next) break;
            next.dead = true; now = next.at; next.fn(); await flush();
        }
        now = end; await flush();
    };
    return {api, env, sent, activities, dispatched, advance, flush, now: () => now, setNow: t => { now = t; }};
}
const events = (w, type) => w.sent.flatMap(s => s.events).filter(e => e.type === type);
const heartbeats = w => events(w, 'running_game_heartbeat');

(async () => {
    {
        const w = world();
        await w.api.badgeStartGame(null); await w.flush();
        ok(w.api.badges.current && w.api.badges.extra.length === 1, 'plays 2 games at once by default');
        const ids = w.api.badgeEntries().map(e => e.game.id);
        ok(new Set(ids).size === ids.length, 'the games playing at once are all different');
        ok(events(w, 'launch_game').length === 2 && heartbeats(w).filter(e => e.properties.initial_heartbeat).length === 2, 'each game sends launch_game and an initial heartbeat');
        ok(w.api.badges.played.size === 2, 'both games count as played as soon as they start');
        const sockets = w.dispatched.filter(d => d.type === 'LOCAL_ACTIVITY_UPDATE' && d.activity).map(d => d.socketId);
        ok(sockets.includes('venus-badges') && sockets.includes('venus-badges-1'), 'each game shows on the profile under its own socket');
        const before = w.sent.length;
        await w.advance(5 * 60000);
        const batch = w.sent.slice(before).find(s => s.events.every(e => e.type === 'running_game_heartbeat'));
        ok(batch && batch.events.length === 2 && batch.events.every(e => Math.abs(e.properties.duration_tracked_ms - 300000) < 2000), 'one 5 minute heartbeat batch covers both games');
        const extraId = w.api.badges.extra[0].game.id, firstId = w.api.badges.current.game.id;
        await w.advance(10 * 60000 + 1000);
        ok(w.api.badges.current && w.api.badges.current.game.id !== firstId, 'the rotating game switches after 15 minutes');
        ok(w.api.badges.extra[0] && w.api.badges.extra[0].game.id === extraId, 'the extra game keeps playing through the switch');
        const finals = heartbeats(w).filter(e => e.properties.final_heartbeat);
        ok(finals.length === 1 && finals[0].properties.game_id === firstId, 'the game switched out sends a final heartbeat');
        ok(w.activities.length > 0 && !w.api.badges.error, 'a 404 from /activities is neither fatal nor shown as a problem');
        w.env.settings.badgesGamesAtOnce = 1; w.api.badgesSettingChanged('badgesGamesAtOnce', 1); await w.advance(1000);
        ok(w.api.badges.extra.length === 0, 'Games at once 1 stops the extra game');
        w.env.settings.badgesGamesAtOnce = 3; w.api.badgesSettingChanged('badgesGamesAtOnce', 3); await w.advance(1000);
        ok(w.api.badges.extra.length === 2, 'Games at once 3 plays 3 games');
        w.api.badgesStop(); await w.flush();
        ok(!w.api.badges.current && w.api.badges.extra.length === 0, 'turning the feature off stops every game');
        ok(w.dispatched.filter(d => d.type === 'LOCAL_ACTIVITY_UPDATE' && !d.activity).length >= 3, 'turning it off clears every game from the profile');
    }
    {
        const w = world({settings: {badgesGameTime: false}});
        await w.api.badgeStartGame(null); await w.flush();
        ok(w.api.badges.extra.length === 0, 'without Game time only one game plays');
    }
    {
        const w = world({progress: {GAME_VARIETY: 100}});
        await w.api.badgeStartGame(null); await w.flush();
        const id = w.api.badges.current.game.id;
        await w.advance(60 * 60000);
        ok(w.api.badges.current.game.id === id, 'games stop switching once the 100 game top tier is reached');
    }
    // Add hours now: the dates have to look like a person's play history, and stay that way across grants.
    const sessionsOf = (w, from) => w.sent.slice(from).flatMap(x => x.events)
        .filter(e => e.type === 'running_game_heartbeat' && e.properties.final_heartbeat)
        .map(e => ({id: e.properties.game_id, end: e.properties.client_track_timestamp, start: e.properties.client_track_timestamp - e.properties.duration_tracked_ms}));
    const dayOf = ms => { const d = new Date(ms); return d.getFullYear() * 10000 + (d.getMonth() + 1) * 100 + d.getDate(); };
    {
        const w = world({progress: {GAME_TIME: 10, GAME_VARIETY: 3}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        ok(w.api.badgeGrantLimit() === 500, 'Add hours now allows up to 500 hours a day (' + w.api.badgeGrantLimit() + ')');
        const user = w.api.badges.user, days = w.api.badgeGrantDays(user);
        ok(days.length > 300 && dayOf(days[0]) < dayOf(w.now()), 'only past days are used, never today');
        ok(days.every(d => d >= w.api.BADGE_GAME_TIME_START), 'no day before Game Time started counting');
        const again = days.slice(0, 60).every(d => JSON.stringify(w.api.badgeDaySchedule(user, d)) === JSON.stringify(w.api.badgeDaySchedule(user, d)));
        ok(again, 'a day always has the same schedule, however often it is looked at');
        const other = days.slice(0, 60).some(d => JSON.stringify(w.api.badgeDaySchedule(user, d)) !== JSON.stringify(w.api.badgeDaySchedule('222222222222222222', d)));
        ok(other, 'another account gets a different history');
        const perDay = days.map(d => w.api.badgeDaySchedule(user, d).reduce((a, x) => a + x.ms, 0) / 3600000);
        const off = perDay.filter(h => h === 0).length / perDay.length, avg = perDay.reduce((a, b) => a + b, 0) / perDay.length;
        ok(off > 0.05 && off < 0.3, 'some days have no play at all (' + Math.round(off * 100) + '%)');
        ok(Math.max(...perDay) <= 18 && avg > 3 && avg < 9, 'about ' + avg.toFixed(1) + ' h a day on average, never more than 18 (' + Math.max(...perDay).toFixed(1) + ')');
        const sizes = new Set(perDay.map(h => Math.round(h)));
        ok(sizes.size >= 8, 'days are different lengths, not the same amount over and over (' + sizes.size + ' sizes)');
        const p = w.api.badgeGrantHours(300);
        await w.advance(10 * 60000);
        ok(await p === true, 'adding 300 hours finishes');
        const first = sessionsOf(w, 0), total = first.reduce((a, x) => a + x.end - x.start, 0);
        ok(Math.abs(total - 300 * 3600000) < 1000, 'exactly 300 hours are sent');
        ok(first.every(x => x.end <= w.now() && dayOf(x.start) < dayOf(w.now())), 'every session is in the past, before today');
        ok(first.every(x => x.end - x.start <= 5.1 * 3600000), 'no session is longer than about 5 hours');
        let most = 0, running = 0;
        for (const [, d] of first.flatMap(x => [[x.start, 1], [x.end, -1]]).sort((p, q) => p[0] - q[0] || p[1] - q[1])) { running += d; most = Math.max(most, running); }
        ok(most <= 2, 'never more than 2 games at the same moment (' + most + ')');
        ok(!first.some(x => first.some(y => y !== x && y.id === x.id && y.start < x.end && y.end > x.start)), 'the same game never overlaps itself');
        const hours = first.map(x => new Date(x.start).getHours());
        ok(hours.filter(h => h >= 4 && h < 9).length === 0, 'nobody starts a session between 4 and 9 in the morning');
        const byGame = {};
        first.forEach(x => { byGame[x.id] = (byGame[x.id] || 0) + x.end - x.start; });
        const shares = Object.values(byGame).sort((a, b) => b - a);
        ok(shares[0] / total > 0.2, 'a favourite game gets most of the time (' + Math.round(shares[0] / total * 100) + '%)');
        ok(first.every(x => w.api.badges.played.has(x.id)), 'only games already played are used');
        ok(w.api.badgeGrantWait() > 23 * 3600000 && await w.api.badgeGrantHours(10) === false, 'then there is a 24 hour wait');
        // Coming back the next day: the next grant must continue on older days, never fill a day again.
        w.setNow(w.now() + 25 * 3600000);
        const before = w.sent.length, p2 = w.api.badgeGrantHours(200); await w.advance(10 * 60000); await p2;
        const second = sessionsOf(w, before);
        const both = first.concat(second);
        let most2 = 0, run2 = 0;
        for (const [, d] of both.flatMap(x => [[x.start, 1], [x.end, -1]]).sort((p, q) => p[0] - q[0] || p[1] - q[1])) { run2 += d; most2 = Math.max(most2, run2); }
        const repeated = second.some(x => first.some(y => y.start === x.start));
        const selfOverlap = both.some(x => both.some(y => y !== x && y.id === x.id && y.start < x.end && y.end > x.start));
        ok(second.length > 0 && !repeated && most2 <= 2 && !selfOverlap, 'the next grant sends no session twice, and with the first never has more than 2 games at once (' + most2 + ')');
        // Only days that weren't past yet at the first grant, the day it stopped in (whose evening can run past midnight)
        // and older days.
        const oldestStart = Math.min(...first.map(x => x.start)), od = new Date(oldestStart);
        const stopDayEnd = new Date(od.getFullYear(), od.getMonth(), od.getDate()).getTime() + 26 * 3600000;
        const newest = Math.max(...first.map(x => dayOf(x.start)));
        const filledAgain = second.filter(x => x.start >= stopDayEnd && dayOf(x.start) < newest);
        ok(filledAgain.length === 0, 'the next grant never goes back into days the last one filled (' + filledAgain.length + ')');
        ok(Math.min(...second.map(x => x.start)) < Math.min(...first.map(x => x.start)), 'it continues further back in time');
        const all = first.concat(second), perSent = {};
        all.forEach(x => { perSent[dayOf(x.start)] = (perSent[dayOf(x.start)] || 0) + x.end - x.start; });
        ok(Object.values(perSent).every(ms => ms <= 18 * 3600000), 'no day ever ends up with more than 18 hours');
        // The total stays inside what those days could really hold, and below 5,000.
        w.setNow(w.now() + 25 * 3600000);
        w.env.progress.GAME_TIME = 4900;
        ok(w.api.badgeGrantLimit() <= 100, 'hours Discord hasn\'t shown yet count toward 5,000 (' + w.api.badgeGrantLimit() + ')');
        w.api.badges.user = '222222222222222222';
        ok(w.api.badgeGrantWait() === 0 && w.api.badgeGrantRecord().hours === 0, 'another account has its own cooldown, total and days');
    }
    {
        // A day Venus played on live is never filled again later.
        const w = world({progress: {GAME_TIME: 0}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        const user = w.api.badges.user, yesterday = w.api.badgeGrantDays(user)[0];
        w.setNow(yesterday + 20 * 3600000);
        await w.api.badgeStartGame(null); await w.advance(6 * 60000); w.api.badgesStop(); await w.flush();
        ok(w.api.badgeGrantRecord().days[w.api.badgeDayKey(yesterday)] === -1, 'a day played live is remembered');
        w.setNow(yesterday + 2 * 86400000);
        const before = w.sent.length, p = w.api.badgeGrantHours(25); await w.advance(5 * 60000); await p;
        ok(sessionsOf(w, before).every(x => dayOf(x.start) !== dayOf(yesterday)), 'nothing is added to a day that was played live');
    }
    {
        // A brand new account: nothing before it existed.
        const w = world({progress: {GAME_TIME: 0}});
        const created = w.now() - 20 * 86400000, id = String((BigInt(created - 1420070400000) << 22n));
        w.api.badges.user = id;
        const days = w.api.badgeGrantDays(id);
        ok(days.length <= 20 && days.every(d => d > created), 'a 20 day old account only gets days after it was made');
        ok(w.api.badgeGrantLimit() < 200, 'and only as many hours as those few days could hold (' + w.api.badgeGrantLimit() + ')');
    }
    {
        const w = world();
        w.env.failScience = true;
        const p = w.api.badgeGrantHours(100); await w.advance(60000);
        ok(await p === false && !w.api.badges.granting, 'a failed grant stops and clears its progress');
        ok(w.api.badgeGrantWait() === 0 && w.api.badgeGrantRecord().hours === 0, 'nothing sent means no cooldown and nothing counted');
        ok(String(w.api.badges.error) === '500', 'the failure is shown');
    }
    {
        const w = world();
        const g = w.api.badgeGrantsLoad({'111111111111111111': {at: 1, hours: 99999, recent: [[1, 2], 'x'], days: {'20260101': 3, bad: 2, '20260102': 999}}, bad: {at: 1, hours: 1}, '3': null});
        const r = g['111111111111111111'];
        ok(Object.keys(g).length === 1 && r.hours === 5000 && r.recent.length === 1 && r.days['20260101'] === 3 && !('bad' in r.days) && !('20260102' in r.days), 'saved grants are checked when loaded');
        const old = w.api.badgeGrantsLoad({'111111111111111111': {at: 1, hours: 300, recent: []}})['111111111111111111'];
        ok(Object.keys(old.days).length > 10, 'hours added by the older version mark the newest days as used');
    }
    // Timing: heartbeats keep a steady 5 minute beat for games that keep running, and never claim time the phone slept.
    {
        const w = world({settings: {badgesGamesAtOnce: 2}});
        await w.api.badgeStartGame(null); await w.flush();
        const keep = w.api.badges.extra[0].game.id;
        await w.advance(4 * 60000); w.api.badgesSettingChanged('badgesCycleMinutes', 15); w.api.badgesSettingChanged('badgesGamesAtOnce', 2);
        await w.advance(61 * 60000);
        const beats = w.sent.filter(s => s.events.some(e => e.type === 'running_game_heartbeat' && e.properties.game_id === keep && !e.properties.initial_heartbeat));
        let gap = 0; for (let i = 1; i < beats.length; i++) gap = Math.max(gap, beats[i].at - beats[i - 1].at);
        ok(gap <= 5 * 60000 + 1000, 'a game that keeps running gets a heartbeat every 5 minutes, through switches and setting changes (' + gap / 60000 + ' min)');
        const tracked = heartbeats(w).filter(e => !e.properties.initial_heartbeat && e.properties.game_id === keep).map(e => e.properties.duration_tracked_ms);
        ok(tracked.every(ms => ms <= 300000 + 1000), 'and each one covers 5 minutes, never more (' + Math.max(...tracked) / 1000 + ' s)');
        ok(w.activities.some(a => a.application_id === keep && !a.closed), 'the extra game reports its play time to /activities too');
        w.setNow(w.now() + 3 * 3600000); await w.advance(1000);
        const after = heartbeats(w).filter(e => !e.properties.initial_heartbeat).map(e => e.properties.duration_tracked_ms);
        ok(Math.max(...after) <= 10 * 60000, 'after the phone slept 3 hours, a heartbeat claims at most 10 minutes (' + Math.max(...after) / 60000 + ' min)');
    }
    {
        // Granting right after midnight: yesterday's late sessions may not even be over yet.
        const w = world({progress: {GAME_TIME: 0}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        const d = new Date(w.now()); w.setNow(new Date(d.getFullYear(), d.getMonth(), d.getDate(), 0, 20).getTime());
        const at = w.now(), p = w.api.badgeGrantHours(500); await w.advance(20 * 60000); await p;
        ok(sessionsOf(w, 0).every(x => x.end <= at - 3600000), 'no session ends in the future or in the last hour');
    }
    {
        // A day played live is never touched by a late session from the day before running past midnight.
        const w = world({progress: {GAME_TIME: 0}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        const user = w.api.badges.user, days = w.api.badgeGrantDays(user);
        const marked = {};
        days.slice(0, 120).forEach(day => { marked[w.api.badgeDayKey(day)] = -1; });
        days.slice(0, 120).forEach((day, i) => { if (i % 2) delete marked[w.api.badgeDayKey(day)]; });
        w.api.badges.grants[user] = {at: 0, hours: 0, recent: [], days: marked};
        const p = w.api.badgeGrantHours(500); await w.advance(20 * 60000); await p;
        ok(sessionsOf(w, 0).every(x => marked[w.api.badgeDayKey(x.start)] !== -1 && marked[w.api.badgeDayKey(x.end)] !== -1), 'nothing lands on a live day, even past midnight');
    }
    {
        // Nothing can be added before Discord has loaded the badge, since the 5,000 cap can't be checked.
        const w = world({progress: {GAME_TIME: null}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        ok(w.api.badgeGrantLimit() === 0 && await w.api.badgeGrantHours(25) === false && w.sent.length === 0, 'nothing is added while the badge is still loading');
    }
    {
        // Hours that already show on the badge aren't counted twice.
        const w = world({progress: {GAME_TIME: 100}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        const p = w.api.badgeGrantHours(500); await w.advance(20 * 60000); await p;
        ok(w.api.badgeGrantHave() >= 599 && w.api.badgeGrantHave() <= 600, 'right after adding 500 to 100, the badge is expected at 600 (' + w.api.badgeGrantHave() + ')');
        w.env.progress.GAME_TIME = 600;
        ok(w.api.badgeGrantHave() === 600, 'once Discord shows them, they are not counted again (' + w.api.badgeGrantHave() + ')');
        w.env.progress.GAME_TIME = 650;
        ok(w.api.badgeGrantHave() === 650, 'and live play on top counts once (' + w.api.badgeGrantHave() + ')');
    }
    {
        // 1,000 hours added with the first test build ({at, hours} for every account), then this version.
        const w = world({progress: {GAME_TIME: 0}});
        w.api.BADGE_FALLBACK_GAMES.slice(0, 8).forEach(g => w.api.badges.played.add(g.id));
        const at = w.now() - 30 * 3600000;
        w.api.badges.legacyGrant = {at, hours: 1000};
        w.api.badgeAdoptLegacyGrant();
        const r = w.api.badgeGrantRecord();
        ok(r.hours === 1000 && r.at === at && r.recent.length === 1, 'a grant from the first test build is kept for the signed-in account');
        const room = w.api.badgeGrantRoom().total;
        ok(w.api.badgeGrantHave() === 1000 && w.api.badgeGrantLimit() === Math.min(500, room - 1000), 'before they show, those 1,000 hours count once (' + w.api.badgeGrantLimit() + ')');
        w.env.progress.GAME_TIME = 1000;
        ok(w.api.badgeGrantHave() === 1000 && w.api.badgeGrantLimit() === Math.min(500, room - 1000), 'and once they show, still once, not 2,000 (' + w.api.badgeGrantLimit() + ')');
        const p = w.api.badgeGrantHours(100); await w.advance(10 * 60000); await p;
        const day = new Date(at), key = w.api.badgeDayKey(new Date(day.getFullYear(), day.getMonth(), day.getDate()).getTime());
        ok(sessionsOf(w, 0).every(x => w.api.badgeDayKey(x.start) !== key && w.api.badgeDayKey(x.end) !== key), 'nothing is added on the day the old 1,000 hours landed');
    }
    {
        // 1,000 hours added with the second test build (per account, no days), shown on the badge.
        const w = world({progress: {GAME_TIME: 1000}});
        const at = w.now() - 30 * 3600000;
        w.api.badges.grants = w.api.badgeGrantsLoad({'111111111111111111': {at, hours: 1000, from: at - 20 * 86400000, recent: [[at, 1000]]}});
        ok(w.api.badgeGrantLimit() > 0 && w.api.badgeGrantLimit() <= 500, 'a grant from the second test build isn\'t counted twice once it shows (' + w.api.badgeGrantLimit() + ')');
        // More than the past days could hold, still pending: waiting for it to show is what opens room again.
        const big = world({progress: {GAME_TIME: 0}});
        big.api.badges.grants = big.api.badgeGrantsLoad({'111111111111111111': {at, hours: 2500, recent: [[at, 2500]], days: {}}});
        const left = big.api.badgeGrantPendingWait();
        ok(big.api.badgeGrantLimit() === 0 && left > 41 * 3600000 && left <= 42 * 3600000, 'when only pending hours block it, the panel says when to come back instead of nothing left (' + (left / 3600000).toFixed(1) + ' h)');
    }
    console.log(`\n${checks - failures}/${checks} passed`);
    process.exit(failures ? 1 : 0);
})().catch(e => { console.error(e); process.exit(1); });
