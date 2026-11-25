package nl.dpgmedia.mcdpg.amalia.car.data.model;

import java.util.List;

/** Test double of the queue model used by the delivery-size workaround. */
public final class CarAudioQueue {
    private final List<Item> items;

    public CarAudioQueue(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public static final class Item {
        public enum Type { Article, Podcast, Radio }

        private final Type type;
        private final String queueUid;

        public Item(Type type, String queueUid) {
            this.type = type;
            this.queueUid = queueUid;
        }

        public Type getType() {
            return type;
        }

        public String m6831getQueueUidEU6Fzmo() {
            return queueUid;
        }
    }
}
