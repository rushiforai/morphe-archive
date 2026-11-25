package nl.dpgmedia.mcdpg.amalia.car.ui.mediaitem;

import nl.dpgmedia.mcdpg.amalia.car.data.model.CarAudioQueue;

/** Test double with the production private constructor and queue/uid fields. */
public final class CarLaneItemQueue {
    private final CarAudioQueue queue;
    private final String queueUid;

    private CarLaneItemQueue(CarAudioQueue queue, String queueUid) {
        this.queue = queue;
        this.queueUid = queueUid;
    }

    public static CarLaneItemQueue of(CarAudioQueue queue, String queueUid) {
        return new CarLaneItemQueue(queue, queueUid);
    }

    public CarAudioQueue getQueue() {
        return queue;
    }

    public String m6831getQueueUidEU6Fzmo() {
        return queueUid;
    }
}
