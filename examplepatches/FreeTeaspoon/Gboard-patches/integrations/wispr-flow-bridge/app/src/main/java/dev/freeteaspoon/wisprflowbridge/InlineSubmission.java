package dev.freeteaspoon.wisprflowbridge;

final class InlineSubmission {
    private String transcript;
    private boolean discarded;

    synchronized void capture(String text) {
        if (!discarded && transcript == null) transcript = text;
    }

    synchronized String transcript() {
        return transcript;
    }

    synchronized boolean isDiscarded() {
        return discarded;
    }

    synchronized void discard() {
        discarded = true;
        transcript = null;
    }
}
