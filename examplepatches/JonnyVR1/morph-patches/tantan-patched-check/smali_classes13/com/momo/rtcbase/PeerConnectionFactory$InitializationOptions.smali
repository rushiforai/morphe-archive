.class public Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnectionFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InitializationOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    }
.end annotation


# instance fields
.field final applicationContext:Landroid/content/Context;

.field final enableInternalTracer:Z

.field final fieldTrials:Ljava/lang/String;

.field loggable:Lcom/momo/rtcbase/Loggable;

.field loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

.field final nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

.field final nativeLibraryName:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;ZLcom/momo/rtcbase/NativeLibraryLoader;Ljava/lang/String;Lcom/momo/rtcbase/Loggable;Lcom/momo/rtcbase/Logging$Severity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->applicationContext:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->fieldTrials:Ljava/lang/String;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->enableInternalTracer:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->nativeLibraryLoader:Lcom/momo/rtcbase/NativeLibraryLoader;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->nativeLibraryName:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->loggable:Lcom/momo/rtcbase/Loggable;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;->loggableSeverity:Lcom/momo/rtcbase/Logging$Severity;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;ZLcom/momo/rtcbase/NativeLibraryLoader;Ljava/lang/String;Lcom/momo/rtcbase/Loggable;Lcom/momo/rtcbase/Logging$Severity;Lcom/momo/rtcbase/PeerConnectionFactory$1;)V
    .locals 0

    .line 19
    invoke-direct/range {p0 .. p7}, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions;-><init>(Landroid/content/Context;Ljava/lang/String;ZLcom/momo/rtcbase/NativeLibraryLoader;Ljava/lang/String;Lcom/momo/rtcbase/Loggable;Lcom/momo/rtcbase/Logging$Severity;)V

    return-void
.end method

.method public static builder(Landroid/content/Context;)Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/PeerConnectionFactory$InitializationOptions$Builder;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
