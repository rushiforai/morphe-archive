.class public Lcom/p1/mobile/putong/core/ui/vip/likers/a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

.field public e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

.field public final f:Z

.field public g:I

.field public h:I

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->h:I

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->i:Z

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->f:Z

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->O(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->P(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->S(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->R(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->Q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->K(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public A1(Lcom/p1/mobile/putong/data/User;Z)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->M(Lcom/p1/mobile/putong/data/User;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, -0x1

    .line 6
    if-eq p2, v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1, p2, p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public C()I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->i:Z

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 14
    .line 15
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f:Z

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 30
    .line 31
    iget-wide v4, v3, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->b:J

    .line 32
    .line 33
    sub-long v4, v1, v4

    .line 34
    .line 35
    const-wide/16 v6, 0x3e8

    .line 36
    .line 37
    cmp-long v4, v4, v6

    .line 38
    .line 39
    if-lez v4, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->C1(Lcom/p1/mobile/putong/data/Links;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f:Z

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->t:Ljava/lang/Runnable;

    .line 52
    .line 53
    invoke-static {v3}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 63
    .line 64
    iget-object v5, v4, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->t:Ljava/lang/Runnable;

    .line 65
    .line 66
    sub-long/2addr v6, v1

    .line 67
    iget-wide v1, v4, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->b:J

    .line 68
    .line 69
    add-long/2addr v6, v1

    .line 70
    invoke-static {v3, v5, v6, v7}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->L1()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    const/4 v2, 0x1

    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    add-int/2addr v0, v2

    .line 83
    return v0

    .line 84
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    invoke-static {}, Ll/rs9;->h()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_3

    .line 103
    .line 104
    const/4 v1, 0x2

    .line 105
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 106
    .line 107
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->i:Z

    .line 108
    .line 109
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->h:I

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 113
    .line 114
    :goto_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 115
    .line 116
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->h:I

    .line 117
    .line 118
    add-int/2addr v1, p0

    .line 119
    add-int/2addr v0, v1

    .line 120
    :cond_4
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/pec0;->p2:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    const/4 v1, 0x2

    .line 22
    if-ne p2, v1, :cond_1

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xo(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    const/4 v1, 0x3

    .line 44
    if-ne p2, v1, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p2, Ll/pec0;->f0:I

    .line 57
    .line 58
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_2
    const/4 v1, 0x5

    .line 64
    if-ne p2, v1, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget p2, Ll/pec0;->Z:I

    .line 77
    .line 78
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_3
    const/4 v1, 0x4

    .line 84
    if-ne p2, v1, :cond_4

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget p2, Ll/pec0;->a0:I

    .line 97
    .line 98
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_4
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->f:Z

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 106
    .line 107
    if-eqz p2, :cond_5

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    sget p2, Ll/pec0;->e0:I

    .line 118
    .line 119
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :cond_5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    sget p2, Ll/pec0;->q2:I

    .line 133
    .line 134
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0
.end method

.method public K(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V
    .locals 10

    .line 1
    const/4 p4, 0x2

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->h:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 15
    .line 16
    invoke-interface {p2, p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->C9(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p4, 0x1

    .line 21
    if-ne p3, p4, :cond_3

    .line 22
    .line 23
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->f:Z

    .line 24
    .line 25
    if-eqz p3, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;

    .line 28
    .line 29
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 32
    .line 33
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C5(Lcom/p1/mobile/putong/data/User;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_1

    .line 38
    .line 39
    const-string p3, "instant_chat"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string p3, "see"

    .line 43
    .line 44
    :goto_0
    const-string p4, "see_card_source"

    .line 45
    .line 46
    invoke-static {p4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    filled-new-array {p3}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    const-string p4, "e_see_likes_me_card"

    .line 55
    .line 56
    const-string v0, "p_see_who_likes_me_view"

    .line 57
    .line 58
    invoke-static {p4, v0, p3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    new-instance p3, Ll/pjr;

    .line 62
    .line 63
    invoke-direct {p3, p0, p2, p1}, Ll/pjr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;)V

    .line 64
    .line 65
    .line 66
    new-instance p4, Ll/qjr;

    .line 67
    .line 68
    invoke-direct {p4, p0, p2}, Ll/qjr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/rjr;

    .line 72
    .line 73
    invoke-direct {v0, p0, p2}, Ll/rjr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, p2, p3, p4, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->p(Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/x20;Ll/x20;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 80
    .line 81
    iget-wide p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 82
    .line 83
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;->t(Lcom/p1/mobile/putong/data/User;J)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    move-object v0, p1

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->e:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 93
    .line 94
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 95
    .line 96
    new-instance v5, Ll/sjr;

    .line 97
    .line 98
    invoke-direct {v5, p0, p2, v0}, Ll/sjr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->z1()Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    new-instance v8, Ll/tjr;

    .line 114
    .line 115
    invoke-direct {v8, p0, p2}, Ll/tjr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V

    .line 116
    .line 117
    .line 118
    new-instance v9, Ll/ujr;

    .line 119
    .line 120
    invoke-direct {v9, p0, p2}, Ll/ujr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V

    .line 121
    .line 122
    .line 123
    move-object v2, p2

    .line 124
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;->m(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;Lcom/p1/mobile/putong/data/User;JLl/x20;ZLcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;Ll/x20;Ll/x20;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_3
    const/4 p2, 0x5

    .line 129
    if-ne p3, p2, :cond_4

    .line 130
    .line 131
    check-cast p1, Lcom/p1/mobile/putong/core/ui/home/member/likeme/adapter/item/LikeMeUserNoDataItem;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/home/member/likeme/adapter/item/LikeMeUserNoDataItem;->b()V

    .line 134
    .line 135
    .line 136
    sget p0, Ll/qa00;->p:I

    .line 137
    .line 138
    invoke-static {p1, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_4
    const/4 p2, 0x3

    .line 143
    if-ne p3, p2, :cond_5

    .line 144
    .line 145
    check-cast p1, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;

    .line 146
    .line 147
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->B(Lcom/p1/mobile/putong/core/ui/vip/likers/a;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->C()V

    .line 151
    .line 152
    .line 153
    :cond_5
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->L1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 14
    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 39
    .line 40
    sub-int v0, p1, v0

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-lt v0, v2, :cond_2

    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 52
    .line 53
    if-ge p1, v0, :cond_3

    .line 54
    .line 55
    return-object v1

    .line 56
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 57
    .line 58
    sub-int/2addr p1, v0

    .line 59
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    return-object p0
.end method

.method public M(Lcom/p1/mobile/putong/data/User;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->L1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    return v1

    .line 51
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 58
    .line 59
    add-int/2addr p1, p0

    .line 60
    return p1

    .line 61
    :cond_3
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    return p0
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersBigCardItemView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e:Landroid/view/ViewGroup;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C5(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "instant_chat"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "see"

    .line 15
    .line 16
    :goto_0
    const-string v1, "see_card_source"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {v0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "e_see_who_likes_me_like"

    .line 27
    .line 28
    const-string v2, "p_see_who_likes_me_view"

    .line 29
    .line 30
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-virtual {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    const-string v0, "e_see_card_greet"

    .line 2
    .line 3
    const-string v1, "p_see_who_likes_me_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->H1(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e:Landroid/view/ViewGroup;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public T(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public U(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    add-int/lit8 v0, v0, -0x2

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->h:I

    .line 29
    .line 30
    sub-int/2addr v0, v1

    .line 31
    if-lt p1, v0, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->C1(Lcom/p1/mobile/putong/data/Links;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->L(I)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->d:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->L1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x2

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-static {}, Ll/rs9;->h()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v1, 0x1

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    if-ne p1, v1, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x3

    .line 41
    return p0

    .line 42
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->i:Z

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->g:I

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v0, v2

    .line 55
    if-ne p1, v0, :cond_4

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->c:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    const/4 p0, 0x5

    .line 66
    return p0

    .line 67
    :cond_3
    const/4 p0, 0x4

    .line 68
    return p0

    .line 69
    :cond_4
    return v1
.end method
