.class public Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCompositingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Canvas"
.end annotation


# instance fields
.field public bgColor:Ljava/lang/String;

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x140

    iput v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->width:I

    const/16 v0, 0x280

    iput v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->height:I

    const-string v0, "#FF0000"

    iput-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;->bgColor:Ljava/lang/String;

    return-void
.end method
