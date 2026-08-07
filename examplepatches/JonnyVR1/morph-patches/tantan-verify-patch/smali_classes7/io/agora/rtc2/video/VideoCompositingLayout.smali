.class public Lio/agora/rtc2/video/VideoCompositingLayout;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/VideoCompositingLayout$Builder;,
        Lio/agora/rtc2/video/VideoCompositingLayout$Canvas;,
        Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public appData:[B

.field public backgroundColor:Ljava/lang/String;

.field public canvasHeight:I

.field public canvasWidth:I

.field public regions:[Lio/agora/rtc2/video/VideoCompositingLayout$Region;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout;->regions:[Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    iput-object v0, p0, Lio/agora/rtc2/video/VideoCompositingLayout;->appData:[B

    return-void
.end method

.method public static isValidColor(Ljava/lang/String;)Z
    .locals 0

    :try_start_0
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method
