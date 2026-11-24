/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 *
 * Frida ART fixture for the patched 9.40.51 process. Use a separate offline session from live playback.
 * This creates isolated stock model objects, calls the packaged filter, and makes no app-data writes.
 */
'use strict';

Java.perform(() => {
    const FormatProto = Java.use('akwg');
    const TrackProto = Java.use('ajdf');
    const Format = Java.use('wbv');
    const List = Java.use('java.util.ArrayList');
    const String = Java.use('java.lang.String');
    const Predicate = Java.use('yjq');
    const Selection = Java.use('app.morphe.extension.music.patches.MusicDrcSelection');
    const Request = Java.use('com.google.android.libraries.youtube.media.interfaces.PlaybackAgnosticUserPreferences');
    const Normalization = Java.use('app.morphe.extension.shared.patches.DrcAudioPatch');

    function check(condition, description) {
        if (!condition) throw new Error(description);
    }

    function construct(type) {
        const constructor = type.class.getDeclaredConstructor(Java.array('java.lang.Class', []));
        constructor.setAccessible(true);
        return Java.cast(constructor.newInstance(Java.array('java.lang.Object', [])), type);
    }

    function field(type, name) {
        const result = type.class.getDeclaredField(name);
        result.setAccessible(true);
        return result;
    }

    function model(itag, mime, trackId, drc) {
        const track = construct(TrackProto);
        field(TrackProto, 'd').set(track, String.$new(trackId));

        const proto = construct(FormatProto);
        field(FormatProto, 'e').setInt(proto, itag);
        field(FormatProto, 'g').set(proto, String.$new(mime));
        field(FormatProto, 'y').set(proto, track);
        field(FormatProto, 'L').setBoolean(proto, drc);

        // The URL stays at the protobuf default. The native format constructor only parses it; no reader is opened.
        const format = Format.$new(proto, null, false, null);
        check(format.e() === itag && format.Q() === drc && format.rvxIsDrc() === drc
            && format.rvxAudioTrackId() === trackId && format.rvxMimeType() === mime, 'stock format bridge');
        return format;
    }

    function list(...models) {
        const candidates = List.$new();
        for (const item of models) candidates.add(item);
        return candidates;
    }

    function snapshot(candidates) {
        const rows = [];
        for (let index = 0; index < candidates.size(); index++) {
            const item = Java.cast(candidates.get(index), Format);
            rows.push([item.e(), item.rvxMimeType(), item.rvxAudioTrackId(), item.Q()]);
        }
        return JSON.stringify(rows);
    }

    try {
        const opus = 'audio/webm; codecs="opus"';
        const original = model(251, opus, 'en.1', false);
        const compressed = model(251, opus, 'en.1', true);
        const onlyDub = model(251, opus, 'es.1', true);
        const originalAac = model(140, 'audio/mp4; codecs="mp4a.40.2"', 'en.1', false);
        const video = model(134, 'video/mp4', '', false);

        const pair = list(compressed, onlyDub, original, originalAac, video);
        const originalRows = snapshot(pair);
        check(Selection.selectOriginal(pair, false) === 7 && snapshot(pair) === originalRows,
            'preference off did not preserve the offered list');
        check(Selection.selectOriginal(pair, true) === 7
            && snapshot(pair) === snapshot(list(onlyDub, original, originalAac, video)),
            'same-itag pair was not selected by native DRC metadata within the same track');

        const fallback = list(onlyDub, video);
        check(Selection.selectOriginal(fallback, true) === 2 && snapshot(fallback) === snapshot(list(onlyDub, video)),
            'DRC-only fallback was removed');
        const distinctTracks = list(onlyDub, original);
        check(Selection.selectOriginal(distinctTracks, true) === 3
            && snapshot(distinctTracks) === snapshot(list(onlyDub, original)),
        'unrelated original track was incorrectly treated as a pair');

        // Use the exact runtime gate with the current (unmodified) preference. Where stock owns the
        // choice, exercise the same stock removeIf predicate that follows this gate in Lyjx;->a.
        const prefersOriginal = !Selection.requestDrc(true);
        const runtime = list(compressed, original);
        if (Selection.useStockFilter(runtime, true)) {
            runtime.removeIf(Predicate.$new(true, 2));
        }
        check(snapshot(runtime) === snapshot(list(prefersOriginal ? original : compressed)), 'runtime selection gate');
        check(Selection.capabilityDrc(true, original) === !prefersOriginal
            && Selection.capabilityDrc(false, onlyDub) === prefersOriginal, 'SABR capability fallback');

        const request = Request.$new(true, 'en.1', 1, 0, 0, 0);
        check(field(Request, 'isDrcEnabled').getBoolean(request) === !prefersOriginal, 'native request constructor');
        send({
            fixture: 'music-drc-9.40.51',
            passed: true,
            prefersOriginal,
            normalizationDisabled: Normalization.disableDrcAudio(),
        });
    } catch (error) {
        send({ fixture: 'music-drc-9.40.51', passed: false, reason: error.message });
    }
});
