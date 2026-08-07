.class Ll/s3r0;
.super Ll/bwq0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Ll/bwq0;-><init>(Lcom/apm/lite/CrashType;Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ILl/gsq0;)Ll/gsq0;
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/bwq0;->a(ILl/gsq0;)Ll/gsq0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x5

    .line 14
    if-eq p1, p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/hwq0;->h(Ll/hwq0;)V

    .line 22
    .line 23
    .line 24
    return-object p2

    .line 25
    :cond_1
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/hwq0;->c(Ll/hwq0;)Ll/hwq0;

    .line 30
    .line 31
    .line 32
    :try_start_0
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/hwq0;->s()Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v0, "launch_did"

    .line 41
    .line 42
    iget-object p0, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 43
    .line 44
    invoke-static {p0}, Ll/hrq0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    :catchall_0
    :goto_0
    return-object p2

    .line 52
    :cond_2
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/hwq0;->o()Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/hwq0;->q()Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    return-object p2

    .line 63
    :cond_3
    iget-object p1, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 64
    .line 65
    invoke-static {p1}, Ll/hwq0;->a(Landroid/content/Context;)Ll/hwq0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Ll/hwq0;->m()Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, p1}, Ll/gsq0;->h(Ll/hwq0;)Ll/gsq0;

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 76
    .line 77
    invoke-static {p2, p1, p0}, Ll/x5r0;->a(Ll/gsq0;Ll/hwq0;Lcom/apm/lite/CrashType;)V

    .line 78
    .line 79
    .line 80
    return-object p2
.end method
