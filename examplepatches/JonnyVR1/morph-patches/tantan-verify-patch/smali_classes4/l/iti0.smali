.class public final synthetic Ll/iti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

.field public final synthetic b:Lcom/bytedance/realx/video/VideoFrame;

.field public final synthetic c:Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Lcom/bytedance/realx/video/VideoFrame;Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iti0;->a:Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    iput-object p2, p0, Ll/iti0;->b:Lcom/bytedance/realx/video/VideoFrame;

    iput-object p3, p0, Ll/iti0;->c:Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iti0;->a:Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;

    iget-object v1, p0, Ll/iti0;->b:Lcom/bytedance/realx/video/VideoFrame;

    iget-object p0, p0, Ll/iti0;->c:Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    invoke-static {v0, v1, p0}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->j(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Lcom/bytedance/realx/video/VideoFrame;Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;)V

    return-void
.end method
