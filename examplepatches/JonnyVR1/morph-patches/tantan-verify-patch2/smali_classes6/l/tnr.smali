.class public Ll/tnr;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public c:I

.field public d:I

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/tnr;->c:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Ll/tnr;->d:I

    .line 9
    .line 10
    new-instance v2, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object v2, p0, Ll/tnr;->e:Ljava/util/List;

    .line 16
    .line 17
    iput-boolean v1, p0, Ll/tnr;->f:Z

    .line 18
    .line 19
    iput-object p1, p0, Ll/tnr;->g:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic p(Ll/tnr;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tnr;->w(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public e(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/tnr;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/tnr;->e:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sub-int/2addr v0, p1

    .line 12
    const/4 p1, 0x4

    .line 13
    if-ge v0, p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 16
    .line 17
    iget-object v0, p0, Ll/tnr;->g:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;->c:Ll/xnr;

    .line 20
    .line 21
    iget-object v1, v0, Ll/xnr;->b:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v0, v0, Ll/xnr;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/feed/api/b;->S3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/rnr;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/rnr;-><init>(Ll/tnr;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/snr;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/snr;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tnr;->f:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/tnr;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    add-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    :cond_0
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tnr;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/tnr;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tnr;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Ll/tnr;->d:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget p0, p0, Ll/tnr;->c:I

    .line 13
    .line 14
    return p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tnr;->t(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget p1, p0, Ll/tnr;->c:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/tnr;->g:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 4
    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, Ll/tec0;->F4:I

    .line 12
    .line 13
    iget-object p0, p0, Ll/tnr;->g:Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;->d:Ll/ynr;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ynr;->c:Lv/VList;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;->d:Ll/ynr;

    .line 26
    .line 27
    iget-object p0, p0, Ll/ynr;->e:Landroid/view/View;

    .line 28
    .line 29
    return-object p0
.end method

.method public t(Landroid/view/View;Ljava/lang/String;II)V
    .locals 1

    .line 1
    iget v0, p0, Ll/tnr;->c:I

    .line 2
    .line 3
    if-ne p3, v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/LikeView;

    .line 6
    .line 7
    iget-object p3, p0, Ll/tnr;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const/4 v0, 0x1

    .line 14
    sub-int/2addr p3, v0

    .line 15
    if-ne p4, p3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-virtual {p1, p0, p2, v0}, Lcom/p1/mobile/putong/feed/ui/moments/LikeView;->e(Ll/dq1;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final synthetic w(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/tnr;->f:Z

    .line 6
    .line 7
    iget-object p1, p0, Ll/tnr;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/tnr;->y(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public y(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tnr;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
