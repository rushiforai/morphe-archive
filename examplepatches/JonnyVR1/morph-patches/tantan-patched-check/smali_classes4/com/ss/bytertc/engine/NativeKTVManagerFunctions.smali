.class public Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native nativeCancelDownload(JI)V
.end method

.method public static native nativeClearCache(J)V
.end method

.method public static native nativeDownloadLyric(JLjava/lang/String;I)I
.end method

.method public static native nativeDownloadMidi(JLjava/lang/String;)I
.end method

.method public static native nativeDownloadMusic(JLjava/lang/String;)I
.end method

.method public static native nativeGetHotMusic(J[Ljava/lang/String;I)V
.end method

.method public static native nativeGetKTVPlayer(J)J
.end method

.method public static native nativeGetMusicDetail(JLjava/lang/String;)V
.end method

.method public static native nativeGetMusicList(JIII)V
.end method

.method public static native nativeReleaseKTVManagerEventHandler(J)V
.end method

.method public static native nativeSearchMusic(JLjava/lang/String;III)V
.end method

.method public static native nativeSetKTVManagerEventHandler(JLcom/ss/bytertc/ktv/IKTVManagerEventHandler;)J
.end method

.method public static native nativeSetMaxCacheSize(JI)V
.end method
