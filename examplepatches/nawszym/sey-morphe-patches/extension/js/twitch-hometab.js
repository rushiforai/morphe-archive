// Sey Morphe patches - Twitch TV default home tab.
//
// Twitch TV opens the remote Next.js UI on the same tab every launch. This
// helper navigates to a chosen tab (Home, Following, Browse or Search) once
// per app start, so the app lands on the tab the user picked in SEYTTINGS.
//
// Navigation is click-only: it waits for the shell's nav links to render,
// clicks the matching link (proper React navigation), and retries briefly
// until the tab is reached. It never rewrites the location (that triggers a
// Next.js popstate reload and loses the retry loop) and it never re-applies
// on an interval, so the user stays free to move around after the app has
// started.
//
// Distributed as part of the Sey Morphe patches under the GNU GPL v3.
(function () {
    'use strict';

    var BOOT = 'window.__seyHomeTabBooted';
    var MAX_ATTEMPTS = 40;
    var RETRY_MS = 800;
    var NAV_WAIT_MS = 3000;

    // Tab definitions matched against the real Twitch TV web shell. Routes are
    // used to identify the right nav link by href; labels are the visible text
    // used as a fallback.
    var TABS = {
        'Home': {
            routes: ['/', '/home'],
            labels: ['Home']
        },
        'Following': {
            routes: ['/following', '/followed-channels'],
            labels: ['Following']
        },
        'Browse': {
            routes: ['/directory', '/browse', '/explore'],
            labels: ['Browse', 'Categories', 'Explore']
        },
        'Search': {
            routes: ['/search'],
            labels: ['Search']
        }
    };

    function notify(message) {
        try {
            if (window.seyttingsHomeTab && window.seyttingsHomeTab.report) {
                window.seyttingsHomeTab.report(String(message));
            }
        } catch (e) { /* bridge unavailable */ }
    }

    function currentPath() {
        try {
            return (location.pathname || '/') + (location.search || '');
        } catch (e) {
            return '/';
        }
    }

    function normalizePath(value) {
        if (!value) {
            return '/';
        }
        var clean = String(value).split('#')[0].split('?')[0];
        if (clean.length > 1 && clean.charAt(clean.length - 1) === '/') {
            clean = clean.substring(0, clean.length - 1);
        }
        return clean;
    }

    function routeMatches(path, route) {
        var target = normalizePath(route);
        var actual = normalizePath(path);
        if (target === '/') {
            return actual === '/' || actual === '/home';
        }
        return actual === target || actual.indexOf(target + '/') === 0;
    }

    function isOnTab(tabName) {
        var spec = TABS[tabName];
        if (!spec) {
            return false;
        }
        var path = currentPath();
        var i;
        for (i = 0; i < spec.routes.length; i++) {
            if (routeMatches(path, spec.routes[i])) {
                return true;
            }
        }
        return false;
    }

    function textOf(el) {
        var text = '';
        try {
            text = (el.getAttribute('aria-label') || el.textContent || '').replace(/\s+/g, ' ').trim();
        } catch (e) {
            text = '';
        }
        return text;
    }

    function hrefOf(el) {
        try {
            return el.getAttribute('href') || '';
        } catch (e) {
            return '';
        }
    }

    function labelMatches(text, labels) {
        if (!text) {
            return false;
        }
        var lower = text.toLowerCase();
        var i;
        for (i = 0; i < labels.length; i++) {
            if (lower === labels[i].toLowerCase()) {
                return true;
            }
        }
        return false;
    }

    function navControls() {
        var selector = 'a[href],[role="link"],[role="tab"],[role="button"],button';
        var nodes;
        try {
            nodes = document.querySelectorAll(selector);
        } catch (e) {
            return [];
        }
        return Array.prototype.slice.call(nodes);
    }

    // Finds the nav control for a tab by href route match first, then by
    // visible label.
    function findControl(tabName) {
        var spec = TABS[tabName];
        if (!spec) {
            return null;
        }
        var controls = navControls();
        var i, j;
        for (i = 0; i < controls.length; i++) {
            var href = hrefOf(controls[i]);
            if (!href || href.indexOf('http') === 0) {
                continue;
            }
            for (j = 0; j < spec.routes.length; j++) {
                if (routeMatches(href, spec.routes[j])) {
                    return controls[i];
                }
            }
        }
        for (i = 0; i < controls.length; i++) {
            if (labelMatches(textOf(controls[i]), spec.labels)) {
                return controls[i];
            }
        }
        return null;
    }

    function clickControl(el) {
        try {
            el.focus();
        } catch (e) { /* not focusable */ }
        try {
            el.click();
            return true;
        } catch (e) { /* click unavailable */ }
        try {
            var event = new MouseEvent('click', { bubbles: true, cancelable: true, view: window });
            el.dispatchEvent(event);
            return true;
        } catch (e2) {
            return false;
        }
    }

    // Click-only navigation. Waits for the shell's nav to render, clicks the
    // matching link, retries while the tab isn't reached. No location rewrite,
    // no interval — one shot at startup only.
    function applyOnce(tabName) {
        var attempts = 0;
        var lastControl = null;
        function tick() {
            try {
                if (isOnTab(tabName)) {
                    notify('Default home tab: reached ' + tabName + ' at ' + currentPath());
                    return;
                }
                var control = findControl(tabName);
                if (control) {
                    lastControl = control;
                    if (clickControl(control)) {
                        notify('Default home tab: clicked ' + tabName);
                    } else {
                        notify('Default home tab: click failed for ' + tabName);
                    }
                } else {
                    if (lastControl !== null) {
                        notify('Default home tab: control lost for ' + tabName);
                    } else {
                        notify('Default home tab: no control yet for ' + tabName);
                    }
                }
            } catch (e) { /* never throw into the page */ }
            attempts++;
            if (!isOnTab(tabName) && attempts < MAX_ATTEMPTS) {
                setTimeout(tick, RETRY_MS);
            } else if (!isOnTab(tabName)) {
                notify('Default home tab: gave up on ' + tabName + ' at ' + currentPath());
            }
        }
        // Give the shell time to mount its navigation before clicking.
        setTimeout(tick, NAV_WAIT_MS);
    }

    function readBridge() {
        var enabled = false;
        var tab = 'Home';
        try {
            if (window.seyttingsHomeTab && window.seyttingsHomeTab.isEnabled) {
                enabled = !!window.seyttingsHomeTab.isEnabled();
            }
        } catch (e) { /* native bridge unavailable */ }
        try {
            if (window.seyttingsHomeTab && window.seyttingsHomeTab.getHomeTab) {
                var saved = window.seyttingsHomeTab.getHomeTab();
                if (saved && TABS[saved]) {
                    tab = saved;
                }
            }
        } catch (e) { /* native bridge unavailable */ }
        return { enabled: enabled, tab: tab };
    }

    function setEnabled(on) {
        on = !!on;
        var info = readBridge();
        if (!on) {
            notify('Default home tab: disabled');
            return;
        }
        applyOnce(info.tab);
        notify('Default home tab: enabled (' + info.tab + ')');
    }

    function setTab(tabName) {
        if (!TABS[tabName]) {
            return;
        }
        applyOnce(tabName);
        notify('Default home tab: set to ' + tabName);
    }

    if (typeof window !== 'undefined' && window.top === window && !window[BOOT]) {
        window[BOOT] = true;

        window.__seyHomeTabApply = function () {
            var info = readBridge();
            if (info.enabled) {
                applyOnce(info.tab);
            }
        };
        window.__seyHomeTabSetEnabled = setEnabled;
        window.__seyHomeTabSetTab = setTab;
        window.__seyHomeTabState = function () {
            var info = readBridge();
            return { enabled: info.enabled, tab: info.tab, path: currentPath() };
        };

        var boot = readBridge();
        notify('Default home tab installed, enabled=' + boot.enabled + ' tab=' + boot.tab);

        if (boot.enabled) {
            applyOnce(boot.tab);
        }
    }
})();
