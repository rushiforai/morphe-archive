"""The Crypto App's part of check_app.py: the patched app must also open the Crypto Alerts screen
that the Custom price alerts patch adds."""
import time


def after_screen(check, timeout=30):
    """Opens the "Crypto Alerts" screen the Custom price alerts patch adds (its own launcher entry)
    and waits for its header and Add rule button."""
    check.shell("shell", "am", "start", "-n", f"{check.target}/app.jofslash.extension.thecryptoapp.AlertsActivity")
    end = time.time() + timeout
    while time.time() < end:
        screen = check.screen()
        if 'text="Crypto Alerts"' in screen and 'text="Add rule"' in screen:
            print("The patches' Crypto Alerts screen opens.")
            return True
        check.dismiss_not_responding(screen)
        time.sleep(3)
    print("The patches' Crypto Alerts screen didn't open.")
    return False
