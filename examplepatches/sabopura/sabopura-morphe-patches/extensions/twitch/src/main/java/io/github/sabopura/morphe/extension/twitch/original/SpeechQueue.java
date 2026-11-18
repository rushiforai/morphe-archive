package io.github.sabopura.morphe.extension.twitch.original;

import java.util.ArrayDeque;

/** The messages waiting to be read; when it is full the oldest gives way so the voice stays near live. */
final class SpeechQueue<T> {
    private final int capacity;
    private final ArrayDeque<T> waiting = new ArrayDeque<>();

    SpeechQueue(int capacity) {
        this.capacity = capacity;
    }

    synchronized void add(T line) {
        if (waiting.size() >= capacity) waiting.removeFirst();
        waiting.addLast(line);
    }

    synchronized T next() {
        return waiting.pollFirst();
    }

    synchronized void clear() {
        waiting.clear();
    }
}
