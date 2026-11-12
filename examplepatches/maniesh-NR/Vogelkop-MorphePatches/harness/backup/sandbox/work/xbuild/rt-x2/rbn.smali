.class public final Lrbn;
.super Llj;
.source "SourceFile"

# interfaces
.implements Lon9;


# instance fields
.field public final r:Lcom/opera/android/Lazy;

.field public final s:Lcq5;

.field public final t:Lrn9;


# direct methods
.method public constructor <init>(Lcom/opera/android/Lazy;Lcq5;)V
    .registers 5

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    const v1, 0x7f1410e6

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lrbn;->r:Lcom/opera/android/Lazy;

    iput-object p2, p0, Lrbn;->s:Lcq5;

    new-instance p1, Lrn9;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p0, p2}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lrbn;->t:Lrn9;

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 13

    new-instance p1, Lqbn;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lrbn;->r:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljbn;

    new-instance v2, Llrk;

    const/4 v8, 0x0

    const/16 v9, 0x11

    const/4 v3, 0x1

    const-class v5, Lrbn;

    const-string v6, "onItemClicked"

    const-string v7, "onItemClicked(Lcom/opera/android/voiceinput/VoiceInputFragment$Item$LanguageItem;)V"

    move-object v4, p0

    invoke-direct/range {v2 .. v9}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, v4, Lrbn;->s:Lcq5;

    invoke-direct {p1, v0, v1, p0, v2}, Lqbn;-><init>(Landroid/content/Context;Ljbn;Lcq5;Llrk;)V

    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_47

    const-string v0, "highlight_active"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_47

    iget-object p0, v4, Lrbn;->t:Lrn9;

    iget-boolean p1, p1, Lqbn;->c:Z

    invoke-virtual {p0, p2, p1}, Lrn9;->E(Landroidx/recyclerview/widget/RecyclerView;I)V

    :cond_47
    return-void
.end method

.method public final H()Lqe6;
    .registers 1

    iget-object p0, p0, Lltl;->j:Lqe6;

    return-object p0
.end method

.method public final a()Loba;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method
