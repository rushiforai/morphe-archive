.class public final Ll/ojs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;

.field public static final d:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "gads:separate_url_generation:enabled"

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
    sput-object v0, Ll/ojs0;->a:Ll/kis0;

    .line 9
    .line 10
    const-string v0, "gads:google_ad_request_domains"

    .line 11
    .line 12
    const-string v2, "googleads.g.doubleclick.net;pubads.g.doubleclick.net"

    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/ojs0;->b:Ll/kis0;

    .line 19
    .line 20
    const-string v0, "gads:url_cache:max_size"

    .line 21
    .line 22
    const-wide/16 v2, 0xc8

    .line 23
    .line 24
    invoke-static {v0, v2, v3}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Ll/ojs0;->c:Ll/kis0;

    .line 29
    .line 30
    const-string v0, "gads:use_request_id_as_url_cache_key:enabled"

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Ll/ojs0;->d:Ll/kis0;

    .line 37
    .line 38
    return-void
.end method
