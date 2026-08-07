.class public Ll/la;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    const-string v0, "MomoSoundAndroid"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "MomoAudioMixer"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "ijkaudioprocess"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static b(Ll/wfm;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->S()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/p6s;->E0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    :try_start_0
    new-instance v0, Ll/ka;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/ka;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v1, "hookLoadLibrariesOnce"

    .line 32
    .line 33
    const-string v2, "all"

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-static {v0, v1, v2, v3, p0}, Ll/j5t;->a(Ll/x20;Ljava/lang/String;Ljava/lang/String;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catchall_0
    sget-boolean v0, Ll/la;->a:Z

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    sput-boolean p0, Ll/la;->a:Z

    .line 45
    .line 46
    const-string p0, "AudioProcessHookSo"

    .line 47
    .line 48
    const-string v0, "dlopen failed: library libMomoSoundAndroid.so not found"

    .line 49
    .line 50
    invoke-static {p0, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void

    .line 54
    :cond_1
    const-class v0, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 55
    .line 56
    invoke-static {v0}, Ll/puc0;->k(Ljava/lang/Class;)Ll/puc0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "loadLibrariesOnce"

    .line 61
    .line 62
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, v1, p0}, Ll/puc0;->c(Ljava/lang/String;[Ljava/lang/Object;)Ll/puc0;

    .line 67
    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public static c(Lio/agora/base/internal/voiceengine/WebRtcAudioManager;II)V
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "notifyPlayoutVolumeChange"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/puc0;->c(Ljava/lang/String;[Ljava/lang/Object;)Ll/puc0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
