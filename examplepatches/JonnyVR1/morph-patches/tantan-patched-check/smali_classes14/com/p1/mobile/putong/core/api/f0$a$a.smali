.class public Lcom/p1/mobile/putong/core/api/f0$a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/f0$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:[Lcom/p1/mobile/putong/core/api/f0$a$a;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "basic"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a([Lcom/p1/mobile/putong/core/api/f0$a$a;)Lcom/p1/mobile/putong/core/api/f0$a$a;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/f0$a$a;->c([Lcom/p1/mobile/putong/core/api/f0$a$a;)Lcom/p1/mobile/putong/core/api/f0$a$a;

    move-result-object p0

    return-object p0
.end method

.method public static b()Lcom/p1/mobile/putong/core/api/f0$a$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/f0$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Age"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/f0$a$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method

.method public static varargs c([Lcom/p1/mobile/putong/core/api/f0$a$a;)Lcom/p1/mobile/putong/core/api/f0$a$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/f0$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "and"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/f0$a$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/f0$a$a;->b:[Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 11
    .line 12
    return-object v0
.end method

.method public static d()Lcom/p1/mobile/putong/core/api/f0$a$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/f0$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Distance"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/f0$a$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/f0$a$a;
    .locals 1

    .line 1
    const-string v0, "<="

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->d:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->e:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public f()Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "type"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "and"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->b:[Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    new-instance v1, Lorg/json/JSONArray;

    .line 28
    .line 29
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->b:[Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 33
    .line 34
    array-length v2, p0

    .line 35
    const/4 v3, 0x0

    .line 36
    :goto_0
    if-ge v3, v2, :cond_0

    .line 37
    .line 38
    aget-object v4, p0, v3

    .line 39
    .line 40
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/api/f0$a$a;->f()Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 45
    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-string p0, "exps"

    .line 51
    .line 52
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    :cond_1
    return-object v0

    .line 56
    :cond_2
    const-string v1, "field"

    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->c:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    const-string v1, "op"

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->d:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    const-string v1, "val"

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/f0$a$a;->e:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    return-object v0
.end method
