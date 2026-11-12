.class public final Lbt1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/opera/android/custom_views/StylingTextView;

.field public final d:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lbt1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbt1;->b:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lbt1;->c:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p2, p0, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lbt1;->a:B

    iput-object p1, p0, Lbt1;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p3, p0, Lbt1;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lbt1;
    .registers 5

    const v0, 0x7f0d047b

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a0322

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v0, :cond_2a

    const p1, 0x7f0a06c5

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_2a

    new-instance p1, Lbt1;

    check-cast p0, Landroid/widget/LinearLayout;

    const/4 v2, 0x2

    invoke-direct {p1, p0, v0, v1, v2}, Lbt1;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;B)V

    return-object p1

    :cond_2a
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lbt1;->a:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lbt1;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lbt1;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lbt1;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
