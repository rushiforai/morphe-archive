.class public Ll/vxh0;
.super Lcom/immomo/mmdns/IMDDNSConfig;
.source "SourceFile"


# static fields
.field public static b:Ljava/lang/String; = "7d619d2a0cc234d97768aecf533d7aa9"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mmdns/IMDDNSConfig;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vxh0;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getAppId()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/vxh0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDefaultLocalDNSConfigs()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "{\"data\":{\"ldns_ttl\":300,\"g_forece_update_inter\":1,\"retry\":1,\"log_upload_inter\":3600,\"cdn_fails\":3,\"mas\":{\"last_number\":[\"5\"]},\"clean_current_available_address\":1,\"ttl\":300,\"referee_fails\":1,\"dns\":[{\"domain\":\"httpdns.immomo.com\",\"ips\":{\"slaves\":[\"47.84.89.117\",\"47.93.180.18\",\"60.205.191.69\",\"47.93.19.216\",],\"master\":\"47.84.65.220\"}}],\"enable_new_referee\":true,\"self_failed_duration\":10,\"ec\":0,\"ap_fails\":2,\"cna\":{\"start_u\":1,\"ignore_ratio\":[],\"backgroud_u\":1,\"intervals\":240,\"ratio\":60,\"total\":10000,\"last_numbers\":[\"3\",\"4\",\"5\",\"6\",\"9\"],\"lock_u\":1,\"last_did\":[\"d3\"]},\"version\":158,\"em\":\"success\",\"idc_fails\":1,\"max_ct\":350,\"failed_retry_loop\":2,\"referee_update_interval\":86400,\"self_failed_count\":1,\"ok\":\"true\",\"g_ttl\":900},\"ec\":200,\"em\":\"sucessful\"}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyStoreSha1()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "71:5B:AB:0F:36:33:95:FE:34:D1:87:68:4B:0E:F7:71:A9:D4:00:F0"

    .line 2
    .line 3
    return-object p0
.end method

.method public getLat()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getLng()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/ui20;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getPreHosts()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxh0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUid()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getUserAgent()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getUA()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isNetworkAvailable()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ui20;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
