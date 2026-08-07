.class public final Ll/eng0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eng0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 0

    .line 1
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "milliseconds"

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iget-object p0, p0, Ll/eng0;->a:Ll/wyg0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/wyg0;->b:Landroid/content/Context;

    .line 15
    .line 16
    const-string p3, "vibrator"

    .line 17
    .line 18
    invoke-virtual {p0, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/os/Vibrator;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 25
    .line 26
    .line 27
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 28
    .line 29
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    const-string p0, "{\"ret_code\":-1, \"ret_msg\":\"json serialize fail\"}"

    .line 34
    .line 35
    invoke-virtual {p5, p0}, Ll/gfg0;->failure(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
