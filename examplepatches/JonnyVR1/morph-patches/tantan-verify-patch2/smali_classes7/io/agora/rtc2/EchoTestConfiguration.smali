.class public Lio/agora/rtc2/EchoTestConfiguration;
.super Ljava/lang/Object;


# instance fields
.field public channelId:Ljava/lang/String;

.field public enableAudio:Z

.field public enableVideo:Z

.field public intervalInSeconds:I

.field public token:Ljava/lang/String;

.field public view:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lio/agora/rtc2/EchoTestConfiguration;->intervalInSeconds:I

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/EchoTestConfiguration;->view:Landroid/view/SurfaceView;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/agora/rtc2/EchoTestConfiguration;->enableAudio:Z

    iput-boolean v1, p0, Lio/agora/rtc2/EchoTestConfiguration;->enableVideo:Z

    iput-object v0, p0, Lio/agora/rtc2/EchoTestConfiguration;->token:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/rtc2/EchoTestConfiguration;->channelId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceView;ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    const/16 v6, 0xa

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lio/agora/rtc2/EchoTestConfiguration;-><init>(Landroid/view/SurfaceView;ZZLjava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceView;ZZLjava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/EchoTestConfiguration;->view:Landroid/view/SurfaceView;

    iput-boolean p2, p0, Lio/agora/rtc2/EchoTestConfiguration;->enableAudio:Z

    iput-boolean p3, p0, Lio/agora/rtc2/EchoTestConfiguration;->enableVideo:Z

    iput-object p4, p0, Lio/agora/rtc2/EchoTestConfiguration;->token:Ljava/lang/String;

    iput-object p5, p0, Lio/agora/rtc2/EchoTestConfiguration;->channelId:Ljava/lang/String;

    iput p6, p0, Lio/agora/rtc2/EchoTestConfiguration;->intervalInSeconds:I

    return-void
.end method
