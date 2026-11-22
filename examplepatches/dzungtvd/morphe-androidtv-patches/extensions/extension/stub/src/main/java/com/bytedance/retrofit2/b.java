package com.bytedance.retrofit2;

/**
 * Compile-only mirror of the app's Retrofit {@code Call<T>} interface. The extension never calls
 * this type directly: the concrete call is executed reflectively, exactly as {@code Subtitles}
 * does for its signed GETs. Only the erased descriptor matters to Retrofit.
 */
public interface b<T> {
}
