.class public final synthetic Lcom/momo/rtcbase/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoSink;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/Camera1Session;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/Camera1Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/rtcbase/a;->a:Lcom/momo/rtcbase/Camera1Session;

    return-void
.end method


# virtual methods
.method public final onFrame(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/a;->a:Lcom/momo/rtcbase/Camera1Session;

    invoke-static {p0, p1}, Lcom/momo/rtcbase/Camera1Session;->a(Lcom/momo/rtcbase/Camera1Session;Lcom/momo/rtcbase/VideoFrame;)V

    return-void
.end method
