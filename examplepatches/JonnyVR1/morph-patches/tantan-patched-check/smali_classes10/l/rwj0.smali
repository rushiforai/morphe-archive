.class public Ll/rwj0;
.super Ll/puj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/puj0<",
        "Ll/qwj0;",
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
    iput-object v0, p0, Ll/rwj0;->j:Ll/iwj0;

    .line 7
    .line 8
    iget-object v0, p0, Ll/rwj0;->f:Lv/VRecyclerView;

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
    iget-object v0, p0, Ll/rwj0;->f:Lv/VRecyclerView;

    .line 24
    .line 25
    new-instance v1, Ll/rwj0$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/rwj0$a;-><init>(Ll/rwj0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/rwj0;->f:Lv/VRecyclerView;

    .line 34
    .line 35
    iget-object p0, p0, Ll/rwj0;->j:Ll/iwj0;

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
    invoke-virtual {p0, v0}, Ll/rwj0;->k(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/rwj0;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->t6:I

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
    sget p0, Ll/mdc0;->I7:I

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
    .locals 4
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
    const-string v0, "waiting"

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
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    iget-object v0, p0, Ll/rwj0;->j:Ll/iwj0;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->buildUserList()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/iwj0;->A(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/vwt;->U3()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Ll/rwj0;->h:Lv/VText;

    .line 39
    .line 40
    if-ge p3, v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qc:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pc:I

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

    .line 94
    .line 95
    if-lt p3, v0, :cond_3

    .line 96
    .line 97
    const/4 p3, 0x1

    .line 98
    goto :goto_2

    .line 99
    :cond_3
    const/4 p3, 0x0

    .line 100
    :goto_2
    invoke-virtual {p0, p1, p2, p3}, Ll/rwj0;->l(Ljava/lang/String;IZ)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/swj0;->a(Ll/rwj0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l(Ljava/lang/String;IZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rwj0;->i:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v1, 0x1

    .line 9
    const v2, -0xe4be8d

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    if-ne p2, v0, :cond_1

    .line 14
    .line 15
    iget-object p2, p0, Ll/rwj0;->i:Lv/VText;

    .line 16
    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gc:I

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 25
    .line 26
    sget p2, Ll/obc0;->N6:I

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p1, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/rwj0;->i:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gc:I

    .line 43
    .line 44
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/rwj0;->i:Lv/VText;

    .line 48
    .line 49
    sget p3, Ll/obc0;->N6:I

    .line 50
    .line 51
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Ll/rwj0;->i:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Ll/rwj0;->i:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Ll/rwj0;->i:Lv/VText;

    .line 65
    .line 66
    new-instance p3, Ll/rwj0$b;

    .line 67
    .line 68
    invoke-direct {p3, p0, p1}, Ll/rwj0$b;-><init>(Ll/rwj0;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 76
    .line 77
    if-ne p2, v1, :cond_2

    .line 78
    .line 79
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Rc:I

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {p1, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/rwj0;->i:Lv/VText;

    .line 95
    .line 96
    const/16 p1, -0x135c

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Jc:I

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 108
    .line 109
    sget p2, Ll/obc0;->N6:I

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 125
    .line 126
    new-instance p2, Ll/rwj0$c;

    .line 127
    .line 128
    invoke-direct {p2, p0}, Ll/rwj0$c;-><init>(Ll/rwj0;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method
