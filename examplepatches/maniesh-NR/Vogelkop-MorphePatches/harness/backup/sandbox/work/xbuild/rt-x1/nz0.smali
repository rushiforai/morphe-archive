.class public abstract Lnz0;
.super Ld63;
.source "SourceFile"


# instance fields
.field private mClickHandler:Lmz0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final mUseIncognitoAwareTheme:Z

.field private final mUseScrollingAlertDialogAdapter:Z


# direct methods
.method public constructor <init>(ZZ)V
    .registers 3

    invoke-direct {p0}, Ld63;-><init>()V

    iput-boolean p1, p0, Lnz0;->mUseScrollingAlertDialogAdapter:Z

    iput-boolean p2, p0, Lnz0;->mUseIncognitoAwareTheme:Z

    return-void
.end method

.method public static bridge synthetic a(Lnz0;)Lmz0;
    .registers 1

    iget-object p0, p0, Lnz0;->mClickHandler:Lmz0;

    return-object p0
.end method


# virtual methods
.method public final createDialog(Landroid/content/Context;Lb2l;)Lrim;
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lb2l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SupportAlertDialogDetector"
        }
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-virtual {p0, p2}, Lnz0;->isRequestValid(Lb2l;)Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_8

    return-object v0

    :cond_8
    new-instance p2, Laz0;

    invoke-virtual {p0, p1}, Lnz0;->wrapContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lnz0;->getTheme()I

    move-result v1

    invoke-direct {p2, p1, v1}, Laz0;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p0, p2}, Lnz0;->onCreateDialog(Laz0;)V

    invoke-virtual {p2}, Laz0;->create()Lbz0;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnz0;->onDialogCreated(Lbz0;)V

    new-instance p2, Liz0;

    const/4 v1, 0x0

    invoke-direct {p2, p0, p1, v1}, Liz0;-><init>(Ljava/lang/Object;Lzp1;B)V

    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object p2, p1, Lbz0;->g:Lzy0;

    new-instance v2, Ljz0;

    invoke-direct {v2, p0, v1}, Ljz0;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    new-instance v2, Lkz0;

    invoke-direct {v2, p0, p1, v1}, Lkz0;-><init>(Ljava/lang/Object;Landroid/app/Dialog;B)V

    invoke-virtual {p1, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lmz0;

    invoke-direct {v2, p0, p1}, Lmz0;-><init>(Lnz0;Lbz0;)V

    iput-object v2, p0, Lnz0;->mClickHandler:Lmz0;

    invoke-virtual {p0, v1}, Lnz0;->getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1}, Lnz0;->getPositiveButtonIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v4, p0, Lnz0;->mClickHandler:Lmz0;

    const/4 v5, -0x1

    invoke-virtual {p2, v5, v2, v4, v3}, Lzy0;->c(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Lnz0;->getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lnz0;->mClickHandler:Lmz0;

    const/4 v4, -0x2

    invoke-virtual {p2, v4, v2, v3, v0}, Lzy0;->c(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Lnz0;->getNeutralButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lnz0;->mClickHandler:Lmz0;

    const/4 v3, -0x3

    invoke-virtual {p2, v3, v1, v2, v0}, Lzy0;->c(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/graphics/drawable/Drawable;)V

    new-instance p2, Lab;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-boolean p0, p0, Lnz0;->mUseScrollingAlertDialogAdapter:Z

    if-eqz p0, :cond_77

    new-instance p0, Llpi;

    invoke-direct {p0, p1, p2}, Lmx3;-><init>(Lzp1;Lab;)V

    return-object p0

    :cond_77
    new-instance p0, Lmx3;

    invoke-direct {p0, p1, p2}, Lmx3;-><init>(Lzp1;Lab;)V

    return-object p0
.end method

.method public getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getNeutralButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPositiveButtonIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public getTheme()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public isRequestValid(Lb2l;)Z
    .registers 2
    .param p1    # Lb2l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 p0, 0x1

    return p0
.end method

.method public onCreateDialog(Laz0;)V
    .registers 3

    const p0, 0x7f14052d

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    const/4 p0, 0x1

    iget-object v0, p1, Laz0;->a:Lwy0;

    iput-boolean p0, v0, Lwy0;->k:Z

    const p0, 0x7f140388

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void
.end method

.method public onDialogCreated(Lbz0;)V
    .registers 2
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onDialogViewsInflated(Lbz0;)V
    .registers 7
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const v0, 0x7f0a0bc7

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-eqz v1, :cond_4d

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_4d

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_73

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_73

    const v1, 0x7f0a0bab

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_73

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v4, 0x8

    if-ne v1, v4, :cond_73

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_73

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lez v1, :cond_73

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    goto :goto_73

    :cond_4d
    const v0, 0x7f0a0412

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x102000b

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_73

    new-instance v1, Lhz0;

    invoke-direct {v1, v2}, Lhz0;-><init>(B)V

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v4

    if-eqz v4, :cond_70

    invoke-static {v4, v0, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_70
    invoke-virtual {v1, v0}, Lhz0;->a(Landroid/view/View;)V

    :cond_73
    :goto_73
    invoke-virtual {p0}, Lnz0;->useTapStealingProtection()Z

    move-result v0

    if-eqz v0, :cond_ac

    new-instance v0, Lhp2;

    const/16 v1, 0xd

    invoke-direct {v0, v1, v2}, Lhp2;-><init>(BZ)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lhp2;->b:J

    invoke-virtual {p1, v3}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Llz0;

    invoke-direct {v2, p0, p1, v3, v0}, Llz0;-><init>(Lnz0;Lbz0;ILhp2;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v1, -0x2

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Llz0;

    invoke-direct {v3, p0, p1, v1, v0}, Llz0;-><init>(Lnz0;Lbz0;ILhp2;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v1, -0x3

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Llz0;

    invoke-direct {v3, p0, p1, v1, v0}, Llz0;-><init>(Lnz0;Lbz0;ILhp2;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_ac
    return-void
.end method

.method public onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    return-void
.end method

.method public onNegativeButtonClicked(Lbz0;)V
    .registers 2
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onNeutralButtonClicked(Lbz0;)V
    .registers 2
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onPositiveButtonClicked(Lbz0;)V
    .registers 2

    return-void
.end method

.method public onShowDialog(Lbz0;)V
    .registers 2
    .param p1    # Lbz0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public useTapStealingProtection()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public wrapContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-boolean p0, p0, Lnz0;->mUseIncognitoAwareTheme:Z

    if-eqz p0, :cond_d

    new-instance p0, Ls8n;

    const v0, 0x7f040557

    invoke-direct {p0, p1, v0}, Ls8n;-><init>(Landroid/content/Context;I)V

    return-object p0

    :cond_d
    return-object p1
.end method
