package app.johninnl.modelhost.api;

/** Receives streaming envelopes and exactly one terminal envelope on the configured callback executor. */
public interface ResultListener { void onResult(String resultJson); }
