.class Ll/i4r0;
.super Ll/bwq0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/apm/lite/CrashType;->NATIVE:Lcom/apm/lite/CrashType;

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
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bwq0;->a(ILl/gsq0;)Ll/gsq0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    if-eq p1, p0, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    return-object p2

    .line 14
    :cond_0
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/hwq0;->c(Ll/hwq0;)Ll/hwq0;

    .line 19
    .line 20
    .line 21
    return-object p2

    .line 22
    :cond_1
    invoke-virtual {p2}, Ll/gsq0;->H()Ll/hwq0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/hwq0;->o()Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/hwq0;->q()Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    return-object p2

    .line 33
    :cond_2
    iget-object p1, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 34
    .line 35
    invoke-static {p1}, Ll/hwq0;->a(Landroid/content/Context;)Ll/hwq0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/hwq0;->m()Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, p1}, Ll/gsq0;->h(Ll/hwq0;)Ll/gsq0;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 46
    .line 47
    invoke-static {p2, p1, p0}, Ll/x5r0;->a(Ll/gsq0;Ll/hwq0;Lcom/apm/lite/CrashType;)V

    .line 48
    .line 49
    .line 50
    return-object p2
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    invoke-static {}, Ll/juq0;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public n(Ll/gsq0;)V
    .locals 0

    .line 1
    return-void
.end method
