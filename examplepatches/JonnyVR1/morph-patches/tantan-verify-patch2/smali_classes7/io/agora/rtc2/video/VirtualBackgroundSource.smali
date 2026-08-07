.class public Lio/agora/rtc2/video/VirtualBackgroundSource;
.super Ljava/lang/Object;


# static fields
.field public static final BACKGROUND_BLUR:I = 0x3

.field public static final BACKGROUND_COLOR:I = 0x1

.field public static final BACKGROUND_IMG:I = 0x2

.field public static final BACKGROUND_NONE:I = 0x0

.field public static final BACKGROUND_VIDEO:I = 0x4

.field public static final BLUR_DEGREE_HIGH:I = 0x3

.field public static final BLUR_DEGREE_LOW:I = 0x1

.field public static final BLUR_DEGREE_MEDIUM:I = 0x2


# instance fields
.field public backgroundSourceType:I

.field public blurDegree:I

.field public color:I

.field public source:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->backgroundSourceType:I

    const v0, 0xffffff

    iput v0, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->color:I

    const-string v0, ""

    iput-object v0, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->source:Ljava/lang/String;

    const/4 v0, 0x3

    iput v0, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->blurDegree:I

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;I)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->backgroundSourceType:I

    iput p2, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->color:I

    iput-object p3, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->source:Ljava/lang/String;

    iput p4, p0, Lio/agora/rtc2/video/VirtualBackgroundSource;->blurDegree:I

    return-void
.end method
