.class public Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private enableInternalTracer:Z

.field private fieldTrials:Ljava/lang/String;

.field private loggable:Lcom/momo/rtcbase/Loggable;

.field private loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

.field private nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

.field private nativeLibraryName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->fieldTrials:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Lcom/momo/rtcbase/NativeLibrary$DefaultLoader;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/momo/rtcbase/NativeLibrary$DefaultLoader;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

    .line 14
    .line 15
    const-string v0, "jingle_peerconnection_so"

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->nativeLibraryName:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->applicationContext:Landroid/content/Context;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public createInitializationOptions()Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;
    .locals 9

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->applicationContext:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->fieldTrials:Ljava/lang/String;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->enableInternalTracer:Z

    .line 8
    .line 9
    iget-object v4, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->nativeLibraryName:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->loggable:Lcom/momo/rtcbase/Loggable;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    invoke-direct/range {v0 .. v8}, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;-><init>(Landroid/content/Context;Ljava/lang/String;ZLcom/momo/rtcbase/NativeLibraryLoader;Ljava/lang/String;Lcom/momo/rtcbase/Loggable;Lcom/momo/rtcbase/Logging$Severity;Lcom/momo/rtcbase/PeerConnectionFactory$1;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public setEnableInternalTracer(Z)Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->enableInternalTracer:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setFieldTrials(Ljava/lang/String;)Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->fieldTrials:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setInjectableLogger(Lcom/momo/rtcbase/Loggable;Lcom/momo/rtcbase/Logging$Severity;)Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->loggable:Lcom/momo/rtcbase/Loggable;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

    .line 4
    .line 5
    return-object p0
.end method

.method public setNativeLibraryLoader(Lcom/momo/rtcbase/NativeLibraryLoader;)Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

    .line 2
    .line 3
    return-object p0
.end method

.method public setNativeLibraryName(Ljava/lang/String;)Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;->nativeLibraryName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
