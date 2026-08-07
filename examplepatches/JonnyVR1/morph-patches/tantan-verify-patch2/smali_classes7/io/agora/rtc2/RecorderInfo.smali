.class public Lio/agora/rtc2/RecorderInfo;
.super Ljava/lang/Object;


# instance fields
.field public durationMs:I

.field public fileName:Ljava/lang/String;

.field public fileSize:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/RecorderInfo;->fileName:Ljava/lang/String;

    iput p2, p0, Lio/agora/rtc2/RecorderInfo;->durationMs:I

    iput p3, p0, Lio/agora/rtc2/RecorderInfo;->fileSize:I

    return-void
.end method
