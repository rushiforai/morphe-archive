.class public final Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/option/AvFormatOption;


# static fields
.field public static b:Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;

.field public static c:Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;

    .line 2
    .line 3
    const-string v1, "1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;->b:Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;

    .line 9
    .line 10
    new-instance v0, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;

    .line 11
    .line 12
    const-string v1, "0"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;->c:Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "http-detect-range-support"

    .line 2
    .line 3
    return-object p0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/option/format/AvFormatOption_HttpDetectRangeSupport;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
