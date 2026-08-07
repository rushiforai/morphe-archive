.class public Ll/ynr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xnr;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VList;

.field public d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

.field public e:Landroid/view/View;

.field public f:Ll/tnr;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/znr;->b(Ll/ynr;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/aor;->b(Ll/ynr;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/xnr;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ynr;->b:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 9
    .line 10
    iget v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/ynr;->f:Ll/tnr;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/tnr;->y(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xnr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ynr;->c(Ll/xnr;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ynr;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/ynr;->c:Lv/VList;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/ynr;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    sget v0, Ll/tec0;->z0:I

    .line 11
    .line 12
    iget-object v1, p0, Ll/ynr;->c:Lv/VList;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/ynr;->e:Landroid/view/View;

    .line 20
    .line 21
    return-object p2
.end method

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->V3:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/tnr;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/tnr;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/ynr;->f:Ll/tnr;

    .line 16
    .line 17
    iget-object v0, p0, Ll/ynr;->c:Lv/VList;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/tec0;->W3:I

    .line 26
    .line 27
    iget-object v3, p0, Ll/ynr;->c:Lv/VList;

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ynr;->c:Lv/VList;

    .line 38
    .line 39
    iget-object v1, p0, Ll/ynr;->a:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v1, v2, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ynr;->c:Lv/VList;

    .line 46
    .line 47
    iget-object v1, p0, Ll/ynr;->f:Ll/tnr;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/ynr;->c:Lv/VList;

    .line 53
    .line 54
    iget-object v1, p0, Ll/ynr;->f:Ll/tnr;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/ynr;->e:Landroid/view/View;

    .line 60
    .line 61
    iget-object p0, p0, Ll/ynr;->d:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget v1, Ll/k9c0;->n0:I

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
