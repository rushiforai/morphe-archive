.class public final Lrse;
.super Lxjk;
.source "SourceFile"


# instance fields
.field public final r:Lzyk;

.field public final s:Lua7;

.field public t:Lev5;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    invoke-direct {p0}, Lxjk;-><init>()V

    new-instance v0, Lt2;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lrse;->r:Lzyk;

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lrse;->s:Lua7;

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 8

    iget-object v0, p0, Lrse;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsse;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lrse;->s:Lua7;

    invoke-virtual {v2}, Lua7;->p()Ln37;

    move-result-object v3

    check-cast v3, Lqse;

    iget-object v3, v3, Lqse;->b:Ljava/lang/String;

    invoke-virtual {v2}, Lua7;->p()Ln37;

    move-result-object v2

    check-cast v2, Lqse;

    iget-object v2, v2, Lqse;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lpad;

    invoke-direct {v4, v0, v1, v3, v2}, Lpad;-><init>(Lsse;Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V

    iput-object v4, v0, Lsse;->b:Lpad;

    new-instance v0, Lev5;

    invoke-direct {v0, p0}, Lev5;-><init>(Lrse;)V

    iput-object v0, p0, Lrse;->t:Lev5;

    invoke-super {p0, p1, p2}, Lxjk;->B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V

    return-void
.end method

.method public final G0()Lev5;
    .registers 1

    iget-object p0, p0, Lrse;->t:Lev5;

    if-eqz p0, :cond_5

    return-object p0

    :cond_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public final H0()Lsse;
    .registers 1

    iget-object p0, p0, Lrse;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsse;

    return-object p0
.end method
