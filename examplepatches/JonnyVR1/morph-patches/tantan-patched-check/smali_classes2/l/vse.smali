.class public final synthetic Ll/vse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/EglRenderer;

.field public final synthetic b:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iput-object p2, p0, Ll/vse;->b:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iget-object p0, p0, Ll/vse;->b:Ljava/util/concurrent/CountDownLatch;

    invoke-static {v0, p0}, Lcom/bytedance/realx/video/EglRenderer;->f(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;)V

    return-void
.end method
