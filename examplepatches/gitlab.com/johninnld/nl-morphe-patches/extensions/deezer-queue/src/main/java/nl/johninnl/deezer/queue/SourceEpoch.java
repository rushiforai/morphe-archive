package nl.johninnl.deezer.queue;

public interface SourceEpoch {
    long queueSourceVersion();
    Object queueSourceList();
    long queueSourceStamp();
}
