.class public final synthetic Ll/ael0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/VideoFileRenderer;

.field public final synthetic b:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/VideoFileRenderer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ael0;->a:Lcom/momo/rtcbase/VideoFileRenderer;

    iput-object p2, p0, Ll/ael0;->b:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ael0;->a:Lcom/momo/rtcbase/VideoFileRenderer;

    iget-object p0, p0, Ll/ael0;->b:Ljava/util/concurrent/CountDownLatch;

    invoke-static {v0, p0}, Lcom/momo/rtcbase/VideoFileRenderer;->d(Lcom/momo/rtcbase/VideoFileRenderer;Ljava/util/concurrent/CountDownLatch;)V

    return-void
.end method
