.class final Le/e/a/DownloadUi115$Row;
.super Ljava/lang/Object;
.source "DownloadUi115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DownloadUi115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Row"
.end annotation


# instance fields
.field bytes:J

.field cache:Z

.field detail:Ljava/lang/String;

.field id:Ljava/lang/String;

.field job:Le/e/a/DownloadJobs115$Job;

.field percent:I

.field status:Ljava/lang/String;

.field title:Ljava/lang/String;

.field total:J

.field uri:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/DownloadUi115$Row;->percent:I

    return-void
.end method
