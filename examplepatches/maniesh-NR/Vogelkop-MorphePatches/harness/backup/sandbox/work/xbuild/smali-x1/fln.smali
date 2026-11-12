.class public final Lfln;
.super Lhln;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Lg7j;

.field public final e:Lzg;

.field public final f:Lzg;

.field public final g:Z


# direct methods
.method public constructor <init>(Lorb;Ljava/lang/String;ILg7j;Lzg;Lzg;Z)V
    .registers 8

    invoke-direct {p0, p1}, Lhln;-><init>(Lorb;)V

    iput-object p2, p0, Lfln;->b:Ljava/lang/String;

    iput p3, p0, Lfln;->c:I

    iput-object p4, p0, Lfln;->d:Lg7j;

    iput-object p5, p0, Lfln;->e:Lzg;

    iput-object p6, p0, Lfln;->f:Lzg;

    iput-boolean p7, p0, Lfln;->g:Z

    return-void
.end method

.method public static l(Lorb;Lh06;)Lzg;
    .registers 8

    const-string v0, "preview_image_url"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lzg;

    const-string v2, "image_color"

    invoke-virtual {p0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lhln;->k(Ljava/lang/String;)I

    move-result v2

    const-string v3, "image_url"

    invoke-virtual {p0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lg40;

    const/4 v5, 0x4

    invoke-direct {v4, v3, v5}, Lg40;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_28

    const/4 v0, 0x0

    goto :goto_2e

    :cond_28
    new-instance v3, Lg40;

    invoke-direct {v3, v0, v5}, Lg40;-><init>(Ljava/lang/String;B)V

    move-object v0, v3

    :goto_2e
    invoke-static {p0, p1}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object p0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput v2, v1, Lzg;->a:I

    iput-object v4, v1, Lzg;->b:Ljava/lang/Object;

    iput-object v0, v1, Lzg;->c:Ljava/lang/Object;

    iput-object p0, v1, Lzg;->d:Ljava/lang/Object;

    return-object v1
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lfln;->f:Lzg;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lg7j;
    .registers 1

    iget-object p0, p0, Lfln;->d:Lg7j;

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lo2c;)Lxkn;
    .registers 12

    invoke-virtual {p0, p1, p2}, Lhln;->j(Landroid/content/Context;Lo2c;)Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lfln;->f:Lzg;

    goto :goto_b

    :cond_9
    iget-object p1, p0, Lfln;->e:Lzg;

    :goto_b
    iget-boolean p2, p2, Lo2c;->c:Z

    if-eqz p2, :cond_15

    iget-object p2, p1, Lzg;->c:Ljava/lang/Object;

    check-cast p2, Lg40;

    if-nez p2, :cond_19

    :cond_15
    iget-object p2, p1, Lzg;->b:Ljava/lang/Object;

    check-cast p2, Lg40;

    :cond_19
    iget-object v2, p2, Lg40;->b:Ljava/lang/String;

    iget v3, p1, Lzg;->a:I

    invoke-static {v3}, Lp37;->u0(I)Z

    move-result p1

    xor-int/lit8 v6, p1, 0x1

    new-instance v0, Lxkn;

    move v4, v3

    move v5, v3

    move v7, v6

    move v8, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lxkn;-><init>(Laln;Ljava/lang/String;IIIZZZ)V

    return-object v0
.end method

.method public final e()Z
    .registers 1

    iget-boolean p0, p0, Lfln;->g:Z

    return p0
.end method

.method public final f()I
    .registers 1

    iget p0, p0, Lfln;->c:I

    return p0
.end method

.method public final g(Landroid/content/Context;Lo2c;)Lh06;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lhln;->j(Landroid/content/Context;Lo2c;)Z

    move-result p1

    if-eqz p1, :cond_d

    iget-object p0, p0, Lfln;->f:Lzg;

    :goto_8
    iget-object p0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Lh06;

    return-object p0

    :cond_d
    iget-object p0, p0, Lfln;->e:Lzg;

    goto :goto_8
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lfln;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final getType()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method
