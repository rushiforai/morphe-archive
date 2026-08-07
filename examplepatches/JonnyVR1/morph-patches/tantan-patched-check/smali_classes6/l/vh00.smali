.class public Ll/vh00;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

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
    iput-object v0, p0, Ll/vh00;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vh00;->c:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isEnabled(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vh00;->s(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vh00;->c:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/tec0;->s4:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/vh00;->c:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->d:Ll/jn00;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jn00;->a:Lv/VList;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vh00;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

    .line 3
    .line 4
    iget-object p1, p0, Ll/vh00;->c:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->c:Ll/zm00;

    .line 7
    .line 8
    iget-object v3, p1, Ll/zm00;->c:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v4, p1, Ll/zm00;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/vh00;->p()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 p3, 0x1

    .line 21
    sub-int/2addr p1, p3

    .line 22
    if-ne p4, p1, :cond_0

    .line 23
    .line 24
    :goto_0
    move v5, p3

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 p3, 0x0

    .line 27
    goto :goto_0

    .line 28
    :goto_1
    iget-object p1, p0, Ll/vh00;->c:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->c:Ll/zm00;

    .line 31
    .line 32
    iget-object p1, p1, Ll/zm00;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    move-object v1, p0

    .line 39
    move-object v2, p2

    .line 40
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->w(Ll/pol;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public t(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vh00;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
