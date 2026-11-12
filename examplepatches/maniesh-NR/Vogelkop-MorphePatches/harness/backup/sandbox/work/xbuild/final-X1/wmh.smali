.class public final Lwmh;
.super Lonh;
.source "SourceFile"


# instance fields
.field public final b:Lpt1;

.field public final c:Lgnh;

.field public d:Lc85;


# direct methods
.method public constructor <init>(Lpt1;Lgnh;)V
    .registers 6

    iget-object v0, p1, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lwmh;->b:Lpt1;

    iput-object p2, p0, Lwmh;->c:Lgnh;

    iget-object p2, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v1, Lkkf;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_1f

    invoke-static {v2, p2, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1f
    new-instance p2, Lvmh;

    const/4 v1, 0x0

    invoke-direct {p2, p0, v1}, Lvmh;-><init>(Lwmh;B)V

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lvmh;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lvmh;-><init>(Lwmh;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lpt1;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Lvmh;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lvmh;-><init>(Lwmh;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final V()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lwmh;->d:Lc85;

    if-eqz p0, :cond_7

    iget-object p0, p0, Lc85;->b:Ljava/util/ArrayList;

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    if-nez p0, :cond_c

    sget-object p0, Ll08;->a:Ll08;

    :cond_c
    return-object p0
.end method

.method public final X()V
    .registers 6

    iget-object v0, p0, Lwmh;->d:Lc85;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, v0, Lc85;->a:Lm4l;

    invoke-virtual {v1}, Lm4l;->b()Lk4l;

    move-result-object v1

    iget-object p0, p0, Lwmh;->b:Lpt1;

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Lg8i;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lg8i;-><init>(Landroid/content/Context;)V

    iget-object v3, v1, Lk4l;->a:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v3

    iput v3, v2, Lg8i;->c:I

    iget-object v1, v1, Lk4l;->b:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v1

    iput v1, v2, Lg8i;->f:I

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    iget-object v0, v0, Lc85;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v3, 0x1

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v3, "%d"

    invoke-static {v1, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v1, :cond_58

    const-string v0, "\u2026"

    :cond_58
    iput-object v0, v2, Lg8i;->e:Ljava/lang/String;

    invoke-virtual {v2}, Lg8i;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
