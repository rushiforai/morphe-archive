.class public Ll/li20;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ll/zqf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zqf0<",
            "Ll/li20;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public volatile a:Lcom/p1/mobile/putong/data/NetReportSetting;

.field public volatile b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/li20$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/li20$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/li20;->c:Ll/zqf0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/li20;->k()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ji20;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/ji20;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ki20;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ki20;-><init>(Ll/li20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public synthetic constructor <init>(Ll/mi20;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ll/li20;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/li20;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/li20;->j(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method public static g()Ll/li20;
    .locals 1

    .line 1
    sget-object v0, Ll/li20;->c:Ll/zqf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zqf0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/li20;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public d(Lcom/tantanapp/common/network/NetworkTrackInfo;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    return v3

    .line 13
    :cond_1
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestUrl()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v4, "http://"

    .line 18
    .line 19
    const-string v5, ""

    .line 20
    .line 21
    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v4, "https://"

    .line 26
    .line 27
    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {}, Ll/qv5;->c()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const-string v5, "tantanapp"

    .line 36
    .line 37
    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object p0, p0, Ll/li20;->b:Ljava/util/List;

    .line 42
    .line 43
    new-instance v4, Ll/ii20;

    .line 44
    .line 45
    invoke-direct {v4, v2}, Ll/ii20;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0, v4}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_2

    .line 53
    .line 54
    return v3

    .line 55
    :cond_2
    :try_start_0
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseCode()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    const/16 p1, 0x64

    .line 64
    .line 65
    div-int/2addr p0, p1

    .line 66
    const/4 v2, 0x2

    .line 67
    if-ne p0, v2, :cond_3

    .line 68
    .line 69
    invoke-static {p1}, Ll/gkc0;->b(I)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    iget p1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 74
    .line 75
    if-ge p0, p1, :cond_4

    .line 76
    .line 77
    return v1

    .line 78
    :cond_3
    invoke-static {p1}, Ll/gkc0;->b(I)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    iget p1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    if-ge p0, p1, :cond_4

    .line 85
    .line 86
    return v1

    .line 87
    :cond_4
    return v3

    .line 88
    :catch_0
    return v1
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 8
    .line 9
    return p0
.end method

.method public final f(Ll/x1d0;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/rnl;->m()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/qv5;->c()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "tantanapp"

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public h(Ll/x1d0;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/li20;->f(Ll/x1d0;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NetReportDomains;->media:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const-string p0, "media"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NetReportDomains;->api:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const-string p0, "api"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    return-object p2
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 8
    .line 9
    return p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/li20;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "net_report_settings"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/data/NetReportSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 29
    .line 30
    iput-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 31
    .line 32
    iget-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NetReportDomains;->api:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/NetReportDomains;->media:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    :catch_0
    :cond_0
    iput-object v1, p0, Ll/li20;->b:Ljava/util/List;

    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const/4 v0, 0x0

    .line 62
    iput-object v0, p0, Ll/li20;->a:Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 63
    .line 64
    return-void
.end method
