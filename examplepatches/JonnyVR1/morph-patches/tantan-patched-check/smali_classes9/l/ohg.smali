.class public Ll/ohg;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation
.end field

.field public k:Landroid/view/View;

.field public l:Ll/q5m;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ll/ohg$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/ohg$a;-><init>(Ll/ohg;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ohg;->l:Ll/q5m;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic e0(Ll/ohg;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ohg;->k:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public final f0(Ll/y8s;Ll/yhg;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y8s;",
            "Ll/yhg;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->users:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 27
    .line 28
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->followed:Z

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isRecalled:Z

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    new-instance v2, Ll/iig;

    .line 42
    .line 43
    iget-object v3, p0, Ll/ohg;->l:Ll/q5m;

    .line 44
    .line 45
    invoke-direct {v2, p1, v3}, Ll/iig;-><init>(Ll/ner;Ll/q5m;)V

    .line 46
    .line 47
    .line 48
    const/4 v3, 0x1

    .line 49
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->setSelected(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ll/yhg;->a()Ll/cm0;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v2, v1, v3}, Ll/iig;->O(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;Ll/cm0;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget-object p0, p0, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 66
    .line 67
    return-object p0
.end method

.method public g0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/d3q;

    .line 18
    .line 19
    check-cast v1, Ll/iig;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/iig;->K()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public h0()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/d3q;

    .line 23
    .line 24
    check-cast v1, Ll/iig;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/iig;->K()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isSelected()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/iig;->K()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONArray;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public i0(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ohg;->k:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public j0(Ll/y8s;Ll/yhg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ohg;->f0(Ll/y8s;Ll/yhg;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
