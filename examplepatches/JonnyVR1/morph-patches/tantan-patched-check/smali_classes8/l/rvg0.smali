.class public final Ll/rvg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "debug"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    sput-boolean p0, Ll/nkg0;->a:Z

    .line 13
    .line 14
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 15
    .line 16
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    const-string p0, "{\"ret_code\":-1, \"ret_msg\":\"json serialize fail\"}"

    .line 21
    .line 22
    invoke-virtual {p5, p0}, Ll/gfg0;->failure(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
