.class public Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->n(Ll/pn50;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pn50;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;Ll/pn50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView$a;->b:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView$a;->a:Ll/pn50;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView$a;->a:Ll/pn50;

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/pn50;->a(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView$a;->a:Ll/pn50;

    .line 5
    .line 6
    invoke-virtual {p0, p2, p3}, Ll/pn50;->b(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
