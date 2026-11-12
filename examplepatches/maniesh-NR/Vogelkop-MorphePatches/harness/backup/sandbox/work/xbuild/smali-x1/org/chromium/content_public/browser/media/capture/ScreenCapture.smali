.class public final Lorg/chromium/content_public/browser/media/capture/ScreenCapture;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/util/concurrent/atomic/AtomicReference;


# instance fields
.field public a:Landroid/hardware/display/VirtualDisplay;

.field public final b:Ljava/util/ArrayList;

.field public volatile c:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->d:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Landroid/os/ConditionVariable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->b:Ljava/util/ArrayList;

    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method public static create(J)Lorg/chromium/content_public/browser/media/capture/ScreenCapture;
    .registers 3

    new-instance v0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;

    invoke-direct {v0, p0, p1}, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public final destroy()V
    .registers 4

    iget-object v0, p0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->a:Landroid/hardware/display/VirtualDisplay;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->a:Landroid/hardware/display/VirtualDisplay;

    :cond_a
    iget-object v0, p0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_12
    if-ltz v1, :cond_20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqxa;

    invoke-virtual {v2}, Lqxa;->a()V

    add-int/lit8 v1, v1, -0x1

    goto :goto_12

    :cond_20
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    new-instance v0, Lmni;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lorg/chromium/base/ThreadUtils;->d(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final startCapture()Z
    .registers 2

    sget-object p0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->d:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0
.end method
