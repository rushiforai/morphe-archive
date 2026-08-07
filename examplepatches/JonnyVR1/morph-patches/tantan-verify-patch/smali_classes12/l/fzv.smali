.class public Ll/fzv;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Ll/nqw;

.field b:Ll/nqw;

.field business:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field needRealtime:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field secondLBusiness:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field thirdLBusiness:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/fzv;->needRealtime:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/fzv;->business:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/ayl;)Ll/fzv;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fzv;->a:Ll/nqw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nqw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/nqw;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fzv;->a:Ll/nqw;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/fzv;->a:Ll/nqw;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/nqw;->a(Ll/ayl;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public b(Ll/ayl;)Ll/fzv;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fzv;->b:Ll/nqw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nqw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/nqw;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fzv;->b:Ll/nqw;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/fzv;->b:Ll/nqw;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/nqw;->a(Ll/ayl;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/fzv;->needRealtime:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/gqw;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/fzv;->needRealtime:Z

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-static {}, Ll/gqw;->p()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    :cond_1
    invoke-static {}, Ll/gzv;->e()Ll/gzv;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p0}, Ll/gzv;->d(Ll/fzv;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const-string p0, "commit but mulog disabled"

    .line 30
    .line 31
    invoke-static {p0}, Ll/gqw;->w(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d(Z)Ll/fzv;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fzv;->needRealtime:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/fzv;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fzv;->secondLBusiness:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/fzv;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fzv;->thirdLBusiness:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "business"

    .line 7
    .line 8
    iget-object v2, p0, Ll/fzv;->business:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "secondLBusiness"

    .line 14
    .line 15
    iget-object v2, p0, Ll/fzv;->secondLBusiness:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "thirdLBusiness"

    .line 21
    .line 22
    iget-object v2, p0, Ll/fzv;->thirdLBusiness:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "body"

    .line 28
    .line 29
    iget-object v2, p0, Ll/fzv;->a:Ll/nqw;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/nqw;->d()Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    .line 39
    .line 40
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const-string v1, "extra"

    .line 47
    .line 48
    iget-object p0, p0, Ll/fzv;->b:Ll/nqw;

    .line 49
    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/nqw;->d()Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    new-instance p0, Lorg/json/JSONObject;

    .line 58
    .line 59
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 60
    .line 61
    .line 62
    :goto_1
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    return-object p0

    .line 70
    :catch_0
    move-exception p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 72
    .line 73
    .line 74
    const-string p0, "{}"

    .line 75
    .line 76
    return-object p0
.end method
