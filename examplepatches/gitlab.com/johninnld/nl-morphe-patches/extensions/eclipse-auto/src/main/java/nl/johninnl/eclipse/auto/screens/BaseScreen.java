package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.Screen;

/** Shared screen plumbing: a screen reacts to a tap only while it is still the top of the stack. */
abstract class BaseScreen extends Screen {
    final Host host;

    BaseScreen(CarContext context, Host host) {
        super(context);
        this.host = host;
    }

    /** True while this screen is the one the driver sees; a late tap on a covered screen is ignored. */
    final boolean onTop() { return getScreenManager().getTop() == this; }
}
