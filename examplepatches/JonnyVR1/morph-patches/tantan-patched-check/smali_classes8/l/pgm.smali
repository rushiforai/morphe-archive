.class public Ll/pgm;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/Media;",
        ">;"
    }
.end annotation


# instance fields
.field public c:I

.field public d:Lcom/p1/mobile/putong/app/PutongAct;

.field public e:I

.field public f:Z

.field public g:Ll/uyh0;

.field public h:Z

.field public i:Z

.field public j:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IZLcom/p1/mobile/putong/app/PutongAct;IZLl/uyh0;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/pgm;->j:Ll/vg60;

    .line 9
    .line 10
    iput p1, p0, Ll/pgm;->c:I

    .line 11
    .line 12
    iput-boolean p2, p0, Ll/pgm;->i:Z

    .line 13
    .line 14
    iput-object p3, p0, Ll/pgm;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    iput p4, p0, Ll/pgm;->e:I

    .line 17
    .line 18
    iput-boolean p5, p0, Ll/pgm;->f:Z

    .line 19
    .line 20
    iput-object p6, p0, Ll/pgm;->g:Ll/uyh0;

    .line 21
    .line 22
    iput-boolean p7, p0, Ll/pgm;->h:Z

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic E(Ll/pgm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pgm;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G(Ll/pgm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pgm;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pgm;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/pgm;->i:Z

    .line 4
    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p1, p0}, Ll/l7y;->i(Lcom/p1/mobile/android/app/Act;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/pgm;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "signup_source"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "e_signup_shoot"

    .line 26
    .line 27
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Ll/pgm;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    const-string v0, "from_sign_up"

    .line 37
    .line 38
    const/16 v1, 0x125

    .line 39
    .line 40
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->startInnerCameraForResult(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pgm;->H(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/pgm;->f:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/pgm;->j:Ll/vg60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    add-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    :cond_0
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Ll/pgm;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    sget v1, Ll/kec0;->Zd:I

    .line 11
    .line 12
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/ngm;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/ngm;-><init>(Ll/pgm;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    iget-object v1, p0, Ll/pgm;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    if-ne p2, v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    sget v1, Ll/kec0;->w7:I

    .line 35
    .line 36
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Ll/ogm;

    .line 41
    .line 42
    invoke-direct {p2, p0}, Ll/ogm;-><init>(Ll/pgm;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-object p1

    .line 49
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget p2, Ll/kec0;->ae:I

    .line 54
    .line 55
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_1

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaItemView;

    .line 5
    .line 6
    iget p0, p0, Ll/pgm;->e:I

    .line 7
    .line 8
    if-le p0, p4, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p4, 0x0

    .line 12
    :goto_0
    invoke-virtual {p1, p2, p4}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaItemView;->f(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/pgm;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/pgm;->j:Ll/vg60;

    .line 10
    .line 11
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    :cond_1
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    return-object p0
.end method

.method public L(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pgm;->j:Ll/vg60;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/pgm;->c:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/pgm;->j:Ll/vg60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/vg60;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/pgm;->j:Ll/vg60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, -0x3

    .line 24
    .line 25
    if-ge p1, v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x5

    .line 28
    if-le p1, v0, :cond_0

    .line 29
    .line 30
    sget-object p1, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 31
    .line 32
    iget-object p0, p0, Ll/pgm;->g:Ll/uyh0;

    .line 33
    .line 34
    iget-object p0, p0, Ll/uyh0;->c:Ll/ewi;

    .line 35
    .line 36
    iget-object p0, p0, Ll/ewi;->b:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->y(Ljava/lang/String;Z)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p1, Ll/uxj0;->b:Ll/y20;

    .line 44
    .line 45
    new-instance v0, Ll/mgm;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/mgm;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pgm;->I(I)Lcom/p1/mobile/putong/data/Media;

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
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/pgm;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/pgm;->h:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0
.end method
