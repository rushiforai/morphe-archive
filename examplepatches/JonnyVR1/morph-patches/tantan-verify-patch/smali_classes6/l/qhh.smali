.class public Ll/qhh;
.super Ll/pej0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qhh$c;
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/ViewersBox;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/l4g0;

.field public final k:I

.field public l:Lv/VImage;

.field public m:Lv/VRecyclerView;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lv/VText;

.field public p:Z

.field public q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Z

.field public u:Z

.field public v:Ljava/lang/String;

.field public w:Ll/qhh$c;

.field public x:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

.field public final y:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/ViewersBox;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v1, v0, [Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 6
    .line 7
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Ll/qhh;->i:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->w0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    mul-int/lit16 v1, v1, 0x262

    .line 18
    .line 19
    div-int/lit16 v1, v1, 0x32c

    .line 20
    .line 21
    iput v1, p0, Ll/qhh;->k:I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-object v1, p0, Ll/qhh;->r:Ljava/lang/String;

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 27
    .line 28
    iput-object v1, p0, Ll/qhh;->v:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v0, Ll/qhh$a;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/qhh$a;-><init>(Ll/qhh;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/qhh;->x:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 36
    .line 37
    new-instance v0, Ll/qhh$b;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/qhh$b;-><init>(Ll/qhh;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/qhh;->y:Ll/h80;

    .line 43
    .line 44
    invoke-direct {p0, p1}, Ll/qhh;->N(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2, p3, p4, p5}, Ll/qhh;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic A(Ll/qhh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qhh;->T()V

    return-void
.end method

.method public static synthetic C(Ll/qhh;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qhh;->V(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic D(Ll/qhh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qhh;->S(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic E(Ll/qhh;)Ll/h80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qhh;->y:Ll/h80;

    return-object p0
.end method

.method public static bridge synthetic F(Ll/qhh;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qhh;->v:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic G(Ll/qhh;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qhh;->p:Z

    return p0
.end method

.method public static bridge synthetic H(Ll/qhh;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qhh;->u:Z

    return p0
.end method

.method public static bridge synthetic I(Ll/qhh;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qhh;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method public static bridge synthetic J(Ll/qhh;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qhh;->r:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic K(Ll/qhh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qhh;->M()V

    return-void
.end method

.method private M()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/qhh;->h:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p0, Ll/qhh;->h:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p0, Ll/qhh;->r:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v0, v2, v3}, Ll/jka;->h8(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/khh;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/khh;-><init>(Ll/qhh;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/lhh;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/lhh;-><init>(Ll/qhh;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 58
    iput-object v0, p0, Ll/qhh;->r:Ljava/lang/String;

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 62
    .line 63
    return-void
.end method

.method private N(Lcom/p1/mobile/android/app/Act;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qhh;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ck()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Ll/qhh;->p:Z

    .line 12
    .line 13
    const-class v0, Ll/qhh;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "p_moment_visitor_popup"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/qhh;->j:Ll/l4g0;

    .line 26
    .line 27
    sget v0, Ll/tec0;->x1:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/qhh;->i:Ljava/util/List;

    .line 38
    .line 39
    sget v0, Ll/hdc0;->w:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VImage;

    .line 46
    .line 47
    iput-object v0, p0, Ll/qhh;->l:Lv/VImage;

    .line 48
    .line 49
    sget v0, Ll/hdc0;->x1:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VRecyclerView;

    .line 56
    .line 57
    iput-object v0, p0, Ll/qhh;->m:Lv/VRecyclerView;

    .line 58
    .line 59
    sget v0, Ll/hdc0;->i:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/widget/FrameLayout;

    .line 66
    .line 67
    iput-object v0, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    sget v0, Ll/hdc0;->o:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VText;

    .line 76
    .line 77
    iput-object v0, p0, Ll/qhh;->o:Lv/VText;

    .line 78
    .line 79
    iget-object v0, p0, Ll/qhh;->w:Ll/qhh$c;

    .line 80
    .line 81
    if-nez v0, :cond_0

    .line 82
    .line 83
    new-instance v0, Ll/qhh$c;

    .line 84
    .line 85
    invoke-direct {v0, p0, p1}, Ll/qhh$c;-><init>(Ll/qhh;Lcom/p1/mobile/android/app/Act;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Ll/qhh;->w:Ll/qhh$c;

    .line 89
    .line 90
    :cond_0
    iget-object v0, p0, Ll/qhh;->m:Lv/VRecyclerView;

    .line 91
    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 95
    .line 96
    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    const/4 v1, 0x1

    .line 100
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/qhh;->m:Lv/VRecyclerView;

    .line 104
    .line 105
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/qhh;->m:Lv/VRecyclerView;

    .line 109
    .line 110
    const/4 v1, 0x2

    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/qhh;->m:Lv/VRecyclerView;

    .line 115
    .line 116
    iget-object v1, p0, Ll/qhh;->w:Ll/qhh$c;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    iget-object v0, p0, Ll/qhh;->l:Lv/VImage;

    .line 122
    .line 123
    new-instance v1, Ll/mhh;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/mhh;-><init>(Ll/qhh;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 132
    .line 133
    new-instance v1, Ll/nhh;

    .line 134
    .line 135
    invoke-direct {v1, p0, p1}, Ll/nhh;-><init>(Ll/qhh;Lcom/p1/mobile/android/app/Act;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    new-instance v0, Ll/ohh;

    .line 150
    .line 151
    invoke-direct {v0, p0}, Ll/ohh;-><init>(Ll/qhh;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method private O()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 11
    .line 12
    iget v1, p0, Ll/qhh;->k:I

    .line 13
    .line 14
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 15
    .line 16
    const/16 v1, 0x50

    .line 17
    .line 18
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private P()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qhh;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/qhh;->h:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private synthetic R(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/qhh;->r:Ljava/lang/String;

    .line 3
    .line 4
    return-void
.end method

.method private synthetic T()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qhh;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/qhh;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qhh;->U(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/qhh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhh;->R(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic z(Ll/qhh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qhh;->Q(Ll/pf60;)V

    return-void
.end method


# virtual methods
.method public L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/qhh;->g:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qhh;->h:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/qhh;->s:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/qhh;->t:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ll/qhh;->M()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Q(Ll/pf60;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/qhh;->r:Ljava/lang/String;

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-boolean v2, p0, Ll/qhh;->p:Z

    .line 24
    .line 25
    const-string v3, "\u53ea\u5c55\u793a\u90e8\u5206\u6d4f\u89c8\u8005\n\uff08\u505c\u7559\u65f6\u95f4\u8fc7\u77ed\u4e0d\u4f1a\u5c55\u793a\uff09"

    .line 26
    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Ll/qhh;->v:Ljava/lang/String;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v4, 0x1

    .line 42
    const/16 v5, 0xa

    .line 43
    .line 44
    if-ge v2, v5, :cond_4

    .line 45
    .line 46
    iget-boolean v2, p0, Ll/qhh;->t:Z

    .line 47
    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    const-string v2, ""

    .line 51
    .line 52
    iput-object v2, p0, Ll/qhh;->v:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v2, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    iput-object v3, p0, Ll/qhh;->v:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v2, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    iget-object v2, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-nez v2, :cond_5

    .line 75
    .line 76
    const-string v2, "e_visitor_unlock"

    .line 77
    .line 78
    const-string v3, "p_moment_visitor_popup"

    .line 79
    .line 80
    invoke-static {v2, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    iget-object v2, p0, Ll/qhh;->n:Landroid/widget/FrameLayout;

    .line 84
    .line 85
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    const-string v2, "\u53ea\u5c55\u793a\u90e8\u5206\u6d4f\u89c8\u8005\n\uff08\u5f00\u901a\u9ed1\u91d1\u4f1a\u5458\u4e00\u952e\u89e3\u9501\uff09"

    .line 89
    .line 90
    iput-object v2, p0, Ll/qhh;->v:Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {v1, v0, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    :goto_0
    iget-object v2, p0, Ll/qhh;->i:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    iget-object v3, p0, Ll/qhh;->i:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v3, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Ll/qhh;->w:Ll/qhh$c;

    .line 108
    .line 109
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-virtual {v3, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 117
    .line 118
    if-nez p1, :cond_6

    .line 119
    .line 120
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 121
    .line 122
    return-void

    .line 123
    :cond_6
    check-cast p1, Lcom/p1/mobile/putong/data/Links;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 126
    .line 127
    iput-object p1, p0, Ll/qhh;->r:Ljava/lang/String;

    .line 128
    .line 129
    iput-boolean v0, p0, Ll/qhh;->u:Z

    .line 130
    .line 131
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qhh;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p2, "e_visitor_unlock"

    .line 2
    .line 3
    const-string v0, "p_moment_visitor_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v4, Ll/phh;

    .line 13
    .line 14
    invoke-direct {v4, p0}, Ll/phh;-><init>(Ll/qhh;)V

    .line 15
    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v6, 0x0

    .line 19
    const-string v3, "p_navigation,moment_visitor"

    .line 20
    .line 21
    move-object v2, p1

    .line 22
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qhh;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qhh;->j:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/qhh;->j:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/qhh;->P()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u8868\u6001\u53c2\u6570\u5f02\u5e38"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/qhh;->O()V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/vcc0;->E:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/qhh;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 32
    .line 33
    iget-object v1, p0, Ll/qhh;->f:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/lbc0;->K0:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/qhh;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 49
    .line 50
    const/4 v1, 0x3

    .line 51
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/qhh;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 55
    .line 56
    iget-object v1, p0, Ll/qhh;->x:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/qhh;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/qhh;->q:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 68
    .line 69
    iget v1, p0, Ll/qhh;->k:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/qhh;->j:Ll/l4g0;

    .line 75
    .line 76
    const-string v1, "source_page"

    .line 77
    .line 78
    iget-object v2, p0, Ll/qhh;->g:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v2, "moment_id"

    .line 85
    .line 86
    iget-object v3, p0, Ll/qhh;->h:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/qhh;->j:Ll/l4g0;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Ll/qhh;->j:Ll/l4g0;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 107
    .line 108
    .line 109
    return-void
.end method
