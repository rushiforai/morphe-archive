package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.Screen;
import androidx.car.app.model.Action;
import androidx.car.app.model.MessageTemplate;
import androidx.car.app.model.Template;

/** A pushed screen for destinations that exist only as an entry point so far. */
public final class PlaceholderScreen extends Screen {
    private final String title;
    private final String message;

    public PlaceholderScreen(CarContext context, String title, String message) {
        super(context);
        this.title = title;
        this.message = message;
    }

    @Override public Template onGetTemplate() {
        return new MessageTemplate.Builder(message).setTitle(title).setHeaderAction(Action.BACK).build();
    }
}
