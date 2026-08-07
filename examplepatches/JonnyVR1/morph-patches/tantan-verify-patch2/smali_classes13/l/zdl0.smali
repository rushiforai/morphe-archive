.class public final synthetic Ll/zdl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/VideoFileRenderer;

.field public final synthetic b:Lcom/momo/rtcbase/VideoFrame$I420Buffer;

.field public final synthetic c:Lcom/momo/rtcbase/VideoFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/VideoFileRenderer;Lcom/momo/rtcbase/VideoFrame$I420Buffer;Lcom/momo/rtcbase/VideoFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zdl0;->a:Lcom/momo/rtcbase/VideoFileRenderer;

    iput-object p2, p0, Ll/zdl0;->b:Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    iput-object p3, p0, Ll/zdl0;->c:Lcom/momo/rtcbase/VideoFrame;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zdl0;->a:Lcom/momo/rtcbase/VideoFileRenderer;

    iget-object v1, p0, Ll/zdl0;->b:Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    iget-object p0, p0, Ll/zdl0;->c:Lcom/momo/rtcbase/VideoFrame;

    invoke-static {v0, v1, p0}, Lcom/momo/rtcbase/VideoFileRenderer;->c(Lcom/momo/rtcbase/VideoFileRenderer;Lcom/momo/rtcbase/VideoFrame$I420Buffer;Lcom/momo/rtcbase/VideoFrame;)V

    return-void
.end method
