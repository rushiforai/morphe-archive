package com.bumptech.glide;

public final class n extends to.a {
    public n W(Object model) {
        this.model = model;
        return this;
    }

    public to.c X(int width, int height) {
        testenv.FakeLineEnv.recordGlideRequest(
                model, strategy, onlyCache, overrideWidth, overrideHeight, circleCrop, width, height);
        return new to.c();
    }
}
