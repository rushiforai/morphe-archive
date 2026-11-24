"""Quora's part of check_app.py: its sign-in page is a web page in any language, and a failed check
also prints the WebView version, which Quora's pages depend on."""
import re
import time


def screen_shown(check, timeout=60):
    """Whether Quora's sign-in page is on screen. The cookie dialog in the EU covers it at first.

    Quora picks the page's language from the IP address, so a runner can get it in French or
    another language. The page's top image (logged_out_home_mobile_top.png) is the same in
    every language, so it counts as well as the English buttons; it isn't always in the dump,
    so the Google and Facebook buttons count in any language too.
    """
    end = time.time() + timeout
    while time.time() < end:
        screen = check.screen()
        # The sign-in buttons name Google and Facebook in every language ("Continuer avec
        # Google"), so both brand names on buttons count too.
        brands = (re.search(r'text="[^"]*\bGoogle\b[^"]*"', screen)
                  and re.search(r'text="[^"]*\bFacebook\b[^"]*"', screen))
        if (re.search(r'text="(Continue with Google|Sign up with email|Login|Reject All|I Accept)"', screen)
                or "logged_out_home" in screen or brands):
            return True
        time.sleep(5)
    return False


def describe_screen(check):
    webview = check.shell("shell", "dumpsys", "webviewupdate").stdout
    current = re.search(r"Current WebView package \(name, version\): \(([^)]*)\)", webview)
    print("  WebView: " + (current.group(1) if current else "unknown"))
