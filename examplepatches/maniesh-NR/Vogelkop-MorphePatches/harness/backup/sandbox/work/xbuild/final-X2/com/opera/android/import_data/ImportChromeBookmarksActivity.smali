.class public final Lcom/opera/android/import_data/ImportChromeBookmarksActivity;
.super Ll2b;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/opera/android/import_data/ImportChromeBookmarksActivity;",
        "Ll2b;",
        "<init>",
        "()V",
        "qq6",
        "o0g",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic b0:I


# instance fields
.field public a0:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ll2b;-><init>()V

    return-void
.end method


# virtual methods
.method public final C0(Ljava/io/File;)V
    .registers 5

    sget-object v0, Lvml;->d:Lumi;

    new-instance v1, Lzr9;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p1, v2}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final D0()V
    .registers 3

    invoke-super {p0}, Ll2b;->D0()V

    iget-object p0, p0, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_23

    iget-object v0, p0, Lj3b;->b:Lor2;

    const v1, 0x7f040551

    invoke-virtual {p0, v1}, Lj3b;->a(I)V

    iget-object p0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    const v1, 0x7f140868

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    const v0, 0x7f140879

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_23
    return-void
.end method

.method public final E0(I)V
    .registers 3

    invoke-super {p0, p1}, Ll2b;->E0(I)V

    sget-object v0, Lnl3;->b:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lulp;->C(I)Lnl3;

    invoke-virtual {p0}, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->S0()V

    invoke-virtual {p0, p1}, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->R0(I)V

    return-void
.end method

.method public final J0()V
    .registers 2

    const v0, 0x7f140862

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final K0()V
    .registers 2

    invoke-virtual {p0}, Ll2b;->M0()V

    iget-object v0, p0, Ll2b;->N:Lj3b;

    if-eqz v0, :cond_10

    iget-object v0, v0, Lj3b;->b:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    :cond_10
    sget-object v0, Lnl3;->c:Lnl3;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->S0()V

    iget v0, v0, Lnl3;->a:I

    invoke-virtual {p0, v0}, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->R0(I)V

    return-void
.end method

.method public final P0()V
    .registers 2

    invoke-super {p0}, Ll2b;->P0()V

    iget-boolean v0, p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->a0:Z

    if-nez v0, :cond_14

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->a0:Z

    iget-object p0, p0, Ll2b;->U:Lx5f;

    if-nez p0, :cond_f

    const/4 p0, 0x0

    :cond_f
    sget-object v0, Lz80;->f:Lz80;

    invoke-virtual {p0, v0}, Lx5f;->X(Lz80;)V

    :cond_14
    return-void
.end method

.method public final R0(I)V
    .registers 6

    iget-object v0, p0, Ll2b;->U:Lx5f;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    sget-object v2, Lz80;->i:Lz80;

    invoke-virtual {v0, v2}, Lx5f;->X(Lz80;)V

    iget-object v0, p0, Ll2b;->U:Lx5f;

    if-nez v0, :cond_10

    move-object v0, v1

    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "reason: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x7

    invoke-virtual {v0, v3, v2}, Lx5f;->R(ILjava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-eqz p1, :cond_35

    move-object v1, p1

    :cond_35
    sget-object p1, Lw2b;->b:Lhv5;

    iget-object p0, p0, Ll2b;->Y:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhv5;->I(Ljava/lang/String;)Lw2b;

    move-result-object p0

    sget-object p1, Lc3b;->c:Lc3b;

    sget-object v0, Lv2b;->b:Lv2b;

    sget-object v2, Leb0;->c:Leb0;

    invoke-virtual {v1, p0, p1, v0, v2}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    return-void
.end method

.method public final S0()V
    .registers 9

    invoke-static {p0}, Ljoh;->p(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    new-instance v0, Lz2b;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lz2b;-><init>(Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_1c
    new-instance v2, Lk3b;

    const-wide/16 v4, 0x0

    const/4 v7, 0x2

    const/4 v3, 0x2

    const-string v6, ""

    invoke-direct/range {v2 .. v7}, Lk3b;-><init>(IJLjava/lang/String;I)V

    invoke-static {v2}, Lac8;->b(Ljava/lang/Object;)V

    return-void
.end method

.method public final l0(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f080522

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-static {p0, p1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-object p0
.end method

.method public final o0(Lorg/chromium/content_public/browser/NavigationController;)Z
    .registers 5

    iget-boolean v0, p0, Ll2b;->O:Z

    if-eqz v0, :cond_1f

    iget-object p1, p0, Ldx3;->o:Lqim;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lqim;->c:Lz77;

    new-instance v0, Lmv;

    new-instance v1, Li2b;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Li2b;-><init>(Lcom/opera/android/import_data/ImportChromeBookmarksActivity;B)V

    invoke-direct {v0, v1}, Lmv;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    return v2

    :cond_1f
    invoke-super {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->o0(Lorg/chromium/content_public/browser/NavigationController;)Z

    move-result p0

    return p0
.end method

.method public final onSupportNavigateUp()Z
    .registers 6

    iget-boolean v0, p0, Ll2b;->O:Z

    const/4 v1, 0x1

    if-nez v0, :cond_d

    iget-boolean v0, p0, Ll2b;->P:Z

    if-nez v0, :cond_d

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return v1

    :cond_d
    iget-object v0, p0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->c:Lz77;

    new-instance v2, Lmv;

    new-instance v3, Li2b;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Li2b;-><init>(Lcom/opera/android/import_data/ImportChromeBookmarksActivity;B)V

    invoke-direct {v2, v3}, Lmv;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return v1
.end method
