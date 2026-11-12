.class public final Lux;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lsx;

.field public final b:Lqx;

.field public final c:Lvzk;

.field public d:Lil;

.field public e:Ldl;

.field public f:Li3j;

.field public g:Lw7h;

.field public h:Luwh;

.field public i:Z

.field public j:Z

.field public k:B

.field public l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lvzk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lsx;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lsx;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lux;->a:Lsx;

    new-instance v0, Lqx;

    invoke-direct {v0, p0}, Lqx;-><init>(Lux;)V

    iput-object v0, p0, Lux;->b:Lqx;

    iput-object p1, p0, Lux;->c:Lvzk;

    new-instance v0, Lrx;

    invoke-direct {v0, p0, v1}, Lrx;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lvzk;->h(Ldy;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 7

    iget-boolean v0, p0, Lux;->j:Z

    if-nez v0, :cond_85

    iget-byte v0, p0, Lux;->k:B

    if-nez v0, :cond_85

    iget-object v0, p0, Lux;->d:Lil;

    if-nez v0, :cond_1a

    iget-object v0, p0, Lux;->c:Lvzk;

    iget-object v0, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lcy;

    invoke-virtual {v0}, Lcy;->c()Lml;

    move-result-object v0

    iget-object v0, v0, Lml;->h:Lil;

    iput-object v0, p0, Lux;->d:Lil;

    :cond_1a
    const/4 v1, 0x1

    if-nez v0, :cond_1f

    move v0, v1

    goto :goto_2c

    :cond_1f
    iget-boolean v2, p0, Lux;->i:Z

    if-eqz v2, :cond_26

    iget v0, v0, Lil;->d:I

    goto :goto_28

    :cond_26
    iget v0, v0, Lil;->c:I

    :goto_28
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_2c
    if-ge p1, v0, :cond_85

    iget-object p1, p0, Lux;->e:Ldl;

    if-eqz p1, :cond_85

    iget-object p1, p0, Lux;->g:Lw7h;

    if-eqz p1, :cond_85

    iget-object p1, p0, Lux;->h:Luwh;

    if-eqz p1, :cond_85

    invoke-virtual {p1}, Luwh;->b()Z

    move-result p1

    if-nez p1, :cond_6c

    const/4 p1, 0x2

    iput-byte p1, p0, Lux;->k:B

    iget-object p1, p0, Lux;->h:Luwh;

    iget-object v0, p1, Luwh;->k:Lh7f;

    iget-object p0, p0, Lux;->b:Lqx;

    invoke-virtual {v0, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Luwh;->b()Z

    move-result p1

    if-eqz p1, :cond_85

    iget-object p0, p0, Lqx;->a:Lux;

    iget-object p1, p0, Lux;->h:Luwh;

    iget-object v0, p0, Lux;->b:Lqx;

    iget-object p1, p1, Luwh;->k:Lh7f;

    invoke-virtual {p1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iput-byte p1, p0, Lux;->k:B

    iget-object p1, p0, Lux;->f:Li3j;

    if-eqz p1, :cond_85

    invoke-virtual {p1}, Li3j;->z()I

    move-result p1

    invoke-virtual {p0, p1}, Lux;->a(I)V

    return-void

    :cond_6c
    iput-byte v1, p0, Lux;->k:B

    iget-object p1, p0, Lux;->g:Lw7h;

    iget-object v0, p0, Lux;->e:Ldl;

    invoke-virtual {p1, v0}, Lw7h;->a(Ldl;)Lbz;

    move-result-object p1

    iget-object v0, p0, Lux;->e:Ldl;

    new-instance v2, Lm43;

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v4, 0x0

    invoke-direct {v2, v0, v4, v1, v3}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    iget-object p0, p0, Lux;->a:Lsx;

    invoke-interface {p1, p0, v2}, Lbz;->e(Lzy;Laz;)V

    :cond_85
    return-void
.end method

.method public final b(Ldl;Z)V
    .registers 5

    instance-of v0, p1, Lhl;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    instance-of v0, p1, Lkl;

    if-eqz v0, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Lux;->g:Lw7h;

    iget-object v1, p1, Ldl;->c:Ljava/lang/String;

    iget-object v0, v0, Lw7h;->r:Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Lux;->e:Ldl;

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    iput-object p1, p0, Lux;->e:Ldl;

    if-nez v0, :cond_23

    if-eqz p2, :cond_2e

    :cond_23
    iget-object p1, p0, Lux;->f:Li3j;

    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Li3j;->z()I

    move-result p1

    invoke-virtual {p0, p1}, Lux;->a(I)V

    :cond_2e
    return-void
.end method
