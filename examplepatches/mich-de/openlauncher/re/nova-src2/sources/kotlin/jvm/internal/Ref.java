package kotlin.jvm.internal;

import java.io.Serializable;

/* loaded from: classes4.dex */
public class Ref {

    /* loaded from: classes.dex */
    public static final class BooleanRef implements Serializable {

        /* renamed from: a, reason: collision with root package name */
        public boolean f71859a;

        public final String toString() {
            return String.valueOf(this.f71859a);
        }
    }

    public static final class ByteRef implements Serializable {
        public final String toString() {
            return String.valueOf(0);
        }
    }

    public static final class CharRef implements Serializable {
        public final String toString() {
            return String.valueOf((char) 0);
        }
    }

    public static final class DoubleRef implements Serializable {
        public final String toString() {
            return String.valueOf(0.0d);
        }
    }

    public static final class FloatRef implements Serializable {

        /* renamed from: a, reason: collision with root package name */
        public float f71860a;

        public final String toString() {
            return String.valueOf(this.f71860a);
        }
    }

    /* loaded from: classes.dex */
    public static final class IntRef implements Serializable {

        /* renamed from: a, reason: collision with root package name */
        public int f71861a;

        public final String toString() {
            return String.valueOf(this.f71861a);
        }
    }

    /* loaded from: classes.dex */
    public static final class LongRef implements Serializable {

        /* renamed from: a, reason: collision with root package name */
        public long f71862a;

        public final String toString() {
            return String.valueOf(this.f71862a);
        }
    }

    /* loaded from: classes.dex */
    public static final class ObjectRef<T> implements Serializable {

        /* renamed from: a, reason: collision with root package name */
        public Object f71863a;

        public final String toString() {
            return String.valueOf(this.f71863a);
        }
    }

    public static final class ShortRef implements Serializable {
        public final String toString() {
            return String.valueOf(0);
        }
    }

    private Ref() {
    }
}
