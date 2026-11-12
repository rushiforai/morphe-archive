.class public final Lmw7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/io/Serializable;

.field public g:Ljava/io/Serializable;


# direct methods
.method public static a(Lorb;)Lmw7;
    .registers 10

    const-string v0, "type"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_10

    move-object v0, v3

    :cond_10
    const-string v2, "url"

    invoke-virtual {p0, v2, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1d

    move-object v2, v3

    :cond_1d
    const-string v4, "mp4_url"

    invoke-virtual {p0, v4, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2a

    move-object v4, v3

    :cond_2a
    const-string v5, "width"

    invoke-virtual {p0, v5}, Lorb;->g(Ljava/lang/String;)I

    move-result v5

    const-string v6, "height"

    invoke-virtual {p0, v6}, Lorb;->g(Ljava/lang/String;)I

    move-result v6

    const-string v7, "description"

    invoke-virtual {p0, v7, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_43

    move-object v7, v3

    :cond_43
    const-string v8, "thumbnail"

    invoke-virtual {p0, v8, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_50

    move-object v3, p0

    :cond_50
    new-instance p0, Lmw7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmw7;->c:Ljava/lang/Object;

    iput-object v2, p0, Lmw7;->d:Ljava/lang/Object;

    iput-object v4, p0, Lmw7;->e:Ljava/lang/Object;

    iput v5, p0, Lmw7;->a:I

    iput v6, p0, Lmw7;->b:I

    iput-object v7, p0, Lmw7;->f:Ljava/io/Serializable;

    iput-object v3, p0, Lmw7;->g:Ljava/io/Serializable;

    return-object p0
.end method
