.class public final Lxkn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Laln;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:Z

.field public final h:Z

.field public final i:Z


# direct methods
.method public constructor <init>(Laln;Ljava/lang/String;IIIZZZ)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lxkn;->a:Ljava/lang/String;

    iput-object p1, p0, Lxkn;->b:Laln;

    iput-object p2, p0, Lxkn;->c:Ljava/lang/String;

    iput p3, p0, Lxkn;->d:I

    iput p4, p0, Lxkn;->e:I

    iput p5, p0, Lxkn;->f:I

    iput-boolean p6, p0, Lxkn;->g:Z

    iput-boolean p7, p0, Lxkn;->h:Z

    iput-boolean p8, p0, Lxkn;->i:Z

    return-void
.end method

.method public static a(Laln;II)Lxkn;
    .registers 13

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0, p2}, Lp37;->a0(FI)I

    move-result v0

    invoke-static {p1, v0}, Lp37;->r(II)I

    move-result v6

    invoke-static {v6}, Lp37;->u0(I)Z

    move-result v0

    xor-int/lit8 v7, v0, 0x1

    invoke-static {p1}, Lp37;->u0(I)Z

    move-result v0

    xor-int/lit8 v8, v0, 0x1

    invoke-static {p2}, Lp37;->u0(I)Z

    move-result v0

    xor-int/lit8 v9, v0, 0x1

    new-instance v1, Lxkn;

    const/4 v3, 0x0

    move-object v2, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v9}, Lxkn;-><init>(Laln;Ljava/lang/String;IIIZZZ)V

    return-object v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_4a

    const-class v2, Lxkn;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_4a

    check-cast p1, Lxkn;

    iget v2, p0, Lxkn;->d:I

    iget v3, p1, Lxkn;->d:I

    if-ne v2, v3, :cond_4a

    iget v2, p0, Lxkn;->e:I

    iget v3, p1, Lxkn;->e:I

    if-ne v2, v3, :cond_4a

    iget v2, p0, Lxkn;->f:I

    iget v3, p1, Lxkn;->f:I

    if-ne v2, v3, :cond_4a

    iget-boolean v2, p0, Lxkn;->g:Z

    iget-boolean v3, p1, Lxkn;->g:Z

    if-ne v2, v3, :cond_4a

    iget-boolean v2, p0, Lxkn;->h:Z

    iget-boolean v3, p1, Lxkn;->h:Z

    if-ne v2, v3, :cond_4a

    iget-boolean v2, p0, Lxkn;->i:Z

    iget-boolean v3, p1, Lxkn;->i:Z

    if-ne v2, v3, :cond_4a

    iget-object v2, p0, Lxkn;->a:Ljava/lang/String;

    iget-object v3, p1, Lxkn;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    iget-object p0, p0, Lxkn;->c:Ljava/lang/String;

    iget-object p1, p1, Lxkn;->c:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4a

    return v0

    :cond_4a
    return v1
.end method

.method public final hashCode()I
    .registers 10

    iget v0, p0, Lxkn;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v0, p0, Lxkn;->e:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v0, p0, Lxkn;->f:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-boolean v0, p0, Lxkn;->g:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iget-boolean v0, p0, Lxkn;->h:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    iget-boolean v0, p0, Lxkn;->i:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    iget-object v1, p0, Lxkn;->a:Ljava/lang/String;

    iget-object v2, p0, Lxkn;->c:Ljava/lang/String;

    filled-new-array/range {v1 .. v8}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
