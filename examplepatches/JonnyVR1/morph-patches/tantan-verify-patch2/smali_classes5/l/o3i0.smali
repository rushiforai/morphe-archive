.class public Ll/o3i0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/app/PutongFrag;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/List;Z)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o3i0;->c:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/o3i0;->d:Ljava/util/List;

    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    new-instance v0, Ll/h3i0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/h3i0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {p2}, Ll/dkb;->o9()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/m27;->t3()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz p3, :cond_0

    .line 40
    .line 41
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 44
    .line 45
    const-string v0, "quickchatNumber"

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p2, v0}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    :goto_0
    move-object v4, p2

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    sget-object p2, Ll/uxj0;->a:Ll/uxj0;

    .line 58
    .line 59
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    goto :goto_0

    .line 64
    :goto_1
    if-eqz p3, :cond_1

    .line 65
    .line 66
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 69
    .line 70
    const-string v0, "quickchatPeek"

    .line 71
    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p2, v0}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    :goto_2
    move-object v5, p2

    .line 81
    goto :goto_3

    .line 82
    :cond_1
    sget-object p2, Ll/uxj0;->a:Ll/uxj0;

    .line 83
    .line 84
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    goto :goto_2

    .line 89
    :goto_3
    if-eqz p3, :cond_2

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->um()Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    :goto_4
    move-object v6, p2

    .line 104
    goto :goto_5

    .line 105
    :cond_2
    sget-object p2, Ll/uxj0;->a:Ll/uxj0;

    .line 106
    .line 107
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    goto :goto_4

    .line 112
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->um()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    sget-object p2, Ll/uxj0;->a:Ll/uxj0;

    .line 125
    .line 126
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v8

    .line 130
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    new-instance v10, Ll/i3i0;

    .line 135
    .line 136
    invoke-direct {v10}, Ll/i3i0;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static/range {v1 .. v10}, Ll/psd0;->x(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ycj;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-virtual {p0, p1, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    new-instance p2, Ll/j3i0;

    .line 152
    .line 153
    invoke-direct {p2, p0}, Ll/j3i0;-><init>(Ll/o3i0;)V

    .line 154
    .line 155
    .line 156
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public static synthetic E(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Lcom/google/common/base/Optional;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ll/uxj0;Ll/uxj0;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    filled-new-array/range {p0 .. p8}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic F(Ll/o3i0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o3i0;->J(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/data/Counter;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/o3i0;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o3i0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/o3i0;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/o3i0;->c:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/rec0;->l2:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o3i0;->c:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->x(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/core/data/Privilege;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o3i0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/o3i0;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    return-object p0
.end method

.method public final synthetic J(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o3i0;->I(I)Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
