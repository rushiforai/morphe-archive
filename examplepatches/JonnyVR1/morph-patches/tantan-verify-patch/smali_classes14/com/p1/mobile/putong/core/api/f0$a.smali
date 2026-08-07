.class public Lcom/p1/mobile/putong/core/api/f0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/f0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/api/f0$a$b;,
        Lcom/p1/mobile/putong/core/api/f0$a$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:[Lcom/p1/mobile/putong/core/api/f0$a$b;

.field public c:Lcom/p1/mobile/putong/core/api/f0$a$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x64

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/api/f0$a;->a:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)Lcom/p1/mobile/putong/core/api/f0$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/api/f0$a;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs b([Lcom/p1/mobile/putong/core/api/f0$a$a;)Lcom/p1/mobile/putong/core/api/f0$a;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/f0$a$a;->a([Lcom/p1/mobile/putong/core/api/f0$a$a;)Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/f0$a;->c:Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public varargs c([Lcom/p1/mobile/putong/core/api/f0$a$b;)Lcom/p1/mobile/putong/core/api/f0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/f0$a;->b:[Lcom/p1/mobile/putong/core/api/f0$a$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lorg/json/JSONObject;
    .locals 6
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
    const-string v1, "candidateCount"

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/core/api/f0$a;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/f0$a;->b:[Lcom/p1/mobile/putong/core/api/f0$a$b;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONArray;

    .line 18
    .line 19
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a;->b:[Lcom/p1/mobile/putong/core/api/f0$a$b;

    .line 23
    .line 24
    array-length v3, v2

    .line 25
    const/4 v4, 0x0

    .line 26
    :goto_0
    if-ge v4, v3, :cond_1

    .line 27
    .line 28
    aget-object v5, v2, v4

    .line 29
    .line 30
    if-eqz v5, :cond_0

    .line 31
    .line 32
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/f0$a$b;->e()Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v2, "orderby"

    .line 43
    .line 44
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/f0$a;->c:Lcom/p1/mobile/putong/core/api/f0$a$a;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    const-string v1, "filter"

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/f0$a$a;->f()Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    :cond_3
    return-object v0
.end method
