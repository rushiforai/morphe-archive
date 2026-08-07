.class public Ll/qg00;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/qg00;->c:Ll/vg60;

    .line 9
    .line 10
    iput-object p1, p0, Ll/qg00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qg00;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, -0x4

    .line 10
    .line 11
    if-lt p1, p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->Q2()Lrx/c;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qg00;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qg00;->s(I)Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qg00;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x5

    .line 10
    return p0

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/qg00;->s(I)Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x0

    .line 26
    if-eqz p0, :cond_3

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lez v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    const/4 p0, 0x6

    .line 50
    return p0

    .line 51
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const/4 p1, 0x4

    .line 58
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0

    .line 63
    :cond_3
    :goto_0
    return p1
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/4 p0, 0x7

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qg00;->p(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentActivity;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    iget-object p0, p0, Ll/qg00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;->d:Ll/fh00;

    .line 7
    .line 8
    iget-object p0, p0, Ll/fh00;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v1, Ll/tec0;->i4:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->j(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->g:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    invoke-static {v0, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public p(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentActivity;II)V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x6

    .line 3
    if-le p3, v0, :cond_1

    .line 4
    .line 5
    if-ne p3, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p3, v1, :cond_2

    .line 13
    .line 14
    move p3, v0

    .line 15
    :cond_2
    add-int/2addr p4, v0

    .line 16
    invoke-virtual {p0, p4}, Ll/qg00;->getItemViewType(I)I

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    const/4 v1, 0x5

    .line 21
    if-ne p4, v1, :cond_3

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_3
    const/4 v0, 0x0

    .line 25
    :goto_1
    invoke-virtual {p1, p0, p2, p3, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->q(Ll/dq1;Lcom/p1/mobile/putong/feed/data/MomentActivity;IZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public s(I)Lcom/p1/mobile/putong/feed/data/MomentActivity;
    .locals 2

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qg00;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/qg00;->c:Ll/vg60;

    .line 12
    .line 13
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 20
    .line 21
    return-object p0
.end method

.method public t(Ll/vg60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/qg00;->c:Ll/vg60;

    .line 11
    .line 12
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v2, p0, Ll/qg00;->c:Ll/vg60;

    .line 31
    .line 32
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move v0, v1

    .line 51
    :goto_0
    iput-object p1, p0, Ll/qg00;->c:Ll/vg60;

    .line 52
    .line 53
    iget-object v2, p0, Ll/qg00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;->d:Ll/fh00;

    .line 56
    .line 57
    iget-object v2, v2, Ll/fh00;->b:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 67
    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object p0, p0, Ll/qg00;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;->d:Ll/fh00;

    .line 74
    .line 75
    iget-object p0, p0, Ll/fh00;->c:Lv/VList;

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method
