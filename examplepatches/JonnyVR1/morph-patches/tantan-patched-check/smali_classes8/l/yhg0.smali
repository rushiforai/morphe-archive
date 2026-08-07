.class public final Ll/yhg0;
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
    iput-object p1, p0, Ll/yhg0;->a:Ll/wyg0;

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
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p2, "ret_code"

    .line 7
    .line 8
    const/4 p3, 0x0

    .line 9
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    const-string p2, "ret_msg"

    .line 13
    .line 14
    const-string p3, "success"

    .line 15
    .line 16
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    const-string p2, "user_id"

    .line 20
    .line 21
    iget-object p3, p0, Ll/yhg0;->a:Ll/wyg0;

    .line 22
    .line 23
    iget-object p3, p3, Ll/wyg0;->d:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string p2, "room_id"

    .line 29
    .line 30
    iget-object p3, p0, Ll/yhg0;->a:Ll/wyg0;

    .line 31
    .line 32
    iget-object p3, p3, Ll/wyg0;->e:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string p2, "mg_id"

    .line 38
    .line 39
    iget-object p3, p0, Ll/yhg0;->a:Ll/wyg0;

    .line 40
    .line 41
    iget-wide p3, p3, Ll/wyg0;->g:J

    .line 42
    .line 43
    invoke-virtual {p1, p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const-string p2, "mg_id_str"

    .line 47
    .line 48
    iget-object p3, p0, Ll/yhg0;->a:Ll/wyg0;

    .line 49
    .line 50
    iget-wide p3, p3, Ll/wyg0;->g:J

    .line 51
    .line 52
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    const-string p2, "code"

    .line 60
    .line 61
    iget-object p0, p0, Ll/yhg0;->a:Ll/wyg0;

    .line 62
    .line 63
    iget-object p0, p0, Ll/wyg0;->f:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    const-string p0, "app_id"

    .line 69
    .line 70
    sget-object p2, Ll/utg0;->g:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    const-string p0, "platform"

    .line 76
    .line 77
    const/4 p2, 0x2

    .line 78
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    const-string p0, "bundle_id"

    .line 82
    .line 83
    invoke-static {}, Ll/utg0;->d()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string p0, "sud_sdk_trace_id"

    .line 91
    .line 92
    sget-object p2, Ll/utg0;->j:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :catch_0
    const-string p0, "{\"ret_code\":-1, \"ret_msg\":\"json serialize fail\"}"

    .line 106
    .line 107
    invoke-virtual {p5, p0}, Ll/gfg0;->failure(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method
