package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.model.Template;
import java.util.function.Consumer;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.ui.Pages;

/** The providers search can use (the phone's installed addons that can search); a tap picks one and goes back. */
final class ProviderScreen extends BaseScreen {
    private final ProviderSearch search;

    ProviderScreen(CarContext context, Host host, ProviderSearch search) {
        super(context, host);
        this.search = search;
    }

    @Override public Template onGetTemplate() {
        Model.SearchProvider active = search.active();
        return Pages.providers(host.env(), search.providers(), active == null ? null : active.id, new Consumer<Model.SearchProvider>() {
            @Override public void accept(Model.SearchProvider provider) {
                if (!onTop()) return;
                search.select(provider.id);
                getScreenManager().pop();
            }
        });
    }
}
