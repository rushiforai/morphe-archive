.class public final synthetic Ll/fti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/TextureBufferImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fti0;->a:Lcom/bytedance/realx/video/TextureBufferImpl;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fti0;->a:Lcom/bytedance/realx/video/TextureBufferImpl;

    invoke-static {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->c(Lcom/bytedance/realx/video/TextureBufferImpl;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    move-result-object p0

    return-object p0
.end method
