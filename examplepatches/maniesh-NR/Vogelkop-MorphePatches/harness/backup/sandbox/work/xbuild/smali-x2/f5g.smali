.class public final Lf5g;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public final a:Li5g;

.field public final b:Li5g;

.field public final c:Lcom/opera/android/custom_views/AnimationEmptyListView;

.field public final d:Lp5g;

.field public e:Lu3g;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Li5g;Li5g;Lu3g;ZZZZLqfb;)V
    .registers 16

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lf5g;->a:Li5g;

    iput-object p3, p0, Lf5g;->b:Li5g;

    sget v0, Lcom/opera/android/custom_views/AnimationEmptyListView;->e:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v0, p4, Lu3g;->b:I

    iget v1, p4, Lu3g;->a:I

    iget v2, p4, Lu3g;->c:I

    new-instance v3, Lcom/opera/android/custom_views/AnimationEmptyListView;

    const/4 v4, 0x0

    const/16 v5, 0xe

    invoke-direct {v3, p1, v4, v5}, Lcom/opera/android/custom_views/AnimationEmptyListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {v3, v0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    invoke-virtual {v3, v1}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    const/4 p1, -0x1

    if-ge v2, p1, :cond_29

    move v2, p1

    :cond_29
    iput v2, v3, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    iput-object v3, p0, Lf5g;->c:Lcom/opera/android/custom_views/AnimationEmptyListView;

    new-instance v0, Lp5g;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lp5g;-><init>(Landroid/content/Context;)V

    iget-object v1, v0, Lp5g;->b:Ljava/lang/Object;

    check-cast v1, Lq5g;

    iput-object v0, p0, Lf5g;->d:Lp5g;

    iput-object p4, p0, Lf5g;->e:Lu3g;

    const/4 p4, 0x1

    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, p1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/16 v2, 0x8

    const/4 v4, 0x0

    if-eqz p5, :cond_58

    move p5, v4

    goto :goto_59

    :cond_58
    move p5, v2

    :goto_59
    invoke-virtual {p2, p5}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p2, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz p6, :cond_67

    move p3, v4

    goto :goto_68

    :cond_67
    move p3, v2

    :goto_68
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-direct {p2, p1, p1, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p7, :cond_7f

    move p0, v4

    goto :goto_80

    :cond_7f
    move p0, v2

    :goto_80
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v1, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    if-eqz p8, :cond_8a

    move v2, v4

    :cond_8a
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    new-instance p0, Le5g;

    invoke-direct {p0, p9, v4}, Le5g;-><init>(Lqfb;B)V

    iget-object p1, v1, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Le5g;

    invoke-direct {p0, p9, p4}, Le5g;-><init>(Lqfb;B)V

    iget-object p1, v1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
