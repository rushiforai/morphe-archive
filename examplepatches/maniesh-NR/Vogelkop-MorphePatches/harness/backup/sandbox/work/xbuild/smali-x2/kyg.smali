.class public final Lkyg;
.super Lan8;
.source "SourceFile"


# instance fields
.field private final b:Lb2l;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lzcj;Lb2l;)V
    .registers 3

    invoke-direct {p0, p1}, Lan8;-><init>(Lzcj;)V

    iput-object p2, p0, Lkyg;->b:Lb2l;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .registers 4

    iget-object v0, p0, Lan8;->a:Lzcj;

    const-string v1, ".print_share"

    invoke-virtual {v0, v1}, Lzcj;->e(Ljava/lang/String;)V

    invoke-static {p1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p1

    if-eqz p1, :cond_12

    iget-object p0, p0, Lkyg;->b:Lb2l;

    invoke-static {p1, p0}, Lhyg;->n(Ldx3;Lb2l;)V

    :cond_12
    return-void
.end method

.method public final b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f0805bc

    invoke-static {p0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f140d4a

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    const-string p0, ".print_share"

    return-object p0
.end method
