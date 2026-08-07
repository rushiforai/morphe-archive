.class public Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;->b:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;->b:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/a2h0;->getItemViewType(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;->b:Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag;->B:Ll/a2h0;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne p1, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/TopicUsersListFrag$a;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method
