.class public Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final synthetic b:I


# instance fields
.field public final a:Lq5g;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0408

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0322

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_b4

    const v1, 0x7f0a069d

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_b4

    new-instance v1, Lq5g;

    const/16 v4, 0xb

    invoke-direct {v1, p0, v2, v3, v4}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a:Lq5g;

    sget-object v1, Lkhh;->R:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p2, :cond_7e

    if-eqz v1, :cond_5b

    new-instance p1, Lsvk;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_57

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_57
    invoke-virtual {p1, p0}, Lsvk;->a(Landroid/view/View;)V

    goto :goto_a0

    :cond_5b
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0805c0

    invoke-static {p2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    new-instance p2, Lefl;

    const v2, 0x7f0402eb

    const v3, 0x7f060b0b

    invoke-direct {p2, p0, p1, v2, v3}, Lefl;-><init>(Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;Landroid/graphics/drawable/Drawable;II)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_7a

    invoke-static {p1, p0, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_7a
    invoke-virtual {p2, p0}, Lefl;->a(Landroid/view/View;)V

    goto :goto_a0

    :cond_7e
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0805be

    invoke-static {p2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    new-instance p2, Lefl;

    const v2, 0x7f04021f

    const v3, 0x7f060ade

    invoke-direct {p2, p0, p1, v2, v3}, Lefl;-><init>(Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;Landroid/graphics/drawable/Drawable;II)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_9d

    invoke-static {p1, p0, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_9d
    invoke-virtual {p2, p0}, Lefl;->a(Landroid/view/View;)V

    :goto_a0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_b3

    if-eqz v1, :cond_b0

    invoke-static {v0}, Lphj;->y(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    return-void

    :cond_b0
    invoke-virtual {p0, v0}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    :cond_b3
    return-void

    :cond_b4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a(Ljava/lang/CharSequence;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a:Lq5g;

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-static {p0, p1}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    return-void
.end method
