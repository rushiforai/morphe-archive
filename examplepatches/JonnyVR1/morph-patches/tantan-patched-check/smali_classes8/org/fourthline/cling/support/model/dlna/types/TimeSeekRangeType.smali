.class public Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

.field private normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;->normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;Lorg/fourthline/cling/model/types/BytesRange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;->normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;->bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getBytesRange()Lorg/fourthline/cling/model/types/BytesRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;->bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNormalPlayTimeRange()Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;->normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBytesRange(Lorg/fourthline/cling/model/types/BytesRange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/TimeSeekRangeType;->bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

    .line 2
    .line 3
    return-void
.end method
