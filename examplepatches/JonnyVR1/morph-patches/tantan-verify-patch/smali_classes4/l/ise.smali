.class public final synthetic Ll/ise;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/EglRenderer;

.field public final synthetic b:Ljava/util/concurrent/CountDownLatch;

.field public final synthetic c:Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ise;->a:Lcom/ss/bytertc/base/media/EglRenderer;

    iput-object p2, p0, Ll/ise;->b:Ljava/util/concurrent/CountDownLatch;

    iput-object p3, p0, Ll/ise;->c:Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ise;->a:Lcom/ss/bytertc/base/media/EglRenderer;

    iget-object v1, p0, Ll/ise;->b:Ljava/util/concurrent/CountDownLatch;

    iget-object p0, p0, Ll/ise;->c:Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;

    invoke-static {v0, v1, p0}, Lcom/ss/bytertc/base/media/EglRenderer;->b(Lcom/ss/bytertc/base/media/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;)V

    return-void
.end method
