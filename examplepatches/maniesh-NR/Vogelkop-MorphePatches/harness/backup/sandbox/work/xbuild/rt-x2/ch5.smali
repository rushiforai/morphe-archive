.class public final Lch5;
.super Ld4;
.source "SourceFile"


# instance fields
.field public final h:Lt0g;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Ld4;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lch5;->h:Lt0g;

    return-void
.end method


# virtual methods
.method public final a(Lih5;I)V
    .registers 8

    check-cast p1, Lvt9;

    const v0, 0x190bf45a

    invoke-virtual {p1, v0}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {p1, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_11

    const/4 v0, 0x4

    goto :goto_12

    :cond_11
    move v0, v1

    :goto_12
    or-int/2addr v0, p2

    and-int/lit8 v2, v0, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v2, v1, :cond_1b

    move v1, v3

    goto :goto_1c

    :cond_1b
    move v1, v4

    :goto_1c
    and-int/2addr v0, v3

    invoke-virtual {p1, v0, v1}, Lvt9;->N(IZ)Z

    move-result v0

    if-eqz v0, :cond_45

    iget-object v0, p0, Lch5;->h:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function2;

    if-nez v0, :cond_37

    const v0, -0x49d6f281

    invoke-virtual {p1, v0}, Lvt9;->W(I)V

    :goto_33
    invoke-virtual {p1, v4}, Lvt9;->p(Z)V

    goto :goto_48

    :cond_37
    const v1, 0x5e04ac2

    invoke-virtual {p1, v1}, Lvt9;->W(I)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_45
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_48
    invoke-virtual {p1}, Lvt9;->r()Lznh;

    move-result-object p1

    if-eqz p1, :cond_57

    new-instance v0, Lwhf;

    const/16 v1, 0xe

    invoke-direct {v0, p0, p2, v1}, Lwhf;-><init>(Ljava/lang/Object;IB)V

    iput-object v0, p1, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_57
    return-void
.end method

.method public final g()Z
    .registers 1

    iget-boolean p0, p0, Lch5;->i:Z

    return p0
.end method

.method public final getAccessibilityClassName()Ljava/lang/CharSequence;
    .registers 1

    const-class p0, Lch5;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final o(Lkotlin/jvm/functions/Function2;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch5;->i:Z

    iget-object v0, p0, Lch5;->h:Lt0g;

    invoke-virtual {v0, p1}, Lt0g;->setValue(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-nez p1, :cond_f

    return-void

    :cond_f
    invoke-virtual {p0}, Ld4;->d()V

    return-void
.end method
