.class public Lcom/ss/android/ttvecamera/d$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/android/ttvecamera/d$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field private static volatile INSTANCE:Lcom/ss/android/ttvecamera/d$c;


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

.method public static a()Lcom/ss/android/ttvecamera/d$c;
    .locals 3

    .line 1
    const-class v0, Lcom/ss/android/ttvecamera/d$c;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/ss/android/ttvecamera/d$c;->INSTANCE:Lcom/ss/android/ttvecamera/d$c;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-class v1, Lcom/ss/android/ttvecamera/d$c;

    .line 9
    .line 10
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    :try_start_1
    new-instance v2, Lcom/ss/android/ttvecamera/d$c;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/ss/android/ttvecamera/d$c;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v2, Lcom/ss/android/ttvecamera/d$c;->INSTANCE:Lcom/ss/android/ttvecamera/d$c;

    .line 17
    .line 18
    monitor-exit v1

    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v2

    .line 21
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    :try_start_2
    throw v2

    .line 23
    :catchall_1
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    sget-object v1, Lcom/ss/android/ttvecamera/d$c;->INSTANCE:Lcom/ss/android/ttvecamera/d$c;

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object v1

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 30
    throw v1
.end method


# virtual methods
.method public onCaptureStarted(II)V
    .locals 0

    return-void
.end method

.method public onCaptureStopped(I)V
    .locals 0

    return-void
.end method

.method public onError(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onInfo(IILjava/lang/String;)V
    .locals 0

    return-void
.end method
