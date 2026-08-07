.class public Ll/svj0;
.super Ll/puj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/puj0<",
        "Ll/rvj0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lv/VRelative;

.field public e:Lv/VImage;

.field public f:Lv/VRecyclerView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Ll/iwj0;


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/puj0;-><init>(Lv/VFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    new-instance v0, Ll/iwj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/iwj0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/svj0;->j:Ll/iwj0;

    .line 7
    .line 8
    iget-object v0, p0, Ll/svj0;->f:Lv/VRecyclerView;

    .line 9
    .line 10
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v1, v2, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/svj0;->f:Lv/VRecyclerView;

    .line 24
    .line 25
    new-instance v1, Ll/svj0$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/svj0$a;-><init>(Ll/svj0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/svj0;->f:Lv/VRecyclerView;

    .line 34
    .line 35
    iget-object p0, p0, Ll/svj0;->j:Ll/iwj0;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/svj0;->k(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/svj0;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->l6:I

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/mdc0;->D7:I

    .line 2
    .line 3
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 5
    .line 6
    const-string v0, "questionAnnouncing"

    .line 7
    .line 8
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-nez p3, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object p3, p0, Ll/svj0;->j:Ll/iwj0;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->buildUserList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p3, p1}, Ll/iwj0;->A(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/svj0;->g:Lv/VText;

    .line 25
    .line 26
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->zc:I

    .line 27
    .line 28
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/svj0;->h:Lv/VText;

    .line 32
    .line 33
    const/16 p3, 0x8

    .line 34
    .line 35
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/svj0;->i:Lv/VText;

    .line 39
    .line 40
    if-nez p2, :cond_2

    .line 41
    .line 42
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kc:I

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/svj0;->i:Lv/VText;

    .line 48
    .line 49
    sget p2, Ll/obc0;->N6:I

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/svj0;->i:Lv/VText;

    .line 55
    .line 56
    const/4 p2, 0x1

    .line 57
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/svj0;->i:Lv/VText;

    .line 61
    .line 62
    const p2, -0xe4be8d

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/svj0;->i:Lv/VText;

    .line 69
    .line 70
    new-instance p2, Ll/svj0$b;

    .line 71
    .line 72
    invoke-direct {p2, p0}, Ll/svj0$b;-><init>(Ll/svj0;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tvj0;->a(Ll/svj0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
