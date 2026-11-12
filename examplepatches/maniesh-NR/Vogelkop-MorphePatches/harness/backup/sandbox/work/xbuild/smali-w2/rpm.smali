.class public final Lrpm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lrpm;->a:B

    iput-object p1, p0, Lrpm;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lrpm;->a:B

    iget-object p0, p0, Lrpm;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_74

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast p0, Lzg;

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Landroid/util/AttributeSet;

    invoke-static {v0, p0}, Lsgb;->s(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/EdgeEffect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->getColor()I

    move-result v0

    instance-of v1, p1, Landroid/widget/ScrollView;

    if-eqz v1, :cond_24

    move-object v1, p1

    check-cast v1, Landroid/widget/ScrollView;

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->setEdgeEffectColor(I)V

    goto :goto_2e

    :cond_24
    instance-of v1, p1, Landroid/widget/AbsListView;

    if-eqz v1, :cond_2e

    move-object v1, p1

    check-cast v1, Landroid/widget/AbsListView;

    invoke-virtual {v1, v0}, Landroid/widget/AbsListView;->setEdgeEffectColor(I)V

    :cond_2e
    :goto_2e
    instance-of v0, p1, Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_4b

    check-cast p1, Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "mEdgeGlowTop"

    invoke-static {v0, p0}, Lsgb;->s(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/EdgeEffect;

    move-result-object v2

    invoke-static {p1, v2, v1}, Lmzg;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "mEdgeGlowBottom"

    invoke-static {v0, p0}, Lsgb;->s(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/EdgeEffect;

    move-result-object p0

    invoke-static {p1, p0, v1}, Lmzg;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_5a

    :cond_4b
    instance-of p0, p1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p0, :cond_5a

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "invalidateGlows"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1, p0}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5a
    :goto_5a
    return-void

    :pswitch_5b
    check-cast p0, Lcom/opera/android/widget/UrlFieldEditText;

    sget p1, Lcom/opera/android/widget/UrlFieldEditText;->i0:I

    iget-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->B:Ltpm;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p1, Ltpm;->a:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->C:Ltpm;

    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p1, Ltpm;->a:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    nop

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_5b
    .end packed-switch
.end method
