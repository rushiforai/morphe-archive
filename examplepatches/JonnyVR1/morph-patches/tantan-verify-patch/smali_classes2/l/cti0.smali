.class public final synthetic Ll/cti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/TextureBufferImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cti0;->a:Lcom/bytedance/realx/video/TextureBufferImpl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cti0;->a:Lcom/bytedance/realx/video/TextureBufferImpl;

    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->release()V

    return-void
.end method
