.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-gez p3, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    move p2, v0

    .line 13
    :cond_0
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    if-lez p3, :cond_3

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    move p2, v0

    .line 24
    :cond_2
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Z)V

    .line 25
    .line 26
    .line 27
    :cond_3
    return-void
.end method
