(function (runtime) {
    'use strict';
    var records = new Map(), empty = new Map(), emptyPicker = [], listeners = new Set(), failures = new Map();
    var globals = [null, null, null], globalJobs = [null, null, null], globalRetry = [0, 0, 0];
    var providers = ['bttv', '7tv', 'ffz'], observations = new Map(), lastMatch = 0;
    var globalURLs = ['https://api.betterttv.net/3/cached/emotes/global', 'https://7tv.io/v3/emote-sets/global',
        'https://api.frankerfacez.com/v1/set/global'];
    var channelURLs = ['https://api.betterttv.net/3/cached/users/twitch/', 'https://7tv.io/v3/users/twitch/',
        'https://api.frankerfacez.com/v1/room/id/'];
    function imageObservation(category, provider, format) {
        if (!providers.includes(provider)) provider = 'unknown';
        if (format !== 'gif' && format !== 'png' && format !== 'webp') format = 'unknown';
        var key = category + '/' + provider + '/' + format;
        if (Date.now() - (observations.get(key) || 0) <= 5000) return;
        observations.set(key, Date.now());
        runtime.log('emotes image ' + category + ' provider=' + provider + ' format=' + format);
    }
    function notify() { listeners.forEach(function (callback) { callback(); }); }
    function compose(record) {
        var next = new Map();
        [globals, record.parts].forEach(function (parts) {
            [2, 0, 1].forEach(function (index) {
                var part = parts[index];
                if (runtime.enabled(8 + index) && part) part.forEach(function (value, name) { next.set(name, value); });
            });
        });
        record.snapshot = next;
        record.picker = [];
        providers.forEach(function (provider, index) {
            if (!runtime.enabled(8 + index)) return;
            [record.parts[index], globals[index]].forEach(function (part, scope) {
                if (!part || !part.size) return;
                record.picker.push({provider: provider, channel: scope === 0, emotes: Array.from(part.values())});
            });
        });
    }
    function request(url) {
        var controller = new AbortController();
        var timeout = setTimeout(function () { controller.abort(); }, 12000);
        var promise = fetch(url, {signal: controller.signal, credentials: 'omit', redirect: 'error'})
            .then(function (response) {
                if (response.status === 404) return {};
                if (!response.ok) throw new Error('Emote provider unavailable');
                var length = Number(response.headers.get('content-length'));
                if (length > 8388608) throw new Error('Emote catalog exceeds bounds');
                return response.text().then(function (text) {
                    if (text.length > 8388608) throw new Error('Emote catalog exceeds bounds');
                    return JSON.parse(text);
                });
            }).finally(function () { clearTimeout(timeout); });
        return {promise: promise, cancel: function () { controller.abort(); }};
    }
    function globalCatalog(index) {
        if (!runtime.enabled(8 + index) || globals[index] || globalJobs[index] || Date.now() < globalRetry[index]) return;
        var job = request(globalURLs[index]);
        globalJobs[index] = job;
        job.promise.then(function (data) {
            if (globalJobs[index] !== job) return;
            globals[index] = runtime.emoteProviders.parse(providers[index], data, false);
            records.forEach(compose); notify();
        }).catch(function () {
            if (globalJobs[index] === job) { globalRetry[index] = Date.now() + 60000; runtime.log('emotes global unavailable'); }
        })
            .finally(function () { if (globalJobs[index] === job) globalJobs[index] = null; });
    }
    function ensure(record) {
        if (!runtime.enabled(5) || !runtime.enabled(3) || !record.refs) return;
        providers.forEach(function (provider, index) {
            if (!runtime.enabled(8 + index)) return;
            globalCatalog(index);
            if (record.jobs[index] || Date.now() < record.retry[index] ||
                (record.parts[index] && Date.now() - record.loaded[index] < 900000)) return;
            var job = request(channelURLs[index] + record.id);
            record.jobs[index] = job;
            job.promise.then(function (data) {
                if (record.jobs[index] !== job || !record.refs) return;
                record.parts[index] = runtime.emoteProviders.parse(provider, data, true);
                record.loaded[index] = Date.now(); compose(record); notify();
                runtime.log('emotes channel catalog provider=' + provider + ' count=' + record.parts[index].size);
            }).catch(function () {
                if (record.jobs[index] === job) { record.retry[index] = Date.now() + 60000; runtime.log('emotes channel unavailable'); }
            })
                .finally(function () { if (record.jobs[index] === job) record.jobs[index] = null; });
        });
    }
    function cancel(record) {
        record.jobs.forEach(function (job) { if (job) job.cancel(); });
        record.jobs = [null, null, null];
    }
    function retain(id) {
        if (typeof id !== 'string' || !/^\d{1,20}$/.test(id)) return function () {};
        var record = records.get(id);
        if (!record) {
            if (records.size >= 8) {
                var old = Array.from(records.values()).find(function (value) { return !value.refs; });
                if (!old) return function () {};
                cancel(old); records.delete(old.id);
            }
            record = {id: id, refs: 0, parts: [null, null, null], jobs: [null, null, null], loaded: [0, 0, 0], retry: [0, 0, 0], snapshot: empty};
            records.set(id, record); compose(record);
        }
        record.refs++; ensure(record); notify();
        return function () { record.refs--; if (!record.refs) cancel(record); };
    }
    runtime.subscribe(function () {
        var active = runtime.enabled(5) && runtime.enabled(3);
        globalJobs.forEach(function (job, index) {
            if (active && runtime.enabled(8 + index)) return;
            if (job) job.cancel(); globalJobs[index] = null;
        });
        records.forEach(function (record) {
            record.jobs.forEach(function (job, index) {
                if (active && runtime.enabled(8 + index)) return;
                if (job) job.cancel(); record.jobs[index] = null;
            });
            compose(record);
            if (active) ensure(record);
        });
        notify();
    });
    runtime.emotes = {
        retain: retain,
        snapshot: function (id) { var record = records.get(id); return record ? record.snapshot : empty; },
        pickerSnapshot: function (id) { var record = records.get(id); return record ? record.picker : emptyPicker; },
        subscribe: function (callback) { listeners.add(callback); return function () { listeners.delete(callback); }; },
        failed: {has: function (url) {
            var failed = failures.get(url);
            if (failed != null && Date.now() - failed < 60000) return true;
            failures.delete(url); return false;
        }},
        fail: function (url, provider, format) {
            if (failures.size >= 128) failures.delete(failures.keys().next().value);
            failures.set(url, Date.now()); records.forEach(compose); notify(); imageObservation('unavailable', provider, format);
        },
        loaded: function (provider, format) { imageObservation('loaded', provider, format); },
        matched: function (count) {
            if (Date.now() - lastMatch > 5000) { lastMatch = Date.now(); runtime.log('emotes ranges added count=' + count); }
        }
    };
})(globalThis.__twitchPatchRuntime);
