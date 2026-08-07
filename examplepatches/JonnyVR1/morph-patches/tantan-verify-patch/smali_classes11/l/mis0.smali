.class public final Ll/mis0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;

.field public static final d:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "gads:afs:csa_send_tcf_data"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/mis0;->a:Ll/kis0;

    .line 9
    .line 10
    const-string v0, "gads:afs:csa_tcf_data_to_collect"

    .line 11
    .line 12
    const-string v1, "[{\"bk\":\"tcString\",\"sk\":\"IABTCF_TCString\",\"type\":0},{\"bk\":\"gdprApplies\",\"sk\":\"IABTCF_gdprApplies\",\"type\":1},{\"bk\":\"usPrivacy\",\"sk\":\"IABUSPrivacy_String\",\"type\":0}]"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/mis0;->b:Ll/kis0;

    .line 19
    .line 20
    const-string v0, "gads:afs:csa_webview_custom_domain_param_key"

    .line 21
    .line 22
    const-string v1, "csa_customDomain"

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Ll/mis0;->c:Ll/kis0;

    .line 29
    .line 30
    const-string v0, "gads:afs:csa_webview_static_file_path"

    .line 31
    .line 32
    const-string v1, "/afs/ads/i/webview.html"

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Ll/mis0;->d:Ll/kis0;

    .line 39
    .line 40
    return-void
.end method
