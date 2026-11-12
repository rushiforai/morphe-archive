.class public Lcom/opera/android/startup/ContentWrapperLayout;
.super Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public final c:I

.field public d:Lkl0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v1, Lkhh;->i:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/startup/ContentWrapperLayout;->c:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final onFinishInflate()V
    .registers 11

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0309

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const v0, 0x7f0a0b62

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f141184

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lowj;

    new-instance v5, Ljng;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    new-instance v7, Lzr5;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v1, v8}, Lzr5;-><init>(Lcom/opera/android/startup/ContentWrapperLayout;Landroid/widget/TextView;B)V

    const/4 v9, 0x3

    invoke-direct {v5, v9, v6, v7}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v6, "<tos>"

    const-string v7, "</tos>"

    invoke-direct {v4, v6, v7, v5}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    new-instance v5, Lowj;

    new-instance v6, Ljng;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    new-instance v9, Lzr5;

    invoke-direct {v9, p0, v1, v2}, Lzr5;-><init>(Lcom/opera/android/startup/ContentWrapperLayout;Landroid/widget/TextView;B)V

    const/4 v2, 0x2

    invoke-direct {v6, v2, v7, v9}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v2, "<privacy>"

    const-string v7, "</privacy>"

    invoke-direct {v5, v2, v7, v6}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    filled-new-array {v4, v5}, [Lowj;

    move-result-object v2

    invoke-static {v3, v2}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object v2

    invoke-static {v1, v2}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget v1, p0, Lcom/opera/android/startup/ContentWrapperLayout;->c:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    if-ne v1, v0, :cond_85

    :goto_6d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v8, v1, :cond_85

    invoke-virtual {p0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    if-eq v2, v0, :cond_82

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_82
    add-int/lit8 v8, v8, 0x1

    goto :goto_6d

    :cond_85
    return-void
.end method
