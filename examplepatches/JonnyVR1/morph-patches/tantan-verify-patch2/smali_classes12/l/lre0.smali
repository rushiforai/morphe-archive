.class public Ll/lre0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:J

.field public d:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 14
    iput v0, p0, Ll/lre0;->a:I

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/lre0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/lre0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/lre0;->c:J

    .line 9
    .line 10
    iput p5, p0, Ll/lre0;->d:I

    .line 11
    .line 12
    return-void
.end method

.method private static b()Ll/lre0;
    .locals 6

    .line 1
    new-instance v0, Ll/lre0;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v3

    .line 7
    const/16 v5, 0x3c

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    const-string v2, "illegal response"

    .line 11
    .line 12
    invoke-direct/range {v0 .. v5}, Ll/lre0;-><init>(ILjava/lang/String;JI)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static c()Ll/lre0;
    .locals 6

    .line 1
    new-instance v0, Ll/lre0;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v3

    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    const-string v2, "ok"

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Ll/lre0;-><init>(ILjava/lang/String;JI)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static d(Ljava/lang/String;)Ll/lre0;
    .locals 5

    .line 1
    const-string v0, "data"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/lre0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/lre0;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "ec"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iput v2, p0, Ll/lre0;->a:I

    .line 20
    .line 21
    const-string v2, "em"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, p0, Ll/lre0;->b:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "timesec"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    iput-wide v2, p0, Ll/lre0;->c:J

    .line 36
    .line 37
    iget v2, p0, Ll/lre0;->a:I

    .line 38
    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput v0, p0, Ll/lre0;->d:I

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_0
    const/16 v3, 0x258

    .line 46
    .line 47
    const/16 v4, 0x3c

    .line 48
    .line 49
    if-ne v2, v3, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "ct"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    :cond_1
    iput v4, p0, Ll/lre0;->d:I

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_2
    iput v4, p0, Ll/lre0;->d:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    return-object p0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    invoke-static {p0}, Ll/gqw;->u(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/lre0;->b()Ll/lre0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/lre0;->a:I

    .line 2
    .line 3
    const/16 v0, 0x258

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/lre0;->a:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/gqw;->l()Lcom/google/gson/Gson;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
