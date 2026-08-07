.class public Lio/agora/rtc2/video/WatermarkOptions;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/WatermarkOptions$Rectangle;
    }
.end annotation


# instance fields
.field public positionInLandscapeMode:Lio/agora/rtc2/video/WatermarkOptions$Rectangle;

.field public positionInPortraitMode:Lio/agora/rtc2/video/WatermarkOptions$Rectangle;

.field public visibleInPreview:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/video/WatermarkOptions;->visibleInPreview:Z

    new-instance v0, Lio/agora/rtc2/video/WatermarkOptions$Rectangle;

    invoke-direct {v0}, Lio/agora/rtc2/video/WatermarkOptions$Rectangle;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/video/WatermarkOptions;->positionInLandscapeMode:Lio/agora/rtc2/video/WatermarkOptions$Rectangle;

    new-instance v0, Lio/agora/rtc2/video/WatermarkOptions$Rectangle;

    invoke-direct {v0}, Lio/agora/rtc2/video/WatermarkOptions$Rectangle;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/video/WatermarkOptions;->positionInPortraitMode:Lio/agora/rtc2/video/WatermarkOptions$Rectangle;

    return-void
.end method
