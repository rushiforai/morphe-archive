.class public final synthetic Ll/zsi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/TextureBufferImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/TextureBufferImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zsi0;->a:Lcom/momo/rtcbase/TextureBufferImpl;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsi0;->a:Lcom/momo/rtcbase/TextureBufferImpl;

    invoke-static {p0}, Lcom/momo/rtcbase/TextureBufferImpl;->a(Lcom/momo/rtcbase/TextureBufferImpl;)Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    move-result-object p0

    return-object p0
.end method
