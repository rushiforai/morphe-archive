.class public Lcom/opera/android/theme/ThemeableRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lzg;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lzg;-><init>(Landroid/view/View;Landroid/util/AttributeSet;I)V

    new-instance p2, Lrpm;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Lrpm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-nez p1, :cond_16

    return-void

    :cond_16
    invoke-static {p1, p0, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    const/4 p3, 0x0

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance p1, Lzg;

    invoke-direct {p1, p0, p2, p3}, Lzg;-><init>(Landroid/view/View;Landroid/util/AttributeSet;I)V

    .line 28
    new-instance p2, Lrpm;

    const/4 p3, 0x1

    invoke-direct {p2, p1, p3}, Lrpm;-><init>(Ljava/lang/Object;B)V

    .line 29
    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-nez p1, :cond_16

    return-void

    .line 30
    :cond_16
    invoke-static {p1, p0, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method
