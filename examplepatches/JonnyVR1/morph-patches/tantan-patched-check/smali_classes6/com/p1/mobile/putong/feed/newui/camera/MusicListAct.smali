.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;
.super Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;",
        "Ll/iam<",
        "Ll/hz10;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/p1/mobile/putong/feed/data/MusicCategory;

.field public i:Lcom/p1/mobile/putong/feed/newui/camera/b;

.field public j:Ll/hz10;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->k2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->h2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->g2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static c2(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/MusicCategory;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_category"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private e2()V
    .locals 1

    .line 1
    new-instance v0, Ll/hz10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hz10;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic h2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->j:Ll/hz10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hz10;->u0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->j:Ll/hz10;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/hz10;->t0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private o2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/jka;->Pb()Ll/jfh;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, p0}, Ll/jfh;->b(Lcom/p1/mobile/android/app/Act;)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    return-object p0
.end method

.method public b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xy10;->b(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d2(Ll/hz10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->j:Ll/hz10;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final synthetic g2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->h:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->category:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/a;->h2(Ljava/lang/String;)Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->S(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 28
    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->M()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->j:Ll/hz10;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/hz10;->u0()V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hz10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->d2(Ll/hz10;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/ty10;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ty10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic k2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "result_selected"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l2(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->S(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->T()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e9

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/k9c0;->a:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "extra_category"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->h:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->e2()V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->j:Ll/hz10;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->h:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ll/hz10;->m0(Lcom/p1/mobile/putong/feed/data/MusicCategory;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public r()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->d:Landroid/widget/TextView;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->h:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->j:Ll/hz10;

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/b;-><init>(Landroid/content/Context;Ll/hz10;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->c:Landroid/widget/ImageView;

    .line 46
    .line 47
    new-instance v1, Ll/uy10;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/uy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 56
    .line 57
    new-instance v1, Ll/vy10;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/vy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->Q(Ll/y20;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->i:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 66
    .line 67
    new-instance v1, Ll/wy10;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/wy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->R(Ll/y20;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;->o2()V

    .line 76
    .line 77
    .line 78
    return-void
.end method
