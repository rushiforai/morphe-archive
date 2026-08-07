.class Ll/e3r0;
.super Ll/bwq0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

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
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    if-eq p1, p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x5

    .line 14
    if-eq p1, p0, :cond_0

    .line 15
    .line 16
    return-object p2

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
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/hwq0;->c(Ll/hwq0;)Ll/hwq0;

    .line 30
    .line 31
    .line 32
    return-object p2

    .line 33
    :cond_2
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/hwq0;->o()Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/hwq0;->q()Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    return-object p2

    .line 44
    :cond_3
    const-string p1, "app_count"

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p2, p1, v0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    const-string p1, "magic_tag"

    .line 54
    .line 55
    const-string v0, "ss_app_log"

    .line 56
    .line 57
    invoke-virtual {p2, p1, v0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ll/bwq0;->m(Ll/gsq0;)V

    .line 61
    .line 62
    .line 63
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
