package app.voidhack.extension.applemusic.library;

import java.io.IOException;

final class LibraryFailure extends IOException {
    final String resource;
    final Object[] arguments;

    LibraryFailure(String resource, Object... arguments) {
        super(resource);
        this.resource = resource;
        this.arguments = arguments.clone();
    }
}
