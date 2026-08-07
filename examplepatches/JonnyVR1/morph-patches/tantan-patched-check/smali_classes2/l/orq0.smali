.class Ll/orq0;
.super Ll/bwq0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Ll/bwq0;-><init>(Lcom/apm/lite/CrashType;Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ll/gsq0;)Ll/gsq0;
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/bwq0;->b(Ll/gsq0;)Ll/gsq0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Ll/hwq0;->a(Landroid/content/Context;)Ll/hwq0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/hwq0;->c(Ll/hwq0;)Ll/hwq0;

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/hwq0;->h(Ll/hwq0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ll/hwq0;->m()Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/hwq0;->o()Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/hwq0;->q()Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/gsq0;->h(Ll/hwq0;)Ll/gsq0;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 30
    .line 31
    invoke-static {v1}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "process_name"

    .line 36
    .line 37
    invoke-virtual {p1, v2, v1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 41
    .line 42
    invoke-static {p1, v0, p0}, Ll/x5r0;->a(Ll/gsq0;Ll/hwq0;Lcom/apm/lite/CrashType;)V

    .line 43
    .line 44
    .line 45
    return-object p1
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
