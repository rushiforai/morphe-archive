.class public Lio/agora/rtc2/DirectCdnStreamingStats;
.super Ljava/lang/Object;


# instance fields
.field public audioBitrate:I

.field public fps:I

.field public videoBitrate:I

.field public videoHeight:I

.field public videoWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoWidth:I

    iput v0, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoHeight:I

    iput v0, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->fps:I

    iput v0, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoBitrate:I

    iput v0, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->audioBitrate:I

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoWidth:I

    iput p2, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoHeight:I

    iput p3, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->fps:I

    iput p4, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoBitrate:I

    iput p5, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->audioBitrate:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 5

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iget v1, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoWidth:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->fps:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v4, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->videoBitrate:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget p0, p0, Lio/agora/rtc2/DirectCdnStreamingStats;->audioBitrate:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v1, v2, v3, v4, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "videoWidth=%d videoHeight=%d fps=%d videoBitrate=%d audioBitrate=%d"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
