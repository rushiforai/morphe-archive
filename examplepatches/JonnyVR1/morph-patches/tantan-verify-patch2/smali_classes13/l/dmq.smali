.class public final synthetic Ll/dmq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/VideoFrame$I420Buffer;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/VideoFrame$I420Buffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dmq;->a:Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dmq;->a:Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->release()V

    return-void
.end method
