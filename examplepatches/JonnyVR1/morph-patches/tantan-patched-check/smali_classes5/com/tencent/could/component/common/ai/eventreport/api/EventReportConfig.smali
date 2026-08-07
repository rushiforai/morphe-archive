.class public Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    }
.end annotation


# static fields
.field public static STRING_INIT:Ljava/lang/String; = ""


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->a(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->b(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->c(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->d(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->d:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->e(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->e:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method

.method public static builder()Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public getBusiness()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDeviceInfoUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getErrorInfoUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOrigin()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
