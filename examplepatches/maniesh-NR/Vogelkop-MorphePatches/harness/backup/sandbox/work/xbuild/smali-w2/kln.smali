.class public final Lkln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laln;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lkln;->a:Ljava/lang/String;

    iput-object p3, p0, Lkln;->b:Ljava/lang/String;

    iput p1, p0, Lkln;->c:I

    iput-object p4, p0, Lkln;->d:Ljava/lang/String;

    iput-object p5, p0, Lkln;->e:Ljava/lang/String;

    return-void
.end method

.method public static h(Ljava/lang/String;)Lkln;
    .registers 8

    new-instance v0, Lorb;

    invoke-direct {v0, p0}, Lorb;-><init>(Ljava/lang/String;)V

    new-instance v1, Lkln;

    const-string p0, "id"

    invoke-virtual {v0, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string p0, "image"

    invoke-virtual {v0, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string p0, "color"

    iget-object v2, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string p0, "sort_key"

    const/4 v5, 0x0

    invoke-virtual {v0, p0, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v6, "url"

    invoke-virtual {v0, v6, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object v5, p0

    invoke-direct/range {v1 .. v6}, Lkln;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public final b()Lg7j;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lo2c;)Lxkn;
    .registers 12

    iget v3, p0, Lkln;->c:I

    invoke-static {v3}, Lp37;->u0(I)Z

    move-result p1

    xor-int/lit8 v6, p1, 0x1

    new-instance v0, Lxkn;

    iget-object v2, p0, Lkln;->b:Ljava/lang/String;

    move v4, v3

    move v5, v3

    move v7, v6

    move v8, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lxkn;-><init>(Laln;Ljava/lang/String;IIIZZZ)V

    return-object v0
.end method

.method public final f()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lkln;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final getType()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "id"

    iget-object v2, p0, Lkln;->a:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "image"

    iget-object v2, p0, Lkln;->b:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "color"

    iget v2, p0, Lkln;->c:I

    invoke-virtual {v0, v2, v1}, Lorb;->n(ILjava/lang/String;)V

    iget-object v1, p0, Lkln;->d:Ljava/lang/String;

    if-eqz v1, :cond_23

    const-string v2, "sort_key"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_23
    iget-object p0, p0, Lkln;->e:Ljava/lang/String;

    if-eqz p0, :cond_2c

    const-string v1, "url"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2c
    iget-object p0, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
