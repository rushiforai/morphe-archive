package com.amplitude.core.diagnostics;

import ab.e0;
import b70.h;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.amplitude.core.diagnostics.HistogramSnapshot;
import com.amplitude.core.utilities.Hash;
import com.amplitude.core.utilities.HashKt;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import h6.c1;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.builders.MapBuilder;
import kotlin.collections.c;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.io.CloseableKt;
import kotlin.io.FilesKt;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
import r70.j;
import t70.c0;
import t70.j0;
import t70.m0;
import t70.r1;
import v70.m;
import v70.o;

@Metadata(d1 = {"\u0000x\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\b\b\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000 U2\u00020\u0001:\u0002UVB7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u0015\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0012\u0010\u0013J\r\u0010\u0014\u001a\u00020\u0011¢\u0006\u0004\b\u0014\u0010\u0015J\r\u0010\u0016\u001a\u00020\u0011¢\u0006\u0004\b\u0016\u0010\u0015J\u0010\u0010\u0017\u001a\u00020\u0011H\u0086@¢\u0006\u0004\b\u0017\u0010\u0018J\u0013\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0019¢\u0006\u0004\b\u001a\u0010\u001bJ\u001f\u0010\u001d\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b\u001d\u0010\u001eJ\u0019\u0010\u001f\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b\u001f\u0010 J#\u0010#\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\"2\u0006\u0010!\u001a\u00020\u0002H\u0002¢\u0006\u0004\b#\u0010$J#\u0010&\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020%0\"2\u0006\u0010!\u001a\u00020\u0002H\u0002¢\u0006\u0004\b&\u0010$J#\u0010(\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020'0\"2\u0006\u0010!\u001a\u00020\u0002H\u0002¢\u0006\u0004\b(\u0010$J\u001d\u0010*\u001a\b\u0012\u0004\u0012\u00020)0\u00192\u0006\u0010!\u001a\u00020\u0002H\u0002¢\u0006\u0004\b*\u0010+J\u001d\u0010,\u001a\b\u0012\u0004\u0012\u00020)0\u00192\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b,\u0010+J+\u0010.\u001a\u00020\u00112\u0012\u0010-\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\"2\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b.\u0010/J+\u00101\u001a\u00020\u00112\u0012\u00100\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020%0\"2\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b1\u0010/J+\u00103\u001a\u00020\u00112\u0012\u00102\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020'0\"2\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b3\u0010/J%\u00105\u001a\u00020\u00112\f\u00104\u001a\b\u0012\u0004\u0012\u00020)0\u00192\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b5\u00106J\u001f\u00108\u001a\u00020\u00112\u0006\u00107\u001a\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\b8\u00109J%\u0010:\u001a\u00020\u00112\f\u00104\u001a\b\u0012\u0004\u0012\u00020)0\u00192\u0006\u0010!\u001a\u00020\u0002H\u0002¢\u0006\u0004\b:\u00106J\u001f\u0010=\u001a\u00020\u00112\u0006\u0010!\u001a\u00020\u00022\u0006\u0010<\u001a\u00020;H\u0002¢\u0006\u0004\b=\u0010>J\u0017\u0010?\u001a\u00020;2\u0006\u0010!\u001a\u00020\u0002H\u0002¢\u0006\u0004\b?\u0010@J\u000f\u0010A\u001a\u00020\u0011H\u0002¢\u0006\u0004\bA\u0010\u0015J\u000f\u0010B\u001a\u00020\u0002H\u0002¢\u0006\u0004\bB\u0010CJ\u000f\u0010D\u001a\u00020\u0002H\u0002¢\u0006\u0004\bD\u0010CJ\u0017\u0010E\u001a\u00020\u00112\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\bE\u0010FJ\u0017\u0010G\u001a\u00020\u00112\u0006\u0010\u001c\u001a\u00020\u0002H\u0002¢\u0006\u0004\bG\u0010FR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010HR\u0014\u0010\u0006\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010IR\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010JR\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010KR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010LR\u0014\u0010M\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bM\u0010IR\u001a\u0010P\u001a\b\u0012\u0004\u0012\u00020O0N8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bP\u0010QR\u0014\u0010S\u001a\u00020R8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bS\u0010T¨\u0006W"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsStorage;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/io/File;", "storageDirectory", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instanceName", "sessionStartAt", "Lcom/amplitude/common/Logger;", "logger", "Lt70/j0;", "coroutineScope", "Lt70/c0;", "storageIODispatcher", "<init>", "(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/amplitude/common/Logger;Lt70/j0;Lt70/c0;)V", "Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "snapshot", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "saveSnapshot", "(Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;)V", "deleteActiveFiles", "()V", n.f39150d, "closeAndJoin", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "loadAndClearPreviousSessions", "()Ljava/util/List;", "directory", "persistSnapshot", "(Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;Ljava/io/File;)V", "loadSnapshot", "(Ljava/io/File;)Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "file", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "loadTags", "(Ljava/io/File;)Ljava/util/Map;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "loadCounters", "Lcom/amplitude/core/diagnostics/HistogramSnapshot;", "loadHistograms", "Lcom/amplitude/core/diagnostics/DiagnosticsEvent;", "loadEvents", "(Ljava/io/File;)Ljava/util/List;", "loadEventsFromDirectory", "tags", "persistTags", "(Ljava/util/Map;Ljava/io/File;)V", "counters", "persistCounters", "histograms", "persistHistograms", DatabaseConstants.EVENT_TABLE_NAME, "persistEvents", "(Ljava/util/List;Ljava/io/File;)V", "eventsFile", "prepareEventsLog", "(Ljava/io/File;Ljava/io/File;)V", "appendEvents", "Lorg/json/JSONObject;", "json", "writeJsonToFile", "(Ljava/io/File;Lorg/json/JSONObject;)V", "readJsonFromFile", "(Ljava/io/File;)Lorg/json/JSONObject;", "removeActiveFiles", "activeStorageDirectory", "()Ljava/io/File;", "instanceDirectory", "ensureDirectoryExists", "(Ljava/io/File;)V", "deleteDirectory", "Ljava/io/File;", "Ljava/lang/String;", "Lcom/amplitude/common/Logger;", "Lt70/j0;", "Lt70/c0;", "sanitizedInstance", "Lv70/m;", "Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation;", "channel", "Lv70/m;", "Lt70/r1;", "actorJob", "Lt70/r1;", k.O, "Operation", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class DiagnosticsStorage {

    @NotNull
    private static final String COUNTERS_FILE = "counters.json";

    @NotNull
    private static final String EVENTS_FILE = "events.log";

    @NotNull
    private static final String HISTOGRAMS_FILE = "histograms.json";
    private static final int MAX_EVENTS_LOG_BYTES = 262144;

    @NotNull
    private static final String STORAGE_PREFIX = "com.amplitude.diagnostics";

    @NotNull
    private static final String TAGS_FILE = "tags.json";

    @NotNull
    private final r1 actorJob;

    @NotNull
    private final m channel;

    @NotNull
    private final j0 coroutineScope;

    @NotNull
    private final Logger logger;

    @NotNull
    private final String sanitizedInstance;

    @NotNull
    private final String sessionStartAt;

    @NotNull
    private final File storageDirectory;

    @NotNull
    private final c0 storageIODispatcher;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b2\u0018\u00002\u00020\u0001:\u0002\u0003\u0004B\u0007\b\u0004¢\u0006\u0002\u0010\u0002\u0082\u0001\u0002\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "DeleteActiveFiles", "SaveSnapshot", "Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation$DeleteActiveFiles;", "Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation$SaveSnapshot;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static abstract class Operation {

        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÖ\u0003J\t\u0010\u0007\u001a\u00020\bHÖ\u0001J\t\u0010\t\u001a\u00020\nHÖ\u0001¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation$DeleteActiveFiles;", "Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation;", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class DeleteActiveFiles extends Operation {

            @NotNull
            public static final DeleteActiveFiles INSTANCE = new DeleteActiveFiles();

            private DeleteActiveFiles() {
                super(null);
            }

            public boolean equals(@Nullable Object other) {
                return this == other || (other instanceof DeleteActiveFiles);
            }

            public int hashCode() {
                return 339312601;
            }

            @NotNull
            public String toString() {
                return "DeleteActiveFiles";
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation$SaveSnapshot;", "Lcom/amplitude/core/diagnostics/DiagnosticsStorage$Operation;", "snapshot", "Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "(Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;)V", "getSnapshot", "()Lcom/amplitude/core/diagnostics/DiagnosticsSnapshot;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class SaveSnapshot extends Operation {

            @NotNull
            private final DiagnosticsSnapshot snapshot;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public SaveSnapshot(@NotNull DiagnosticsSnapshot snapshot) {
                super(null);
                Intrinsics.g(snapshot, "snapshot");
                this.snapshot = snapshot;
            }

            public static /* synthetic */ SaveSnapshot copy$default(SaveSnapshot saveSnapshot, DiagnosticsSnapshot diagnosticsSnapshot, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    diagnosticsSnapshot = saveSnapshot.snapshot;
                }
                return saveSnapshot.copy(diagnosticsSnapshot);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final DiagnosticsSnapshot getSnapshot() {
                return this.snapshot;
            }

            @NotNull
            public final SaveSnapshot copy(@NotNull DiagnosticsSnapshot snapshot) {
                Intrinsics.g(snapshot, "snapshot");
                return new SaveSnapshot(snapshot);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof SaveSnapshot) && Intrinsics.b(this.snapshot, ((SaveSnapshot) other).snapshot);
            }

            @NotNull
            public final DiagnosticsSnapshot getSnapshot() {
                return this.snapshot;
            }

            public int hashCode() {
                return this.snapshot.hashCode();
            }

            @NotNull
            public String toString() {
                return "SaveSnapshot(snapshot=" + this.snapshot + ')';
            }
        }

        public /* synthetic */ Operation(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Operation() {
        }
    }

    public DiagnosticsStorage(@NotNull File storageDirectory, @NotNull String instanceName, @NotNull String sessionStartAt, @NotNull Logger logger, @NotNull j0 coroutineScope, @NotNull c0 storageIODispatcher) {
        Intrinsics.g(storageDirectory, "storageDirectory");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(sessionStartAt, "sessionStartAt");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(storageIODispatcher, "storageIODispatcher");
        this.storageDirectory = storageDirectory;
        this.sessionStartAt = sessionStartAt;
        this.logger = logger;
        this.coroutineScope = coroutineScope;
        this.storageIODispatcher = storageIODispatcher;
        this.sanitizedInstance = HashKt.m131toHexStringVKZWuLQ(Hash.INSTANCE.m129fnv1a64I7RO_PI(instanceName));
        this.channel = o.b(UserMetadata.MAX_INTERNAL_KEY_SIZE, 6, null);
        this.actorJob = m0.t(coroutineScope, storageIODispatcher, null, new DiagnosticsStorage$actorJob$1(this, null), 2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final File activeStorageDirectory() {
        return new File(instanceDirectory(), this.sessionStartAt);
    }

    private final void appendEvents(List<DiagnosticsEvent> events, File file) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file, true);
        try {
            BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(fileOutputStream, Charsets.f72000b));
            try {
                Iterator<DiagnosticsEvent> it = events.iterator();
                while (it.hasNext()) {
                    bufferedWriter.write(it.next().toJsonString());
                    bufferedWriter.newLine();
                }
                Unit unit = Unit.f71706a;
                bufferedWriter.close();
                fileOutputStream.close();
            } finally {
            }
        } finally {
        }
    }

    private final void deleteDirectory(File directory) {
        File[] fileArrListFiles;
        if (directory.isDirectory() && (fileArrListFiles = directory.listFiles()) != null) {
            for (File file : fileArrListFiles) {
                if (file.isDirectory()) {
                    deleteDirectory(file);
                } else {
                    file.delete();
                }
            }
        }
        directory.delete();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void ensureDirectoryExists(File directory) throws IOException {
        if (directory.exists() || directory.mkdirs() || directory.exists()) {
            return;
        }
        throw new IOException("Failed to create directory: " + directory.getAbsolutePath());
    }

    private final File instanceDirectory() {
        return new File(new File(this.storageDirectory, STORAGE_PREFIX), this.sanitizedInstance);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean loadAndClearPreviousSessions$lambda$0(DiagnosticsStorage this$0, File file) {
        Intrinsics.g(this$0, "this$0");
        return file.isDirectory() && !Intrinsics.b(file.getName(), this$0.sessionStartAt);
    }

    private final Map<String, Long> loadCounters(File file) {
        boolean zExists = file.exists();
        h hVar = h.f17594a;
        if (!zExists) {
            return hVar;
        }
        try {
            JSONObject jsonFromFile = readJsonFromFile(file);
            MapBuilder mapBuilder = new MapBuilder();
            Iterator<String> itKeys = jsonFromFile.keys();
            Intrinsics.f(itKeys, "keys(...)");
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Intrinsics.d(next);
                mapBuilder.put(next, Long.valueOf(jsonFromFile.getLong(next)));
            }
            return mapBuilder.b();
        } catch (Exception e3) {
            this.logger.error("DiagnosticsStorage: Failed to load counters: " + e3.getMessage());
            return hVar;
        }
    }

    /* JADX WARN: Finally extract failed */
    private final List<DiagnosticsEvent> loadEvents(File file) throws IOException {
        if (!file.exists()) {
            return EmptyList.f71733a;
        }
        try {
            ArrayList arrayList = new ArrayList();
            FileInputStream fileInputStream = new FileInputStream(file);
            try {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream, Charsets.f72000b));
                while (true) {
                    try {
                        String line = bufferedReader.readLine();
                        if (line == null) {
                            Unit unit = Unit.f71706a;
                            bufferedReader.close();
                            fileInputStream.close();
                            return arrayList;
                        }
                        if (!r70.k.U0(line)) {
                            try {
                                DiagnosticsEvent diagnosticsEventFromJsonString = DiagnosticsEvent.INSTANCE.fromJsonString(line);
                                if (diagnosticsEventFromJsonString != null) {
                                    arrayList.add(diagnosticsEventFromJsonString);
                                } else {
                                    this.logger.error("DiagnosticsStorage: Skipping invalid event payload");
                                }
                            } catch (JSONException e3) {
                                this.logger.error("DiagnosticsStorage: Failed to parse event: " + e3.getMessage());
                            }
                        }
                    } catch (Throwable th2) {
                        try {
                            throw th2;
                        } catch (Throwable th3) {
                            CloseableKt.a(bufferedReader, th2);
                            throw th3;
                        }
                    }
                }
            } finally {
            }
        } catch (Exception e11) {
            this.logger.error("DiagnosticsStorage: Failed to load events: " + e11.getMessage());
            return EmptyList.f71733a;
        }
    }

    private final List<DiagnosticsEvent> loadEventsFromDirectory(File directory) {
        if (!directory.exists() || !directory.isDirectory()) {
            return EmptyList.f71733a;
        }
        File[] fileArrListFiles = directory.listFiles(new b(0));
        List<File> listW0 = fileArrListFiles != null ? c.W0(fileArrListFiles, new Comparator() { // from class: com.amplitude.core.diagnostics.DiagnosticsStorage$loadEventsFromDirectory$$inlined$sortedBy$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(((File) t6).getName(), ((File) t9).getName());
            }
        }) : EmptyList.f71733a;
        if (listW0.isEmpty()) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        for (File file : listW0) {
            Intrinsics.d(file);
            arrayList.addAll(loadEvents(file));
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean loadEventsFromDirectory$lambda$13(File file) {
        if (file.isFile()) {
            if (Intrinsics.b(file.getName(), EVENTS_FILE)) {
                return true;
            }
            String name = file.getName();
            Intrinsics.f(name, "getName(...)");
            if (j.I0(name, "events-", false)) {
                String name2 = file.getName();
                Intrinsics.f(name2, "getName(...)");
                if (j.A0(name2, ".log", false)) {
                    return true;
                }
            }
        }
        return false;
    }

    private final Map<String, HistogramSnapshot> loadHistograms(File file) throws JSONException {
        boolean zExists = file.exists();
        h hVar = h.f17594a;
        if (!zExists) {
            return hVar;
        }
        try {
            JSONObject jsonFromFile = readJsonFromFile(file);
            MapBuilder mapBuilder = new MapBuilder();
            Iterator<String> itKeys = jsonFromFile.keys();
            Intrinsics.f(itKeys, "keys(...)");
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Intrinsics.d(next);
                HistogramSnapshot.Companion companion = HistogramSnapshot.INSTANCE;
                JSONObject jSONObject = jsonFromFile.getJSONObject(next);
                Intrinsics.f(jSONObject, "getJSONObject(...)");
                mapBuilder.put(next, companion.fromJSONObject(jSONObject));
            }
            return mapBuilder.b();
        } catch (Exception e3) {
            this.logger.error("DiagnosticsStorage: Failed to load histograms: " + e3.getMessage());
            return hVar;
        }
    }

    private final DiagnosticsSnapshot loadSnapshot(File directory) throws JSONException {
        Map<String, String> mapLoadTags = loadTags(new File(directory, TAGS_FILE));
        Map<String, Long> mapLoadCounters = loadCounters(new File(directory, COUNTERS_FILE));
        Map<String, HistogramSnapshot> mapLoadHistograms = loadHistograms(new File(directory, HISTOGRAMS_FILE));
        List<DiagnosticsEvent> listLoadEventsFromDirectory = loadEventsFromDirectory(directory);
        if (mapLoadCounters.isEmpty() && mapLoadHistograms.isEmpty() && listLoadEventsFromDirectory.isEmpty()) {
            return null;
        }
        return new DiagnosticsSnapshot(mapLoadTags, mapLoadCounters, mapLoadHistograms, listLoadEventsFromDirectory);
    }

    private final Map<String, String> loadTags(File file) throws JSONException {
        boolean zExists = file.exists();
        h hVar = h.f17594a;
        if (!zExists) {
            return hVar;
        }
        try {
            JSONObject jsonFromFile = readJsonFromFile(file);
            MapBuilder mapBuilder = new MapBuilder();
            Iterator<String> itKeys = jsonFromFile.keys();
            Intrinsics.f(itKeys, "keys(...)");
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Intrinsics.d(next);
                String string = jsonFromFile.getString(next);
                Intrinsics.f(string, "getString(...)");
                mapBuilder.put(next, string);
            }
            return mapBuilder.b();
        } catch (Exception e3) {
            this.logger.error("DiagnosticsStorage: Failed to load tags: " + e3.getMessage());
            return hVar;
        }
    }

    private final void persistCounters(Map<String, Long> counters, File directory) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry<String, Long> entry : counters.entrySet()) {
            jSONObject.put(entry.getKey(), entry.getValue().longValue());
        }
        writeJsonToFile(new File(directory, COUNTERS_FILE), jSONObject);
    }

    private final void persistEvents(List<DiagnosticsEvent> events, File directory) throws IOException {
        File file = new File(directory, EVENTS_FILE);
        prepareEventsLog(file, directory);
        appendEvents(events, file);
    }

    private final void persistHistograms(Map<String, HistogramSnapshot> histograms, File directory) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry<String, HistogramSnapshot> entry : histograms.entrySet()) {
            jSONObject.put(entry.getKey(), entry.getValue().toJSONObject());
        }
        writeJsonToFile(new File(directory, HISTOGRAMS_FILE), jSONObject);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void persistSnapshot(DiagnosticsSnapshot snapshot, File directory) throws JSONException {
        Map<String, String> tags = snapshot.getTags();
        if (tags != null) {
            try {
                persistTags(tags, directory);
            } catch (IOException e3) {
                this.logger.error("DiagnosticsStorage: Failed to write tags: " + e3.getMessage());
            }
        }
        Map<String, Long> counters = snapshot.getCounters();
        if (counters != null) {
            try {
                persistCounters(counters, directory);
            } catch (IOException e11) {
                this.logger.error("DiagnosticsStorage: Failed to write counters: " + e11.getMessage());
            }
        }
        Map<String, HistogramSnapshot> histograms = snapshot.getHistograms();
        if (histograms != null) {
            try {
                persistHistograms(histograms, directory);
            } catch (IOException e12) {
                this.logger.error("DiagnosticsStorage: Failed to write histograms: " + e12.getMessage());
            }
        }
        List<DiagnosticsEvent> events = snapshot.getEvents();
        if (events != null) {
            try {
                persistEvents(events, directory);
            } catch (IOException e13) {
                this.logger.error("DiagnosticsStorage: Failed to write events: " + e13.getMessage());
            }
        }
    }

    private final void persistTags(Map<String, String> tags, File directory) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry<String, String> entry : tags.entrySet()) {
            jSONObject.put(entry.getKey(), entry.getValue());
        }
        writeJsonToFile(new File(directory, TAGS_FILE), jSONObject);
    }

    private final void prepareEventsLog(File eventsFile, File directory) throws IOException {
        if (!eventsFile.exists()) {
            File parentFile = eventsFile.getParentFile();
            if (parentFile != null) {
                parentFile.mkdirs();
            }
            eventsFile.createNewFile();
            return;
        }
        if (eventsFile.length() >= 262144) {
            if (eventsFile.renameTo(new File(directory, c1.o(System.currentTimeMillis(), "events-", ".log")))) {
                eventsFile.createNewFile();
            } else {
                this.logger.warn("DiagnosticsStorage: Failed to rotate events log");
            }
        }
    }

    private final JSONObject readJsonFromFile(File file) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream, Charsets.f72000b));
            try {
                JSONObject jSONObject = new JSONObject(TextStreamsKt.b(bufferedReader));
                bufferedReader.close();
                fileInputStream.close();
                return jSONObject;
            } finally {
            }
        } finally {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void removeActiveFiles() {
        File fileActiveStorageDirectory = activeStorageDirectory();
        if (fileActiveStorageDirectory.exists()) {
            new File(fileActiveStorageDirectory, COUNTERS_FILE).delete();
            new File(fileActiveStorageDirectory, "counters.json.tmp").delete();
            new File(fileActiveStorageDirectory, HISTOGRAMS_FILE).delete();
            new File(fileActiveStorageDirectory, "histograms.json.tmp").delete();
            new File(fileActiveStorageDirectory, EVENTS_FILE).delete();
            File[] fileArrListFiles = fileActiveStorageDirectory.listFiles();
            if (fileArrListFiles != null) {
                for (File file : fileArrListFiles) {
                    String name = file.getName();
                    Intrinsics.d(name);
                    if (j.I0(name, "events-", false) && j.A0(name, ".log", false)) {
                        file.delete();
                    }
                }
            }
        }
    }

    private final void writeJsonToFile(File file, JSONObject json) {
        File file2 = new File(file.getParentFile(), file.getName() + ".tmp");
        try {
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(file2);
                try {
                    BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(fileOutputStream, Charsets.f72000b));
                    try {
                        bufferedWriter.write(json.toString());
                        Unit unit = Unit.f71706a;
                        bufferedWriter.close();
                        fileOutputStream.close();
                        if (!file2.renameTo(file)) {
                            FilesKt.m0(file2, file);
                        }
                    } finally {
                    }
                } finally {
                }
            } catch (IOException e3) {
                this.logger.error("DiagnosticsStorage: Failed to write JSON to file: " + file.getAbsolutePath() + ": " + e3.getMessage());
                throw e3;
            }
        } finally {
            file2.delete();
        }
    }

    public final void close() {
        this.channel.r(null);
    }

    @Nullable
    public final Object closeAndJoin(@NotNull Continuation<? super Unit> continuation) {
        this.channel.r(null);
        Object objK = this.actorJob.K(continuation);
        return objK == CoroutineSingletons.f71806a ? objK : Unit.f71706a;
    }

    public final void deleteActiveFiles() {
        this.channel.j(Operation.DeleteActiveFiles.INSTANCE);
    }

    @NotNull
    public final List<DiagnosticsSnapshot> loadAndClearPreviousSessions() {
        Logger logger;
        StringBuilder sb2;
        File fileInstanceDirectory = instanceDirectory();
        if (!fileInstanceDirectory.exists() || !fileInstanceDirectory.isDirectory()) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        File[] fileArrListFiles = fileInstanceDirectory.listFiles(new FileFilter() { // from class: com.amplitude.core.diagnostics.a
            @Override // java.io.FileFilter
            public final boolean accept(File file) {
                return DiagnosticsStorage.loadAndClearPreviousSessions$lambda$0(this.f20514a, file);
            }
        });
        if (fileArrListFiles == null) {
            fileArrListFiles = new File[0];
        }
        for (File file : fileArrListFiles) {
            try {
                try {
                    Intrinsics.d(file);
                    DiagnosticsSnapshot diagnosticsSnapshotLoadSnapshot = loadSnapshot(file);
                    if (diagnosticsSnapshotLoadSnapshot != null) {
                        arrayList.add(diagnosticsSnapshotLoadSnapshot);
                    }
                } catch (Exception e3) {
                    this.logger.error("DiagnosticsStorage: Failed to load previous session " + file.getName() + ": " + e3.getMessage());
                    try {
                        deleteDirectory(file);
                    } catch (Exception e11) {
                        e = e11;
                        logger = this.logger;
                        sb2 = new StringBuilder("DiagnosticsStorage: Failed to delete session directory ");
                        sb2.append(file.getName());
                        sb2.append(": ");
                        sb2.append(e.getMessage());
                        logger.error(sb2.toString());
                    }
                }
                try {
                    deleteDirectory(file);
                } catch (Exception e12) {
                    e = e12;
                    logger = this.logger;
                    sb2 = new StringBuilder("DiagnosticsStorage: Failed to delete session directory ");
                    sb2.append(file.getName());
                    sb2.append(": ");
                    sb2.append(e.getMessage());
                    logger.error(sb2.toString());
                }
            } catch (Throwable th2) {
                try {
                    Intrinsics.d(file);
                    deleteDirectory(file);
                } catch (Exception e13) {
                    this.logger.error("DiagnosticsStorage: Failed to delete session directory " + file.getName() + ": " + e13.getMessage());
                }
                throw th2;
            }
        }
        return arrayList;
    }

    public final void saveSnapshot(@NotNull DiagnosticsSnapshot snapshot) {
        Intrinsics.g(snapshot, "snapshot");
        this.channel.j(new Operation.SaveSnapshot(snapshot));
    }
}
