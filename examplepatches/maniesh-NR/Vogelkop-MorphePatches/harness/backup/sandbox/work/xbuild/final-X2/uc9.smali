.class public final Luc9;
.super Lyrf;
.source "SourceFile"


# instance fields
.field public final f:Lk24;

.field public final g:[Ltc9;


# direct methods
.method public constructor <init>(Lmej;Lk24;[Ltc9;)V
    .registers 6

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f140785

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lyrf;-><init>(Lmej;Ljava/lang/String;Z)V

    iput-object p2, p0, Luc9;->f:Lk24;

    iput-object p3, p0, Luc9;->g:[Ltc9;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 6

    invoke-super {p0, p1}, Lyrf;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Luc9;->g:[Ltc9;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Lyrf;->d(Llrf;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-object p1
.end method

.method public final f(Llrf;)V
    .registers 4

    check-cast p1, Ltc9;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v0, p0, Ldej;->b:Lmej;

    if-eqz p1, :cond_2b

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1e

    const/4 v0, 0x2

    if-eq p1, v0, :cond_14

    const/4 v0, 0x3

    if-eq p1, v0, :cond_14

    return-void

    :cond_14
    iget-object p0, p0, Luc9;->f:Lk24;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Lxih;->u(Landroidx/fragment/app/w;)V

    return-void

    :cond_1e
    new-instance p0, Lcd9;

    invoke-direct {p0}, Lcd9;-><init>()V

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls63;->w0(Landroid/content/Context;)V

    return-void

    :cond_2b
    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lna2;->T(Landroid/content/Context;)V

    return-void
.end method
