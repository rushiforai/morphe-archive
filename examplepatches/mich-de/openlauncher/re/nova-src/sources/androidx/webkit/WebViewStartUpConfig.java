package androidx.webkit;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public final class WebViewStartUpConfig {

    /* renamed from: a, reason: collision with root package name */
    public final Executor f15312a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f15313b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f15314c;

    public static final class Builder {

        /* renamed from: a, reason: collision with root package name */
        public final Executor f15315a;

        /* renamed from: b, reason: collision with root package name */
        public boolean f15316b = true;

        /* renamed from: c, reason: collision with root package name */
        public HashSet f15317c = null;

        public Builder(Executor executor) {
            this.f15315a = executor;
        }

        public WebViewStartUpConfig build() {
            return new WebViewStartUpConfig(this.f15315a, this.f15316b, this.f15317c);
        }

        public Builder setProfilesToLoadDuringStartup(Set<String> set) {
            if (!this.f15316b) {
                throw new IllegalArgumentException("Can't specify profiles to load without running UI thread startup tasks");
            }
            this.f15317c = new HashSet(set);
            return this;
        }

        public Builder setShouldRunUiThreadStartUpTasks(boolean z11) {
            if (this.f15317c != null && !z11) {
                throw new IllegalArgumentException("Can't specify profiles to load without running UI thread startup tasks");
            }
            this.f15316b = z11;
            return this;
        }
    }

    public WebViewStartUpConfig(Executor executor, boolean z11, HashSet hashSet) {
        this.f15312a = executor;
        this.f15313b = z11;
        this.f15314c = hashSet;
    }

    public Executor getBackgroundExecutor() {
        return this.f15312a;
    }

    public Set<String> getProfilesToLoadDuringStartup() {
        return this.f15314c;
    }

    public boolean shouldRunUiThreadStartUpTasks() {
        return this.f15313b;
    }
}
