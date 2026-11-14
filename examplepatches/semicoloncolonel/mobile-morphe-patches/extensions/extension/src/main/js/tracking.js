// Block tracking: drop analytics and ad beacons the page fires, through fetch, sendBeacon and
// XMLHttpRequest. Only pure telemetry/ad hosts and paths are blocked; playback, watch history,
// resume, sign-in and the InnerTube content APIs (player, browse, next, guide, att/attestation,
// api/stats/playback and watchtime) are deliberately left alone so nothing breaks.
(function () {
    if (!window.youtv || location.hostname !== "www.youtube.com") return;

    // Pure analytics / ad beacons. Each is fire-and-forget, so dropping it changes nothing the
    // app waits on.
    var BLOCK = [
        /\/pagead\//i,            // ad serving and conversion pings
        /doubleclick\.net/i,      // ad tracking
        /googlesyndication\.com/i,
        /googleadservices\.com/i,
        /\/ptracking/i,           // playback ad/attribution tracking beacon
        /\/pcs\//i,               // active-view ad measurement
        /\/api\/stats\/atr/i,     // ad telemetry
        /\/youtubei\/v1\/log_event/i, // InnerTube event logging (analytics)
        /\/generate_204/i,        // empty tracking beacons
    ];

    function blocked(url) {
        try { url = String(url); } catch (e) { return false; }
        for (var i = 0; i < BLOCK.length; i++) if (BLOCK[i].test(url)) return true;
        return false;
    }

    var count = 0;
    function note() {
        count++;
        if (count === 1 || count % 50 === 0) youtv.report("tracking: blocked " + count + " beacon(s)");
    }

    // fetch
    var fetch0 = window.fetch;
    if (typeof fetch0 === "function") {
        window.fetch = function (input, init) {
            var url = (input && input.url) || input;
            if (blocked(url)) {
                note();
                try { return Promise.resolve(new Response("", { status: 204, statusText: "No Content" })); }
                catch (e) { return Promise.resolve(); }
            }
            return fetch0.apply(this, arguments);
        };
    }

    // navigator.sendBeacon (fire-and-forget; report success so callers do not retry)
    var beacon0 = navigator.sendBeacon && navigator.sendBeacon.bind(navigator);
    if (beacon0) {
        navigator.sendBeacon = function (url, data) {
            if (blocked(url)) { note(); return true; }
            return beacon0(url, data);
        };
    }

    // XMLHttpRequest
    var open0 = XMLHttpRequest.prototype.open;
    XMLHttpRequest.prototype.open = function (method, url) {
        this.__yttvBlocked = blocked(url);
        return open0.apply(this, arguments);
    };
    var send0 = XMLHttpRequest.prototype.send;
    XMLHttpRequest.prototype.send = function () {
        if (this.__yttvBlocked) { note(); return; }
        return send0.apply(this, arguments);
    };

    youtv.report("tracking: beacon blocker installed");
})();
