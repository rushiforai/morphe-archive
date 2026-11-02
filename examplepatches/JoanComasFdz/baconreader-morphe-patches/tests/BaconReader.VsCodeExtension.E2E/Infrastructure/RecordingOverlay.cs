// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.VsCodeExtension.E2E.Infrastructure;

/// <summary>
/// What a recorded run draws over the page so its video shows each action: a big mouse pointer (headless Chromium draws
/// none) and a ring where the pointer goes down. Each project's BaseE2E adds them to a recorded context
/// (<c>AddInitScriptAsync</c>). They draw in the top page only: an iframe (a VS Code webview) gets neither. The page gets
/// <c>window.__e2eMovePointer(x, y)</c> and <c>window.__e2eRing(x, y)</c> too, for the actions the top page can't see:
/// one inside an iframe sends its mouse events to the iframe, not to the page.
/// </summary>
public static class RecordingOverlay
{
    /// <summary>
    /// A big arrow (twice the usual size, white with a dark outline) that follows the mouse, gliding to where it moves
    /// (a page object moves it to an action's target before the action, and waits for the glide).
    /// </summary>
    public const string PointerScript = """
        (() => {
          if (window.top !== window) return;
          const glide = 600;
          let pointer;
          const place = (x, y) => { if (pointer) pointer.style.transform = `translate(${x}px, ${y}px)`; };
          const create = () => {
            pointer = document.createElement('div');
            pointer.style.cssText = 'position:fixed;left:0;top:0;z-index:2147483647;pointer-events:none;width:30px;height:44px;'
              + `transition:transform ${glide}ms ease-in-out;filter:drop-shadow(0 2px 3px rgba(0,0,0,.6))`;
            pointer.innerHTML = '<svg width="30" height="44" viewBox="0 0 15 22" xmlns="http://www.w3.org/2000/svg">'
              + '<path d="M1 1 L1 17 L5 13.5 L8 20.5 L10.6 19.4 L7.7 12.6 L13 12.6 Z" fill="#fff" stroke="#111" stroke-width="1.2" stroke-linejoin="round"/></svg>';
            document.documentElement.appendChild(pointer);
            place(window.innerWidth / 2, window.innerHeight / 2);
          };
          if (document.documentElement) create(); else document.addEventListener('DOMContentLoaded', create);
          window.addEventListener('mousemove', (event) => place(event.clientX, event.clientY), true);
          window.__e2eMovePointer = place;
        })();
        """;

    /// <summary>A ring where the pointer goes down (a click, or a tap on the phone, which draws no pointer).</summary>
    public const string TapRingScript = """
        (() => {
          if (window.top !== window) return;
          const ring = (x, y) => {
            const drawn = document.createElement('div');
            drawn.style.cssText = 'position:fixed;z-index:2147483646;pointer-events:none;width:36px;height:36px;margin:-18px 0 0 -18px;'
              + 'border:4px solid #ff3d7f;border-radius:50%;box-shadow:0 0 0 4px rgba(255,61,127,.35);transition:transform .6s,opacity .6s;'
              + `left:${x}px;top:${y}px`;
            document.documentElement.appendChild(drawn);
            requestAnimationFrame(() => { drawn.style.transform = 'scale(1.8)'; drawn.style.opacity = '0'; });
            setTimeout(() => drawn.remove(), 1200);
          };
          window.addEventListener('pointerdown', (event) => ring(event.clientX, event.clientY), true);
          window.__e2eRing = ring;
        })();
        """;
}
