.class public final synthetic Ll/bti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/TextureBufferImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/TextureBufferImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bti0;->a:Lcom/momo/rtcbase/TextureBufferImpl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bti0;->a:Lcom/momo/rtcbase/TextureBufferImpl;

    invoke-virtual {p0}, Lcom/momo/rtcbase/TextureBufferImpl;->release()V

    return-void
.end method
