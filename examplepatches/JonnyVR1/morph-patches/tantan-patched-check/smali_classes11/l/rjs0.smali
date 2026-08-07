.class public final Ll/rjs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "gads:native:engine_js_url_with_protocol"

    .line 2
    .line 3
    const-string v1, "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/production/native_ads.js"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/rjs0;->a:Ll/kis0;

    .line 10
    .line 11
    const-string v0, "gads:sdk_core_location"

    .line 12
    .line 13
    const-string v1, "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/sdk-core-v40-loader.html"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/rjs0;->b:Ll/kis0;

    .line 20
    .line 21
    const-string v0, "gads:sdk_core_js_location"

    .line 22
    .line 23
    const-string v1, "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/production/sdk-core-v40-impl.js"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/rjs0;->c:Ll/kis0;

    .line 30
    .line 31
    return-void
.end method
