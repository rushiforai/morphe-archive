.class public Lio/agora/rtc2/video/VideoCompositingLayout$Region;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCompositingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Region"
.end annotation


# instance fields
.field public alpha:D

.field public height:D

.field public renderMode:I

.field public uid:I

.field public userId:Ljava/lang/String;

.field public width:D

.field public x:D

.field public y:D

.field public zOrder:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public alpha(D)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput-wide p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->alpha:D

    return-object p0
.end method

.method public position(DD)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput-wide p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->x:D

    iput-wide p3, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->y:D

    return-object p0
.end method

.method public renderMode(I)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->renderMode:I

    return-object p0
.end method

.method public size(DD)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput-wide p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->width:D

    iput-wide p3, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->height:D

    return-object p0
.end method

.method public uid(I)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->uid:I

    return-object p0
.end method

.method public userId(Ljava/lang/String;)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->userId:Ljava/lang/String;

    return-object p0
.end method

.method public zOrder(I)Lio/agora/rtc2/video/VideoCompositingLayout$Region;
    .locals 0

    iput p1, p0, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->zOrder:I

    return-object p0
.end method
