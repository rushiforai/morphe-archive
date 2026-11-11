// The e2e recordings' player, for any page that embeds it (e2e-player.html, the guide index.html; tools/guide/build.js
// inlines this file into each, so a page never meets a cached copy of another deploy):
//   E2EPlayer.mount(element, { src, steps, lazy })
// puts the video of `src` in `element`, with the browser's own controls; with `steps`, { lines, marks } (the scenario's
// Gherkin, a line each, and [{ line, seconds, failed }], in the order they played), the Gherkin beside it: the line the
// video is at highlighted, one at a time, each line's time a button that plays the video from there, a failed line in
// red and the lines never reached dimmed, and a bar under the video marking each line's time (red where it failed), a
// click on it seeking there. With `lazy`, the video loads nothing until it comes near the screen. Returns the video.
//   E2EPlayer.readSteps(data)
// the steps of a player link's fragment data (#s=<data>: the e2e tool's PlayerLinking, deflated JSON in base64url), as
// a promise; it fails for data that isn't such.
(function () {
    "use strict";

    function readSteps(data) {
        if (!/^[A-Za-z0-9_-]+$/.test(data || "") || typeof DecompressionStream === "undefined") {
            return Promise.reject(new Error("no steps"));
        }

        var base64 = data.replace(/-/g, "+").replace(/_/g, "/");
        var bytes = Uint8Array.from(atob(base64 + "===".slice((base64.length + 3) % 4)), function (c) { return c.charCodeAt(0); });
        var inflated = new Blob([bytes]).stream().pipeThrough(new DecompressionStream("deflate-raw"));
        return new Response(inflated).text().then(function (text) {
            return toSteps(JSON.parse(text));
        });
    }

    // {"g": Gherkin, "m": [[line, seconds, failed], …]} → { lines, marks }, the marks in the order they played.
    function toSteps(data) {
        if (typeof data.g !== "string" || !Array.isArray(data.m)) {
            throw new Error("not a scenario's steps");
        }

        return {
            lines: data.g.split("\n"),
            marks: data.m
                .filter(function (m) { return Array.isArray(m) && isFinite(m[0]) && isFinite(m[1]); })
                .map(function (m) { return { line: m[0], seconds: m[1], failed: m[2] === 1 }; })
                .sort(function (a, b) { return a.seconds - b.seconds; })
        };
    }

    function make(tag, className, text) {
        var element = document.createElement(tag);
        if (className) {
            element.className = className;
        }

        if (text !== undefined) {
            element.textContent = text;
        }

        return element;
    }

    function mount(root, options) {
        root.classList.add("e2e-player");
        var list = make("ol", "gherkin");
        list.setAttribute("aria-label", "Gherkin");
        list.hidden = true;
        var player = make("div", "player");
        var video = make("video");
        video.controls = true;
        video.playsInline = true;
        video.preload = options.lazy ? "none" : "metadata";
        var bar = make("div", "bar");
        bar.setAttribute("role", "slider");
        bar.setAttribute("aria-label", "Seek");
        bar.tabIndex = -1;
        bar.hidden = true;
        var fill = make("div", "fill");
        bar.append(fill);
        player.append(video, bar);
        root.append(list, player);

        if (options.lazy && "IntersectionObserver" in window) {
            var watching = new IntersectionObserver(function (entries) {
                if (entries.some(function (entry) { return entry.isIntersecting; })) {
                    watching.disconnect();
                    video.preload = "metadata";
                    video.load();
                }
            }, { rootMargin: "400px" });
            watching.observe(root);
        }

        if (options.src) {
            video.src = options.src;
        }

        if (options.steps) {
            showSteps(root, list, video, bar, fill, options.steps);
        }

        return video;
    }

    function showSteps(root, list, video, bar, fill, steps) {
        var items = steps.lines.map(function (text, index) {
            var item = make("li");
            var mark = steps.marks.filter(function (m) { return m.line === index; })[0];
            if (mark) {
                var time = make("button", "time", clock(mark.seconds));
                time.type = "button";
                time.title = "Play from " + clock(mark.seconds);
                time.addEventListener("click", function () { playFrom(video, mark.seconds); });
                item.append(time);
            } else {
                item.append(make("span", "spacer"));
            }

            item.append(describe(text));
            if (steps.marks.length > 0 && !mark && /^\s*(Given|When|Then|And|But) /.test(text)) {
                item.classList.add("unreached");
            }

            if (steps.marks.some(function (m) { return m.line === index && m.failed; })) {
                item.classList.add("failed");
            }

            list.append(item);
            return item;
        });
        list.hidden = false;
        root.classList.add("with-gherkin");
        if (steps.marks.length === 0) {
            return;
        }

        var shown = -1;
        function follow() {
            var at = video.currentTime;
            fill.style.width = (video.duration ? Math.min(100, at / video.duration * 100) : 0) + "%";
            var now = -1;
            steps.marks.forEach(function (m) {
                if (m.seconds <= at + 0.05) {
                    now = m.line;
                }
            });
            if (now === shown) {
                return;
            }

            if (shown >= 0) {
                items[shown].classList.remove("now");
            }

            shown = now;
            if (now >= 0) {
                items[now].classList.add("now");
                keepInView(list, items[now]);
            }
        }

        function ticks() {
            if (!video.duration) {
                return;
            }

            bar.querySelectorAll(".tick").forEach(function (tick) { tick.remove(); });
            steps.marks.forEach(function (m) {
                var tick = make("span", "tick" + (m.failed ? " failed" : ""));
                tick.style.left = Math.min(100, m.seconds / video.duration * 100) + "%";
                bar.append(tick);
            });
            bar.setAttribute("aria-valuemin", "0");
            bar.setAttribute("aria-valuemax", String(Math.round(video.duration)));
            bar.hidden = false;
        }

        function seek(event) {
            var box = bar.getBoundingClientRect();
            if (video.duration && box.width > 0) {
                video.currentTime = Math.max(0, Math.min(1, (event.clientX - box.left) / box.width)) * video.duration;
            }
        }

        bar.addEventListener("pointerdown", function (event) {
            bar.setPointerCapture(event.pointerId);
            seek(event);
        });
        bar.addEventListener("pointermove", function (event) {
            if (bar.hasPointerCapture(event.pointerId)) {
                seek(event);
            }
        });
        video.addEventListener("loadedmetadata", ticks);
        video.addEventListener("durationchange", ticks);
        ["timeupdate", "seeked", "seeking", "play"].forEach(function (name) { video.addEventListener(name, follow); });
        if ("requestVideoFrameCallback" in video) {
            var onFrame = function () {
                follow();
                video.requestVideoFrameCallback(onFrame);
            };
            video.requestVideoFrameCallback(onFrame);
        }

        ticks();
        follow();
    }

    function playFrom(video, seconds) {
        if (video.preload === "none") {
            video.preload = "metadata";
        }

        video.currentTime = seconds;
        var playing = video.play();
        if (playing && playing.catch) {
            playing.catch(function () { });
        }
    }

    // A Gherkin line, its keyword, tags, comment or title set apart.
    function describe(text) {
        var line = make("span", "text");
        var step = /^(\s*)(Given|When|Then|And|But)( .*)$/.exec(text);
        var title = /^(\s*)(Scenario:)(.*)$/.exec(text);
        if (step || title) {
            var parts = step || title;
            line.append(parts[1], make("span", "keyword", parts[2]));
            line.append(title ? make("span", "title", parts[3]) : parts[3]);
        } else {
            line.textContent = text;
            if (/^\s*#/.test(text)) {
                line.classList.add("comment");
            } else if (/^\s*@/.test(text)) {
                line.classList.add("tag");
            }
        }

        return line;
    }

    // Scrolls the list, not the page, so the line shows.
    function keepInView(list, item) {
        if (list.scrollHeight <= list.clientHeight) {
            return;
        }

        var top = item.offsetTop - list.offsetTop;
        if (top < list.scrollTop + 24 || top + item.offsetHeight > list.scrollTop + list.clientHeight - 24) {
            list.scrollTop = top - list.clientHeight / 3;
        }
    }

    function clock(seconds) {
        var whole = Math.floor(seconds);
        return Math.floor(whole / 60) + ":" + String(whole % 60).padStart(2, "0");
    }

    window.E2EPlayer = { mount: mount, readSteps: readSteps, toSteps: toSteps };
})();
