.class public Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConfigBuilder"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->STRING_INIT:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->d:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->e:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public create()Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;-><init>(Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public setBusiness(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDeviceInfoUrl(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setErrorInfoUrl(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setOrigin(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSdkVersion(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig$ConfigBuilder;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
