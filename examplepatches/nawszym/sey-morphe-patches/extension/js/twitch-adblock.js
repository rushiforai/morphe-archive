// Sey Morphe patches - Twitch TV (Starshot) hls.js ad filter.
//
// Adapted from CeladonTV's starshot-hls-adblock.js
//   https://github.com/kenhendricks00/CeladonTV
//   MIT License, Copyright (c) 2026 Kenneth Hendricks
// which in turn credits TwitchAdSolutions
//   https://github.com/pixeltris/TwitchAdSolutions (MIT).
//
// Twitch's TV web app ("Starshot") plays streams with hls.js on the main thread
// instead of the Amazon IVS worker that the TwitchAdSolutions scripts hook. This
// filters stitched ad segments out of media playlists as hls.js loads them. During an
// ad break it splices in the same broadcast from an ad-free backup stream, so playback
// carries on; without a backup the player waits out the break on the last live frame.
//
// Distributed as part of the Sey Morphe patches under the GNU GPL v3.
(function () {
    'use strict';

    // Runtime switch, driven by the native SEYTTINGS dialog through window.seyttingsAds.
    let enabled = true;

    function notify(message) {
        try {
            if (window.seyttingsAds && window.seyttingsAds.report) {
                window.seyttingsAds.report(String(message));
            }
        } catch (e) { /* bridge unavailable */ }
        try {
            console.log(LOG_PREFIX + ' ' + message);
        } catch (e) { /* console unavailable */ }
    }

    function setEnabled(on) {
        on = !!on;
        if (on === enabled) return;
        enabled = on;
        if (on) {
            notify('ad filter enabled');
            scheduleWarmUp();
        } else {
            notify('ad filter disabled');
        }
    }

    // Live playlists always carry a CLASS="twitch-trigger" DATERANGE, so it is not an ad marker.
    const AD_SIGNIFIERS = ['stitched-ad', 'EXT-X-CUE-OUT', 'twitch-stitched', 'CLASS="twitch-maf-ad"'];
    const AD_URL_PATTERNS = ['/adsquared/', '/_404/', '/processing'];
    const SEGMENT_TAG = /^#(EXTINF|EXT-X-PROGRAM-DATE-TIME|EXT-X-DISCONTINUITY(?!-SEQUENCE)|EXT-X-DATERANGE|EXT-X-BYTERANGE|EXT-X-KEY|EXT-X-MAP|EXT-X-GAP|EXT-X-CUE)/;
    const LOG_PREFIX = '[SEYTTINGS ads]';

    // Twitch titles live segments "live" and stitched ads after their source ("Amazon|...",
    // "DCM|..."); VOD segments have no title.
    const AD_TITLE = /^#EXTINF:[^,\n]*,(?!live\s*$)\S/m;

    function hasAdTags(text) {
        return AD_SIGNIFIERS.some((s) => text.includes(s));
    }

    // The stitched-ad DATERANGE only sits above an ad's first segment, so a sliding window
    // can hold the rest of an ad without it; the segment titles still give the ad away.
    function hasAds(text) {
        return hasAdTags(text) || AD_TITLE.test(text);
    }

    function parse(playlist) {
        const header = [];
        const segments = [];
        let pending = [];
        let inHeader = true;
        let inCueOut = false;
        for (const line of playlist.split(/\r?\n/)) {
            if (line === '') continue;
            const isUri = !line.startsWith('#');
            if (inHeader && !isUri && !SEGMENT_TAG.test(line)) {
                header.push(line);
                continue;
            }
            inHeader = false;
            if (line.startsWith('#EXT-X-CUE-OUT')) inCueOut = true;
            else if (line.startsWith('#EXT-X-CUE-IN')) inCueOut = false;
            if (!isUri) {
                pending.push(line);
                continue;
            }
            const extinf = pending.find((l) => l.startsWith('#EXTINF')) || '';
            const isAd = inCueOut || !extinf.includes(',live') || AD_URL_PATTERNS.some((p) => line.includes(p));
            segments.push({ tags: pending, uri: line, isAd });
            pending = [];
        }
        return { header, segments, trailer: pending };
    }

    function shiftHeader(header, tag, delta) {
        if (delta === 0) return header;
        const prefix = '#' + tag + ':';
        let found = false;
        const shifted = header.map((line) => {
            if (!line.startsWith(prefix)) return line;
            found = true;
            return prefix + (parseInt(line.slice(prefix.length), 10) + delta);
        });
        if (!found) shifted.push(prefix + delta);
        return shifted;
    }

    function mediaSequence(header) {
        const line = header.find((l) => l.startsWith('#EXT-X-MEDIA-SEQUENCE:'));
        return line ? parseInt(line.slice('#EXT-X-MEDIA-SEQUENCE:'.length), 10) : 0;
    }

    // Keeps the run of segments at the live edge: everything after the last ad, or,
    // while an ad break occupies the edge, the run just before it. A break shorter than
    // the window ends while live from before it is still in the window (and a session
    // playlist keeps every segment for its first minute); skipping to the run after the
    // break resumes playback as soon as live returns, not once the old live slides out.
    // Removing only from the ends keeps every kept segment's media sequence number
    // unchanged, which hls.js relies on.
    //
    // Ads with media sequence numbers up to `playedThrough`, and the rest of their
    // break, have already been handed to the player (a preroll) and are kept as content:
    // Twitch marks no discontinuity where ads switch to live, so hls.js can only get from
    // those ads to live by playing on through them.
    //
    // `complete` is false when ads reach the live edge (nothing usable to append).
    function stripAds(playlist, playedThrough = -1) {
        if (!hasAds(playlist)) return { playlist, removed: 0, kept: -1, live: -1, complete: true, playedThrough };
        const { header, segments, trailer } = parse(playlist);
        const first = mediaSequence(header);
        let played = false;
        const isAd = segments.map((s, i) => {
            played = s.isAd && (first + i <= playedThrough || played);
            if (played) playedThrough = Math.max(playedThrough, first + i);
            return s.isAd && !played;
        });
        let end = segments.length;
        while (end > 0 && isAd[end - 1]) end--;
        let start = end;
        while (start > 0 && !isAd[start - 1]) start--;
        if (start === 0 && end === segments.length) {
            return { playlist, removed: 0, kept: segments.length, live: -1, complete: true, playedThrough };
        }
        const dropped = segments.slice(0, start);
        const kept = segments.slice(start, end).map((s) => ({ ...s, tags: s.tags.filter((t) => !hasAdTags(t)) }));
        // Each segment uses the most recent init segment above it, which may be among those dropped.
        const map = dropped.flatMap((s) => s.tags).filter((t) => t.startsWith('#EXT-X-MAP')).pop();
        if (map && kept.length > 0 && !kept[0].tags.some((t) => t.startsWith('#EXT-X-MAP'))) {
            kept[0].tags = [map, ...kept[0].tags];
        }
        const droppedDiscontinuities = dropped.reduce((n, s) => n + s.tags.filter((t) => t === '#EXT-X-DISCONTINUITY').length, 0);
        let newHeader = shiftHeader(header, 'EXT-X-MEDIA-SEQUENCE', start);
        newHeader = shiftHeader(newHeader, 'EXT-X-DISCONTINUITY-SEQUENCE', droppedDiscontinuities);
        const lines = newHeader.slice();
        for (const s of kept) lines.push(...s.tags, s.uri);
        const truncated = end < segments.length;
        lines.push(...trailer.filter((t) => !truncated || t.startsWith('#EXT-X-ENDLIST')));
        return {
            playlist: lines.join('\n') + '\n',
            removed: isAd.filter(Boolean).length,
            kept: kept.length,
            live: segments.slice(start, end).filter((s) => !s.isAd).length,
            complete: kept.length > 0 && !truncated,
            playedThrough,
        };
    }

    function isPlaylistUrl(url) {
        return typeof url === 'string' && /\.m3u8(\?|$)/.test(url) && /^https:\/\/[^/]*\.(ttvnw\.net|twitch\.tv)\//.test(url);
    }

    // ---- Backup stream ----------------------------------------------------------------
    //
    // The same broadcast requested with another player type usually comes without ads.
    // Every player type is cut from the same transcode: at a given PROGRAM-DATE-TIME the
    // segments are byte-identical, so during a break the backup's segments can stand in
    // for the ads without hls.js leaving its timeline.

    const BACKUP_PLAYER_TYPES = ['embed', 'popout', 'site', 'mobile_web', 'autoplay', 'picture-by-picture'];
    const BACKUP_FRESH_MS = 6000;
    const MAX_SPLICED_SEGMENTS = 40;
    const PDT = '#EXT-X-PROGRAM-DATE-TIME:';

    function parseAttributes(line) {
        const attrs = {};
        const re = /([A-Z0-9-]+)=("[^"]*"|[^,]*)/g;
        const body = line.slice(line.indexOf(':') + 1);
        let m;
        while ((m = re.exec(body))) attrs[m[1]] = m[2].startsWith('"') ? m[2].slice(1, -1) : m[2];
        return attrs;
    }

    function isMasterPlaylist(text) {
        return typeof text === 'string' && text.includes('#EXT-X-STREAM-INF');
    }

    // Renditions of a master playlist.
    function parseMaster(text, baseUrl) {
        const lines = text.split(/\r?\n/);
        const renditions = [];
        for (let i = 0; i < lines.length; i++) {
            if (!lines[i].startsWith('#EXT-X-STREAM-INF:')) continue;
            const uri = lines.slice(i + 1).find((l) => l && !l.startsWith('#'));
            if (!uri) continue;
            const a = parseAttributes(lines[i]);
            const resolution = a.RESOLUTION || '';
            renditions.push({
                url: baseUrl ? new URL(uri, baseUrl).href : uri,
                resolution,
                height: parseInt(resolution.split('x')[1], 10) || 0,
                frameRate: parseFloat(a['FRAME-RATE']) || 0,
                codecs: a.CODECS || '',
            });
        }
        return renditions;
    }

    function videoCodec(codecs) {
        const codec = codecs.split(',').map((c) => c.trim()).find((c) => !/^(mp4a|ac-3|ec-3|opus)/.test(c)) || '';
        return codec.slice(0, 4).replace('hvc1', 'hev1');
    }

    // The backup rendition closest to the one playing: the same resolution (and codec and
    // frame rate) if it is offered, otherwise the tallest one below it, otherwise the smallest.
    function pickRendition(renditions, wanted) {
        const sameCodec = renditions.filter((r) => !wanted || !wanted.codecs || videoCodec(r.codecs) === videoCodec(wanted.codecs));
        const pool = sameCodec.length ? sameCodec : renditions;
        if (!pool.length) return null;
        if (!wanted) return pool.reduce((a, b) => (b.height > a.height ? b : a));
        const rate = (r) => Math.abs(r.frameRate - wanted.frameRate);
        const exact = pool.filter((r) => r.resolution === wanted.resolution).sort((a, b) => rate(a) - rate(b));
        if (exact.length) return exact[0];
        const below = pool.filter((r) => r.height < wanted.height).sort((a, b) => b.height - a.height || rate(a) - rate(b));
        return below.length ? below[0] : pool.reduce((a, b) => (b.height < a.height ? b : a));
    }

    // Segments of a media playlist with their media sequence number, broadcast time and
    // duration (ms), and the init segment (EXT-X-MAP) they use.
    function timeline(text) {
        const { header, segments } = parse(text);
        let sn = mediaSequence(header);
        let pdt = NaN;
        let map = null;
        return {
            header,
            segments: segments.map((s) => {
                for (const t of s.tags) {
                    if (t.startsWith(PDT)) pdt = Date.parse(t.slice(PDT.length));
                    else if (t.startsWith('#EXT-X-MAP')) map = t;
                }
                const dur = parseFloat((s.tags.find((t) => t.startsWith('#EXTINF:')) || '#EXTINF:0').slice(8)) * 1000;
                const seg = { ...s, sn: sn++, pdt, dur, map };
                pdt += dur;
                return seg;
            }),
        };
    }

    // Once a session has used a backup, its playlists are numbered on one grid: a live
    // segment's media sequence number follows from its broadcast time, whichever stream
    // it came from. Main and backup playlists are numbered differently, and ad segments
    // (which never reach the player on this path) take up numbers in the main one.
    function makeGrid(anchor) {
        return { sn: anchor.sn, pdt: anchor.pdt, step: anchor.dur >= 500 ? anchor.dur : 2000 };
    }

    function gridSn(grid, pdt) {
        return grid.sn + Math.round((pdt - grid.pdt) / grid.step);
    }

    // Where a segment's cuts fall relative to the grid, to the nearest 100 ms. Segments of the
    // same phase line up cut for cut; after an ad break Twitch resumes the main stream on
    // other cuts (the last ad is trimmed, e.g. to 0.235s), so its live segments no longer line
    // up with the backup's, though they are numbered alike.
    function gridPhase(grid, pdt) {
        let phase = (((pdt - grid.pdt) % grid.step) + grid.step) % grid.step;
        if (phase > grid.step - 50) phase -= grid.step;
        return Math.round(phase / 100);
    }

    function keepSplicedTag(tag, fromMain) {
        if (tag.startsWith('#EXT-X-MAP') || tag === '#EXT-X-DISCONTINUITY') return false;
        if (tag.startsWith('#EXT-X-DATERANGE')) return fromMain && !hasAdTags(tag);
        return true;
    }

    // A rendition's identity: segments of renditions with the same key are interchangeable
    // (byte-identical at the same broadcast time); between different keys the resolution,
    // frame rate or H.264 profile changes.
    function variantKey(rendition) {
        return rendition ? `${rendition.resolution}@${Math.round(rendition.frameRate)}|${rendition.codecs}` : null;
    }

    // What one playlist URL has handed the player on the grid: the segment given for each
    // number (so a reload never swaps a segment's source under the player) and the numbers
    // where the rendition changes, which carry a discontinuity.
    function spliceMemory() {
        return { bySn: new Map(), switches: new Set(), droppedSwitches: 0 };
    }

    // Joins the live segments of the main and backup playlists on the grid (main wins where
    // both offer a new number) and returns the contiguous run that reaches the newest one.
    //
    // Wherever the stream changes (a backup at another resolution, frame rate or profile than
    // the one playing, or segments cut at other points, as the main stream is after a break)
    // an EXT-X-DISCONTINUITY is written: hls.js sets up the decoder for an MPEG-TS stream from
    // its first segments and keeps one timeline until a discontinuity, and a TV's hardware
    // decoder fails on parameters or timestamps that jump without one ("An error occurred
    // while playing this content"). The EXT-X-DISCONTINUITY-SEQUENCE counts the ones that
    // have slid out, so every reload numbers them alike.
    function splice(main, backup, grid, memory = spliceMemory(), keys = {}) {
        const mainKey = keys.main || 'main';
        const backupKey = keys.backup || 'backup';
        const offered = new Map();
        const add = (seg, fromMain) => {
            if (!seg.isAd && Number.isFinite(seg.pdt)) {
                offered.set(gridSn(grid, seg.pdt), { seg, fromMain, key: (fromMain ? mainKey : backupKey) + '~' + gridPhase(grid, seg.pdt) });
            }
        };
        if (backup) backup.segments.forEach((s) => add(s, false));
        main.segments.forEach((s) => add(s, true));
        if (!offered.size) return null;
        for (const sn of [...offered.keys()].sort((a, b) => a - b)) {
            if (memory.bySn.has(sn)) continue;
            const entry = offered.get(sn);
            const previous = memory.bySn.get(sn - 1);
            if (previous && previous.key !== entry.key) memory.switches.add(sn);
            memory.bySn.set(sn, entry);
        }
        const end = Math.max(...offered.keys());
        let start = end;
        while (offered.has(start - 1) && end - start < MAX_SPLICED_SEGMENTS - 1) start--;
        for (const sn of memory.bySn.keys()) if (sn < start - MAX_SPLICED_SEGMENTS) memory.bySn.delete(sn);
        for (const sn of memory.switches) {
            if (sn < start - MAX_SPLICED_SEGMENTS) {
                memory.switches.delete(sn);
                memory.droppedSwitches++;
            }
        }
        let discontinuitySequence = memory.droppedSwitches;
        for (const sn of memory.switches) if (sn < start) discontinuitySequence++;
        const header = (main.segments.length || !backup ? main.header : backup.header)
            .filter((l) => !l.startsWith('#EXT-X-MEDIA-SEQUENCE:') && !l.startsWith('#EXT-X-DISCONTINUITY-SEQUENCE:'));
        const lines = [...header, '#EXT-X-MEDIA-SEQUENCE:' + start];
        if (discontinuitySequence > 0) lines.push('#EXT-X-DISCONTINUITY-SEQUENCE:' + discontinuitySequence);
        let map = null;
        let fromBackup = 0;
        let discontinuities = 0;
        for (let sn = start; sn <= end; sn++) {
            const { seg, fromMain } = memory.bySn.get(sn);
            if (memory.switches.has(sn)) {
                lines.push('#EXT-X-DISCONTINUITY');
                discontinuities++;
                map = null;
            }
            if (seg.map && seg.map !== map) lines.push((map = seg.map));
            if (!fromMain) fromBackup++;
            lines.push(...seg.tags.filter((t) => keepSplicedTag(t, fromMain)), seg.uri);
        }
        return { playlist: lines.join('\n') + '\n', start, end, fromBackup, discontinuities };
    }

    // ---- Filter state -------------------------------------------------------------------

    // Playlist URL -> last playlist that reached the live edge. While ads occupy the
    // edge it is returned unchanged, so hls.js waits for new segments; a shrinking
    // trimmed window instead makes the player seek back and replay the last seconds.
    const lastLive = new Map();

    // Playback session -> media sequence number of the last ad handed to the player. Every
    // quality level of a session shares its numbering, so this is kept per session.
    const playedAds = new Map();

    // Playback session -> { grid, liveAfterAds, playlists }, where `playlists` maps each of the
    // session's playlist URLs (one per quality level) to its own backup and splice memory.
    const sessions = new Map();

    let now = () => Date.now();

    function sessionKey(url, text) {
        const match = /X-TV-TWITCH-SESSIONID="([^"]+)"/.exec(text);
        return match ? match[1] : url;
    }

    function sessionState(session) {
        if (!sessions.has(session)) sessions.set(session, { grid: null, liveAfterAds: false, playlists: new Map() });
        return sessions.get(session);
    }

    function playlistState(state, url) {
        const key = url.split('?')[0];
        if (!state.playlists.has(key)) {
            state.playlists.set(key, { backup: null, backupAt: 0, backupType: null, backupKey: null, memory: spliceMemory(), announced: false });
        }
        return state.playlists.get(key);
    }

    // What the player is being given during an ad break: 'backup' (the backup stream),
    // 'held' (the last live frame), 'ads' (the ads themselves) or 'none'. Only state
    // changes reach the native log, so a long stream does not flood logcat.
    let lastReportedState = null;

    function report(state, details) {
        if (typeof window === 'undefined') return;
        window.__seyAdBreak = { state, at: now() };
        if (state !== lastReportedState) {
            lastReportedState = state;
            notify('ad state: ' + state + (details ? ' - ' + details() : ''));
        } else {
            diagnose(details);
        }
    }

    function shape(text) {
        if (typeof text !== 'string') return '-';
        const runs = [];
        for (const s of timeline(text).segments) {
            const kind = s.isAd ? 'ad' : 'live';
            const last = runs[runs.length - 1];
            if (last && last.kind === kind && last.to === s.sn - 1) last.to = s.sn;
            else runs.push({ kind, from: s.sn, to: s.sn });
        }
        return runs.map((r) => `${r.kind}[${r.from}-${r.to}]`).join(' ') || 'empty';
    }

    // Detailed per-request diagnostics stay off in the app; the native bridge would log
    // one line per playlist refresh. Set DEBUG to true for troubleshooting.
    const DEBUG = false;

    function diagnose(details) {
        if (!DEBUG || !details) return;
        try {
            notify(details());
        } catch (e) { /* diagnostics are best effort */ }
    }

    function shortId(value) {
        let h = 0;
        for (let i = 0; i < value.length; i++) h = (h * 31 + value.charCodeAt(i)) | 0;
        return (h >>> 0).toString(36).slice(0, 5);
    }

    // hls.js is never handed a media playlist without segments: Twitch's player gives up
    // (about 20s) if playback can't start, which is shorter than a preroll. With no live
    // playlist to hold yet (joining during a preroll), the ads are passed through.
    //
    // `backupText` is the freshest backup playlist for this one (undefined: no news, null:
    // no backup without ads could be found), `backupRendition` the rendition it plays.
    function filterPlaylist(url, text, backupText, backupType, backupRendition) {
        if (!enabled) return text;
        if (typeof text !== 'string') return text;
        if (isMasterPlaylist(text)) {
            rememberMaster(url, text);
            return text;
        }
        if (!text.includes('#EXTINF')) return text;
        const session = sessionKey(url, text);
        const state = sessionState(session);
        const level = playlistState(state, url);
        if (backupText !== undefined) {
            level.backup = backupText ? timeline(backupText) : null;
            level.backupAt = now();
            level.backupType = backupText ? backupType || null : null;
            level.backupKey = backupText ? variantKey(backupRendition) : null;
        }
        lastPlaylistAt = now();
        const backup = level.backup && now() - level.backupAt < BACKUP_FRESH_MS ? level.backup : null;
        const result = stripAds(text, playedAds.has(session) ? playedAds.get(session) : -1);
        if (playedAds.has(session)) playedAds.set(session, result.playedThrough);
        const adsAtEdge = !result.complete;
        if (playedAds.has(session) && result.complete && result.kept !== 0) state.liveAfterAds = true;
        const log = (decision, out) => () =>
            `playlist ${shortId(session)}/${shortId(url.split('?')[0])} ${decision} in=${shape(text)} out=${shape(out)}` +
            (level.backupType ? ` backup=${level.backupType}` + (level.backupKey && level.backupKey !== mainVariantKey(url) ? ' (other rendition)' : '') : '');

        if (state.grid || (adsAtEdge && backup && backupAllowed(session))) {
            const main = timeline(text);
            if (!state.grid) state.grid = makeGrid(gridAnchor(url, main, backup));
            const spliced = splice(main, backup, state.grid, level.memory, { main: mainVariantKey(url), backup: level.backupKey });
            if (spliced && (!adsAtEdge || spliced.fromBackup > 0)) {
                lastLive.set(url, spliced.playlist);
                if (adsAtEdge && !level.announced) notify('ad break: playing the ' + level.backupType + ' stream');
                level.announced = adsAtEdge;
                report(adsAtEdge ? 'backup' : 'none', log(adsAtEdge ? 'spliced' : 'live', spliced.playlist));
                return spliced.playlist;
            }
        }
        if (result.complete) {
            lastLive.set(url, result.playlist);
            if (result.removed > 0) notify('removed ' + result.removed + ' ad segment(s)');
            report('none', log(result.removed > 0 ? 'stripped' : 'live', result.playlist));
            return result.playlist;
        }
        const held = lastLive.get(url);
        if (held) {
            notify('ad break: holding last live playlist');
            report('held', log('held', held));
            return held;
        }
        if (result.live > 0) {
            report('held', log('truncated', result.playlist));
            return result.playlist;
        }
        notify('ad break before any live segments: letting it play');
        const { header, segments } = parse(text);
        playedAds.set(session, mediaSequence(header) + segments.length - 1);
        report('ads', log('ads-through', text));
        return text;
    }

    // Where the grid starts: the newest live segment the player already has, so its
    // numbering carries on; with nothing yet (joining during a break), the backup's own.
    function gridAnchor(url, main, backup) {
        const previous = lastLive.has(url) ? timeline(lastLive.get(url)).segments.filter((s) => !s.isAd) : [];
        if (previous.length) return previous[previous.length - 1];
        const live = main.segments.filter((s) => !s.isAd);
        if (live.length) return live[live.length - 1];
        return backup.segments[0];
    }

    // ---- Fetching the backup ----------------------------------------------------------

    const backupConfig = { login: null, usher: null, renditions: [], clientId: null, deviceId: null, authorization: null };
    const backupTypes = new Map();
    let backupFailedUntil = 0;
    let realFetch = null;
    let lastPlaylistAt = 0;
    let warmTimer = null;

    // A new backup session starts with a preroll of its own, which would leave it useless for
    // a break that is already running. So the first backup types' sessions are opened when the
    // stream starts and their playlists checked once a minute, so they are past their prerolls
    // (and known to be up) by the time a mid-roll comes. Stops when playback does.
    const WARM_PLAYER_TYPES = BACKUP_PLAYER_TYPES.slice(0, 2);
    const WARM_INTERVAL_MS = 60000;

    function warmBackups() {
        if (!enabled) return;
        if (!realFetch || !backupConfig.clientId || !backupConfig.login) return;
        for (const type of WARM_PLAYER_TYPES) {
            const entry = backupEntry(type);
            (async () => {
                if (!entry.renditions) {
                    entry.renditions = await fetchBackupRenditions(type);
                    entry.at = now();
                }
                const rendition = pickRendition(entry.renditions, null);
                const response = await realFetch(rendition.url);
                if (!response.ok) throw new Error('playlist ' + response.status);
                const live = stripAds(await response.text()).complete;
                diagnose(() => `backup ${type}: warm, ${live ? 'live' : 'in an ad break'}`);
            })().catch((e) => {
                entry.renditions = null;
                diagnose(() => `backup ${type}: warm-up failed: ${e && e.message}`);
            });
        }
    }

    function scheduleWarmUp() {
        setTimeout(warmBackups, 0);
        if (warmTimer) return;
        warmTimer = setInterval(() => {
            if (now() - lastPlaylistAt > 2 * WARM_INTERVAL_MS) {
                clearInterval(warmTimer);
                warmTimer = null;
                return;
            }
            warmBackups();
        }, WARM_INTERVAL_MS);
        if (warmTimer.unref) warmTimer.unref();
    }

    function backupEntry(type) {
        if (!backupTypes.has(type)) backupTypes.set(type, { renditions: null, at: 0, adsUntil: 0 });
        return backupTypes.get(type);
    }

    function rememberMaster(url, text) {
        const channel = /\/channel\/hls\/([^/?]+)\.m3u8/.exec(url);
        if (!channel) return;
        backupConfig.login = decodeURIComponent(channel[1]).toLowerCase();
        backupConfig.usher = url;
        backupConfig.renditions = parseMaster(text, url);
        backupTypes.clear();
        backupFailedUntil = 0;
        lastPlaylistAt = now();
        scheduleWarmUp();
        notify('stream ' + backupConfig.login + ': ' + backupConfig.renditions.length + ' renditions');
    }

    // The rendition a main playlist URL plays, from the master playlist it was listed in.
    function mainRendition(url) {
        return backupConfig.renditions.find((r) => r.url.split('?')[0] === url.split('?')[0]) || null;
    }

    function mainVariantKey(url) {
        return variantKey(mainRendition(url)) || 'main';
    }

    function rememberGqlHeaders(headers) {
        const get = (name) => {
            if (!headers) return null;
            if (typeof headers.get === 'function') return headers.get(name);
            const key = Object.keys(headers).find((k) => k.toLowerCase() === name.toLowerCase());
            return key ? headers[key] : null;
        };
        const clientId = get('Client-Id');
        if (!clientId) return;
        const first = !backupConfig.clientId;
        backupConfig.clientId = clientId;
        backupConfig.deviceId = get('Device-Id') || get('X-Device-Id') || backupConfig.deviceId;
        backupConfig.authorization = get('Authorization') || backupConfig.authorization;
        if (first) notify('gql client captured');
    }

    // Ads that were handed to the player (joining during a break with no backup) must play
    // on into live: hls.js can only leave them in sequence. Once it is playing live again,
    // backup segments, numbered on from its live segments, are safe.
    function backupAllowed(session) {
        return !playedAds.has(session) || sessionState(session).liveAfterAds;
    }

    // Whether this response should wait for a backup playlist: ads at the live edge, and no
    // ads still playing in the player.
    function wantsBackup(url, text) {
        if (!enabled) return false;
        if (isMasterPlaylist(text) || !hasAds(text) || stripAds(text).complete) return false;
        if (!realFetch || !backupConfig.login || !backupConfig.clientId) {
            diagnose(() => `backup: not set up (channel ${!!backupConfig.login}, client ${!!backupConfig.clientId})`);
            return false;
        }
        return now() >= backupFailedUntil && backupAllowed(sessionKey(url, text));
    }

    async function fetchBackupRenditions(type) {
        const headers = { 'Content-Type': 'application/json', 'Client-Id': backupConfig.clientId };
        if (backupConfig.deviceId) headers['Device-Id'] = backupConfig.deviceId;
        if (backupConfig.authorization) headers.Authorization = backupConfig.authorization;
        const response = await realFetch('https://gql.twitch.tv/gql', {
            method: 'POST',
            headers,
            body: JSON.stringify({
                query: 'query CeladonTVBackupToken($login: String!, $playerType: String!) { streamPlaybackAccessToken(channelName: $login, params: {platform: "android_tv", playerBackend: "hlsjs", playerType: $playerType}) { value signature } }',
                variables: { login: backupConfig.login, playerType: type },
            }),
        });
        const body = await response.json();
        const token = body && body.data && body.data.streamPlaybackAccessToken;
        if (!token) throw new Error('no token: ' + JSON.stringify(body && body.errors).slice(0, 200));
        const usher = new URL(backupConfig.usher);
        usher.searchParams.set('player_type', type);
        usher.searchParams.set('sig', token.signature);
        usher.searchParams.set('token', token.value);
        const master = await realFetch(usher.href);
        if (!master.ok) throw new Error('usher ' + master.status);
        return parseMaster(await master.text(), usher.href);
    }

    // A backup whose stream has no ads at its live edge right now. Types offering exactly the
    // rendition playing come first: their segments are byte-identical to it, so the switch is
    // invisible. Otherwise the first type with a clean stream, at the closest rendition.
    async function fetchBackup(mainUrl) {
        const wanted = mainRendition(mainUrl);
        const wantedKey = variantKey(wanted);
        const tried = new Set();
        for (const exact of wantedKey ? [true, false] : [false]) {
            for (const type of BACKUP_PLAYER_TYPES) {
                const entry = backupEntry(type);
                if (entry.adsUntil > now()) continue;
                try {
                    // A session is kept as long as it works: a new one would start with a preroll.
                    if (!entry.renditions) {
                        entry.renditions = await fetchBackupRenditions(type);
                        entry.at = now();
                    }
                    const rendition = exact ? entry.renditions.find((r) => variantKey(r) === wantedKey) : pickRendition(entry.renditions, wanted);
                    if (!rendition || tried.has(type + ' ' + rendition.url)) continue;
                    tried.add(type + ' ' + rendition.url);
                    const response = await realFetch(rendition.url);
                    if (!response.ok) throw new Error('playlist ' + response.status);
                    const text = await response.text();
                    // A new backup session may start with a preroll; only its live edge matters.
                    if (!stripAds(text).complete) {
                        entry.adsUntil = now() + 30000;
                        diagnose(() => `backup ${type}: has ads too`);
                        continue;
                    }
                    diagnose(() => `backup ${type}: ${rendition.resolution} ok` + (variantKey(rendition) === wantedKey ? '' : ' (other rendition)'));
                    return { type, text, rendition };
                } catch (e) {
                    entry.renditions = null;
                    diagnose(() => `backup ${type} failed: ${e && e.message}`);
                }
            }
        }
        backupFailedUntil = now() + 10000;
        diagnose(() => 'backup: none without ads');
        return null;
    }

    function withTimeout(promise, ms) {
        return new Promise((resolve, reject) => {
            const timer = setTimeout(() => reject(new Error('timeout')), ms);
            promise.then(
                (v) => { clearTimeout(timer); resolve(v); },
                (e) => { clearTimeout(timer); reject(e); },
            );
        });
    }

    // hls.js loads playlists with XHR. A media playlist with ads at the live edge completes
    // only once a backup playlist has been fetched (or given up on), so the first playlist
    // of a break already carries the backup's segments.
    const BACKUP_WAIT_MS = 4000;

    function hookXhr(XHR) {
        const proto = XHR.prototype;
        const realOpen = proto.open;
        proto.open = function (method, url) {
            this.__ctvPlaylistUrl = isPlaylistUrl(String(url)) ? String(url) : null;
            this.__ctvFiltered = undefined;
            return realOpen.apply(this, arguments);
        };
        const textDesc = Object.getOwnPropertyDescriptor(proto, 'responseText');
        for (const prop of ['responseText', 'response']) {
            const desc = Object.getOwnPropertyDescriptor(proto, prop);
            Object.defineProperty(proto, prop, {
                configurable: true,
                enumerable: desc.enumerable,
                get: function () {
                    const value = desc.get.call(this);
                    if (!this.__ctvPlaylistUrl || this.readyState !== 4 || typeof value !== 'string') return value;
                    if (this.__ctvFiltered === undefined) this.__ctvFiltered = filterPlaylist(this.__ctvPlaylistUrl, value);
                    return this.__ctvFiltered;
                },
            });
        }
        const handlerDesc = Object.getOwnPropertyDescriptor(proto, 'onreadystatechange');
        if (!handlerDesc || !handlerDesc.set) return;
        Object.defineProperty(proto, 'onreadystatechange', {
            configurable: true,
            enumerable: handlerDesc.enumerable,
            get: function () {
                return this.__ctvHandler !== undefined ? this.__ctvHandler : handlerDesc.get.call(this);
            },
            set: function (handler) {
                this.__ctvHandler = handler;
                if (typeof handler !== 'function') {
                    handlerDesc.set.call(this, handler);
                    return;
                }
                const xhr = this;
                handlerDesc.set.call(this, function (event) {
                    const url = xhr.__ctvPlaylistUrl;
                    if (xhr.readyState === 4 && url && xhr.__ctvFiltered === undefined && xhr.status === 200) {
                        const raw = textDesc.get.call(xhr);
                        if (typeof raw === 'string' && wantsBackup(url, raw)) {
                            withTimeout(fetchBackup(url), BACKUP_WAIT_MS)
                                .then(
                                    (backup) => filterPlaylist(url, raw, backup ? backup.text : null, backup && backup.type, backup && backup.rendition),
                                    () => filterPlaylist(url, raw),
                                )
                                .then((filtered) => {
                                    xhr.__ctvFiltered = filtered;
                                    if (xhr.__ctvHandler === handler) handler.call(xhr, event);
                                });
                            return undefined;
                        }
                    }
                    return handler.call(this, event);
                });
            },
        });
    }

    function hookFetch(win) {
        const original = win.fetch;
        realFetch = original.bind(win);
        win.fetch = function (input, init) {
            const url = typeof input === 'string' ? input : input && input.url;
            if (typeof url === 'string' && url.startsWith('https://gql.twitch.tv/')) {
                rememberGqlHeaders((init && init.headers) || (input && input.headers));
            }
            const pending = original.apply(this, arguments);
            if (!isPlaylistUrl(url)) return pending;
            return pending.then(async (response) => {
                if (!response.ok) return response;
                const filtered = new Response(filterPlaylist(url, await response.text()), {
                    status: response.status,
                    statusText: response.statusText,
                    headers: response.headers,
                });
                Object.defineProperty(filtered, 'url', { value: response.url });
                return filtered;
            });
        };
    }

    if (typeof window !== 'undefined' && window.top === window && !window.__seyAdBlock) {
        window.__seyAdBlock = true;
        try {
            if (window.seyttingsAds && window.seyttingsAds.isEnabled) {
                enabled = !!window.seyttingsAds.isEnabled();
            }
        } catch (e) { /* native bridge unavailable */ }
        hookXhr(window.XMLHttpRequest);
        hookFetch(window);
        window.__seyAdBlockSetEnabled = setEnabled;
        window.__seyAdBlockState = () => ({ enabled, lastState: lastReportedState, login: backupConfig.login, clientId: !!backupConfig.clientId });
        notify('hls.js ad filter installed, enabled=' + enabled);
    }

    if (typeof module !== 'undefined') {
        module.exports = {
            stripAds,
            hasAdTags,
            isPlaylistUrl,
            filterPlaylist,
            parseMaster,
            pickRendition,
            timeline,
            splice,
            spliceMemory,
            variantKey,
            makeGrid,
            hookXhr,
            hookFetch,
            setClock: (clock) => {
                now = clock;
            },
            reset: () => {
                lastLive.clear();
                playedAds.clear();
                sessions.clear();
                backupTypes.clear();
                Object.assign(backupConfig, { login: null, usher: null, renditions: [], clientId: null, deviceId: null, authorization: null });
                backupFailedUntil = 0;
                clearInterval(warmTimer);
                warmTimer = null;
            },
        };
    }
})();
