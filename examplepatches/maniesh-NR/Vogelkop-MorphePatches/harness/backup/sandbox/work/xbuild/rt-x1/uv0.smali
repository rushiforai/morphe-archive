.class public final Luv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lx5f;

.field public final c:Lx5f;

.field public final d:Lwth;

.field public final e:Let3;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lx5f;Lx5f;Lwth;Let3;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luv0;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Luv0;->b:Lx5f;

    iput-object p3, p0, Luv0;->c:Lx5f;

    iput-object p4, p0, Luv0;->d:Lwth;

    iput-object p5, p0, Luv0;->e:Let3;

    return-void
.end method

.method public static b(Luv0;Ljava/lang/String;ILb2l;ZZLoc2;I)V
    .registers 10

    and-int/lit8 v0, p7, 0x4

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move-object p3, v1

    :cond_6
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_b

    move-object p6, v1

    :cond_b
    const/4 p7, 0x2

    const/4 v0, 0x1

    if-eqz p5, :cond_14

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_12
    move p0, p7

    goto :goto_27

    :cond_14
    iget-object p0, p0, Luv0;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_26

    if-eq p0, v0, :cond_12

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_26
    move p0, v0

    :goto_27
    sget-object p5, Llqm;->y:Llqm;

    const/4 v1, 0x0

    invoke-static {p1, p5, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p1, v0}, Lvx3;->c(Z)V

    iput-boolean p4, p1, Lvx3;->f:Z

    iput p2, p1, Lvx3;->c:I

    iput p0, p1, Lvx3;->d:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p2

    if-eqz p2, :cond_48

    if-eq p2, v0, :cond_45

    if-eq p2, p7, :cond_45

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_45
    sget-object p2, Ln3l;->d:Ln3l;

    goto :goto_4a

    :cond_48
    sget-object p2, Ln3l;->e:Ln3l;

    :goto_4a
    iput-object p2, p1, Lvx3;->e:Ln3l;

    if-eqz p3, :cond_55

    new-instance p2, Ltv0;

    invoke-direct {p2, p3, v1}, Ltv0;-><init>(Lb2l;B)V

    iput-object p2, p1, Lvx3;->k:Lwx3;

    :cond_55
    if-eq p0, v0, :cond_5c

    if-eqz p6, :cond_5c

    invoke-virtual {p6}, Loc2;->invoke()Ljava/lang/Object;

    :cond_5c
    invoke-static {p1}, Lam2;->v(Lvx3;)V

    return-void
.end method


# virtual methods
.method public final a(IILjava/lang/String;Z)V
    .registers 13

    iget-object v0, p0, Luv0;->e:Let3;

    const/4 v1, 0x1

    if-ne p2, v1, :cond_2d

    invoke-virtual {v0}, Let3;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Leri;

    sget-object v2, Leti;->a:Lq6e;

    const/4 v2, 0x0

    if-nez p2, :cond_12

    move v3, v2

    goto :goto_14

    :cond_12
    instance-of v3, p2, Lf1a;

    :goto_14
    xor-int/2addr v3, v1

    invoke-interface {p2}, Leri;->l()Ljava/lang/String;

    move-result-object p2

    new-instance v4, Ln60;

    const/4 v5, -0x1

    const/4 v6, 0x3

    const/16 v7, 0x98b

    invoke-direct {v4, v7, v5, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v4, v2}, Ljf0;->e(I)V

    invoke-virtual {v4, v1, v1, v3}, Ljf0;->r(IIZ)V

    iget-object v1, p0, Luv0;->c:Lx5f;

    invoke-virtual {v1, p2, v4}, Lx5f;->v(Ljava/lang/String;Ln60;)V

    :cond_2d
    invoke-virtual {v0}, Let3;->invoke()Ljava/lang/Object;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Leri;

    const/4 v5, 0x0

    iget-object v0, p0, Luv0;->d:Lwth;

    const/4 v2, 0x3

    move v4, p1

    move-object v1, p3

    move v3, p4

    invoke-virtual/range {v0 .. v6}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    return-void
.end method

.method public final c(Ljava/util/List;ILjava/lang/String;ZLb2l;)V
    .registers 11

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x2

    const/4 v1, 0x1

    if-nez p4, :cond_19

    iget-object p4, p0, Luv0;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p4}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    move-result p4

    if-eqz p4, :cond_1f

    if-ne p4, v1, :cond_1b

    :cond_19
    move p4, v0

    goto :goto_20

    :cond_1b
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1f
    move p4, v1

    :goto_20
    new-instance v2, Lvx3;

    sget-object v3, Llqm;->y:Llqm;

    invoke-direct {v2, v3}, Lvx3;-><init>(Llqm;)V

    new-instance v3, Lux3;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lux3;-><init>(Lvx3;Z)V

    invoke-interface {p1, v3}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    invoke-virtual {v2, v1}, Lvx3;->c(Z)V

    iput-boolean v4, v2, Lvx3;->f:Z

    iput p2, v2, Lvx3;->c:I

    new-instance p2, Ln3l;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-gt p1, v1, :cond_4d

    invoke-static {p4}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_4d

    if-eq p1, v1, :cond_4e

    if-eq p1, v0, :cond_4e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_4d
    move v4, v1

    :cond_4e
    const/16 p1, 0x1f

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {p2, v4, v1, p1}, Ln3l;-><init>(ZZLjava/lang/Integer;)V

    iput-object p2, v2, Lvx3;->e:Ln3l;

    new-instance p1, Lv4l;

    invoke-direct {p1, p3, v1, v1}, Lv4l;-><init>(Ljava/lang/String;ZZ)V

    iput-object p1, v2, Lvx3;->i:Lv4l;

    iput p4, v2, Lvx3;->d:I

    if-eqz p5, :cond_6b

    new-instance p1, Ltv0;

    invoke-direct {p1, p5, v1}, Ltv0;-><init>(Lb2l;B)V

    iput-object p1, v2, Lvx3;->k:Lwx3;

    :cond_6b
    invoke-static {v2}, Lam2;->v(Lvx3;)V

    iget-object p0, p0, Luv0;->b:Lx5f;

    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lx5f;->S(I)V

    return-void
.end method
