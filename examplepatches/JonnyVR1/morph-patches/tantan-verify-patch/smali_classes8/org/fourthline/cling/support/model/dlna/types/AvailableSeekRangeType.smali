.class public Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;
    }
.end annotation


# instance fields
.field private bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

.field private modeFlag:Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;

.field private normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;Lorg/fourthline/cling/model/types/BytesRange;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->modeFlag:Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;

    .line 13
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->modeFlag:Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;

    .line 16
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;Lorg/fourthline/cling/model/types/BytesRange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->modeFlag:Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getBytesRange()Lorg/fourthline/cling/model/types/BytesRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->bytesRange:Lorg/fourthline/cling/model/types/BytesRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModeFlag()Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->modeFlag:Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType$Mode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNormalPlayTimeRange()Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/AvailableSeekRangeType;->normalPlayTimeRange:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    .line 2
    .line 3
    return-object p0
.end method
