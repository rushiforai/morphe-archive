package com.thetransitapp.droid.shared.model.cpp;

public final class ImageViewModel {
    public ImageType getType() {
        throw new UnsupportedOperationException("Stub");
    }

    public String getName() {
        throw new UnsupportedOperationException("Stub");
    }

    public enum ImageType {
        SYMBOL,
        LOCAL,
        ROUTE
    }
}
