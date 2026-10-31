package io.branch.requery.android.database.sqlite;

import java.io.Closeable;

/* loaded from: classes4.dex */
public abstract class b implements Closeable {
    private int mReferenceCount = 1;

    public void acquireReference() {
        synchronized (this) {
            try {
                int i5 = this.mReferenceCount;
                if (i5 <= 0) {
                    throw new IllegalStateException("attempt to re-open an already-closed object: " + this);
                }
                this.mReferenceCount = i5 + 1;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        releaseReference();
    }

    public abstract void onAllReferencesReleased();

    public void releaseReference() {
        boolean z11;
        synchronized (this) {
            z11 = true;
            int i5 = this.mReferenceCount - 1;
            this.mReferenceCount = i5;
            if (i5 != 0) {
                z11 = false;
            }
        }
        if (z11) {
            onAllReferencesReleased();
        }
    }
}
