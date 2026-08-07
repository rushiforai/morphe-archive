.class public Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public command_id_comment:Ljava/lang/String;

.field public report_common:Z

.field public report_datatime:I

.field public report_status:Z

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->command_id_comment:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->url:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_common:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_status:Z

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_datatime:I

    .line 17
    .line 18
    return-void
.end method
