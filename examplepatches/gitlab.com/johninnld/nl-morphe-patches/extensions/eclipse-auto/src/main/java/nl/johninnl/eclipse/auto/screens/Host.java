package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.Screen;
import nl.johninnl.eclipse.auto.data.AppPort;
import nl.johninnl.eclipse.auto.data.Catalog;
import nl.johninnl.eclipse.auto.data.HomeBuilder;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.RadioStore;
import nl.johninnl.eclipse.auto.ui.Env;

/** What a screen needs from the car session: data, navigation and the playback link's state. */
public interface Host {
    Env env();

    AppPort app();

    LibraryStore library();

    RadioStore radio();

    /** The server-fed content: Home, Discover, live stations and the radio catalogue. */
    Catalog catalog();

    /** Turns the catalogue's feeds into what Home and Discover draw. */
    HomeBuilder homeBuilder();

    /** True when anything is queued after the current song. */
    boolean hasUpcoming();

    /** True once the host has the playback session token. */
    boolean playerReady();

    /** Why the playback link is down, or null while it is connecting or ready. */
    String playerError();

    void reconnect();

    void showPlayer();

    void showQueue();

    /** Push the search screen, popping to the root first when the stack is full. */
    void showSearch(Screen from);

    /** Push the collection screen for {@code collection}, popping to the root first when the stack is full. */
    void open(Screen from, Model.Collection collection);

    /** Push a plain message screen for something that does not exist yet. */
    void showMessage(Screen from, String title, String message);

    /** Show a short toast in the car. */
    void toast(String text);
}
