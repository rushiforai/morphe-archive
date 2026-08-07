.class public Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReportLog"
.end annotation


# instance fields
.field body:Ljava/lang/String;

.field id:Ljava/util/UUID;

.field provider:I

.field publisherType:Ljava/lang/String;

.field roomId:Ljava/lang/String;

.field sessionTime:Ljava/lang/String;

.field type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->id:Ljava/util/UUID;

    .line 5
    .line 6
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->type:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->sessionTime:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->body:Ljava/lang/String;

    .line 13
    .line 14
    iput p6, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->provider:I

    .line 15
    .line 16
    iput-object p7, p0, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$ReportLog;->publisherType:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method
