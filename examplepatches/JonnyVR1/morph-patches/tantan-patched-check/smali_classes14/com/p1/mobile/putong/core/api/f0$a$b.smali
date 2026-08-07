.class public Lcom/p1/mobile/putong/core/api/f0$a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/f0$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/f0$a$b;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static c()Lcom/p1/mobile/putong/core/api/f0$a$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/f0$a$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/f0$a$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Distance"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/f0$a$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method

.method public static d()Lcom/p1/mobile/putong/core/api/f0$a$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/f0$a$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/f0$a$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "LikedTime"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/f0$a$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/api/f0$a$b;
    .locals 1

    .line 1
    const-string v0, "asc"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/f0$a$b;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/core/api/f0$a$b;
    .locals 1

    .line 1
    const-string v0, "desc"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/f0$a$b;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public e()Lorg/json/JSONObject;
    .locals 3
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a$b;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "field"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/f0$a$b;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "modifier"

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/f0$a$b;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
