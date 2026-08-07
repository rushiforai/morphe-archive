.class Ll/l3d0$b;
.super Lcom/immomo/mmdns/IMDDNSConfig;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l3d0;->e(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/l3d0$b;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/mmdns/IMDDNSConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getAppId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "8701b0b5e66f551562c78781b1dc66c3"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDefaultLocalDNSConfigs()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "{\"data\":{\"ldns_ttl\":300,\"g_forece_update_inter\":1,\"retry\":1,\"ap_fails\":2,\"cdn_fails\":3,\"mas\":{\"last_number\":[\"5\"]},\"clean_current_available_address\":1,\"referee_update_interval\":86400,\"etag\":\"86cf85b88f6ded93237795a6ae5c99ec\",\"referee_fails\":1,\"dns\":[{\"domain\":\"httpdns.immomo.com\",\"ips\":{\"slaves\":[\"47.94.118.112\",\"47.95.130.252\",\"47.95.72.247\",\"47.95.130.249\"],\"master\":\"47.95.97.78\"}}],\"enable_new_referee\":true,\"em\":\"success\",\"ok\":\"true\",\"self_failed_count\":1,\"cna\":{\"start_u\":1,\"ignore_ratio\":{},\"backgroud_u\":1,\"intervals\":240,\"ratio\":60,\"total\":10000,\"last_numbers\":[\"3\",\"4\",\"5\",\"6\",\"9\"],\"lock_u\":1,\"last_did\":[\"d3\"]},\"version\":158,\"g_ttl\":900,\"failed_retry_loop\":2,\"idc_fails\":1,\"max_ct\":350,\"ttl\":300,\"self_failed_duration\":10,\"ec\":0,\"log_upload_interval\":3600},\"ec\":200,\"em\":\"sucessful\"}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyStoreSha1()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "93:67:6F:25:2A:8D:88:1D:11:B6:67:C0:61:7D:62:B8:74:19:AE:17"

    .line 2
    .line 3
    return-object p0
.end method

.method public getLat()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l3d0$b;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/nxv;->b(Landroid/content/Context;)Ll/nxv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/nxv;->c()Ll/nxv$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Ll/nxv$b;->a:F

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getLng()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l3d0$b;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/nxv;->b(Landroid/content/Context;)Ll/nxv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/nxv;->c()Ll/nxv$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Ll/nxv$b;->b:F

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/vi20;->a()Ljava/lang/String;

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
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getUid()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "33043494"

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserAgent()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/atd0;->e()Ljava/lang/String;

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
    const-string p0, "1001"

    .line 2
    .line 3
    return-object p0
.end method

.method public isNetworkAvailable()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vi20;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
