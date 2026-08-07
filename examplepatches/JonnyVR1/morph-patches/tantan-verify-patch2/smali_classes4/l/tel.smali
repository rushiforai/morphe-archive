.class public Ll/tel;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/yfl;",
        ">;"
    }
.end annotation


# static fields
.field public static I:Ljava/lang/String; = "suggest_user_profile_info"

.field public static J:Ljava/lang/String; = "home"

.field public static K:Ljava/lang/String; = "click"

.field public static L:Ljava/lang/String; = "swipe"


# instance fields
.field public A:Ljava/lang/Runnable;

.field public B:Z

.field public C:Ljava/lang/String;

.field public D:Ll/g6m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/g6m<",
            "Ll/sfh0$a;",
            "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
            ">;"
        }
    .end annotation
.end field

.field public E:Z

.field public F:I

.field public G:Ll/kcg0;

.field public H:J

.field public a:Ljava/lang/String;

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z

.field public o:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:J

.field public t:Z

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Z

.field public x:Z

.field public y:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/tel;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/tel;->b:I

    .line 10
    .line 11
    iput-object p1, p0, Ll/tel;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/tel;->d:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/tel;->e:Z

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iput-boolean v1, p0, Ll/tel;->f:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/tel;->g:Z

    .line 21
    .line 22
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iput-object v2, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 33
    .line 34
    iput-object v2, p0, Ll/tel;->j:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, p0, Ll/tel;->k:Lrx/subjects/a;

    .line 41
    .line 42
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iput-object v3, p0, Ll/tel;->l:Lrx/subjects/a;

    .line 49
    .line 50
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iput-object v3, p0, Ll/tel;->m:Lrx/subjects/b;

    .line 55
    .line 56
    iput-boolean v0, p0, Ll/tel;->n:Z

    .line 57
    .line 58
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iput-object v3, p0, Ll/tel;->o:Lrx/subjects/a;

    .line 63
    .line 64
    iput-boolean v0, p0, Ll/tel;->p:Z

    .line 65
    .line 66
    iput-boolean v1, p0, Ll/tel;->q:Z

    .line 67
    .line 68
    iput-boolean v1, p0, Ll/tel;->r:Z

    .line 69
    .line 70
    const-wide/16 v3, 0x0

    .line 71
    .line 72
    iput-wide v3, p0, Ll/tel;->s:J

    .line 73
    .line 74
    iput-boolean v0, p0, Ll/tel;->t:Z

    .line 75
    .line 76
    iput-boolean v1, p0, Ll/tel;->w:Z

    .line 77
    .line 78
    invoke-static {v2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, p0, Ll/tel;->y:Lrx/subjects/a;

    .line 83
    .line 84
    new-instance v1, Ll/vcl;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/vcl;-><init>(Ll/tel;)V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Ll/tel;->A:Ljava/lang/Runnable;

    .line 90
    .line 91
    iput-object p1, p0, Ll/tel;->C:Ljava/lang/String;

    .line 92
    .line 93
    iput-boolean v0, p0, Ll/tel;->E:Z

    .line 94
    .line 95
    iput v0, p0, Ll/tel;->F:I

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    iput-object p1, p0, Ll/tel;->G:Ll/kcg0;

    .line 99
    .line 100
    sget-object p1, Ll/ami0;->INSTANCE:Ll/ami0;

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/ami0;->d()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    iput-wide v0, p0, Ll/tel;->H:J

    .line 107
    .line 108
    return-void
.end method

.method public static synthetic A0(Ll/tel;Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tel;->p2(Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private A2(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->o4(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    const-string v0, "profile"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/iel;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/iel;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/jel;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1, p2}, Ll/jel;-><init>(Ll/tel;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/lel;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Ll/lel;-><init>(Ll/tel;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic C0(Ll/tel;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->b2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic D0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tel;->o2()V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/android/app/c;Ll/uxj0;Ljava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method private E1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->i0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/odl;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/odl;-><init>(Ll/tel;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private E2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tel;->z:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/tel;->z:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic F0(Ll/tel;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->R1(Ll/pf60;)V

    return-void
.end method

.method private F1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O2:Ll/wyd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/wcl;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/wcl;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/adl;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/adl;-><init>(Ll/tel;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/tel;->l:Lrx/subjects/a;

    .line 47
    .line 48
    new-instance v2, Ll/st30;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/st30;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/bdl;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/bdl;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/cdl;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/cdl;-><init>(Ll/tel;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 83
    .line 84
    new-instance v1, Ll/tel$a;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/tel$a;-><init>(Ll/tel;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/edl;

    .line 94
    .line 95
    invoke-direct {v1}, Ll/edl;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/fdl;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/fdl;-><init>(Ll/tel;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v1, p0, Ll/tel;->k:Lrx/subjects/a;

    .line 123
    .line 124
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 127
    .line 128
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->E4()Lrx/subjects/a;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    const/4 v3, 0x1

    .line 133
    invoke-virtual {v2, v3}, Lrx/c;->take(I)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    new-instance v4, Ll/gdl;

    .line 138
    .line 139
    invoke-direct {v4}, Ll/gdl;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, v1, v2, v4}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ll/hdl;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/hdl;-><init>(Ll/tel;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 160
    .line 161
    .line 162
    invoke-static {}, Ll/h7d0;->m0()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_0

    .line 167
    .line 168
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G0:Ll/s07;

    .line 171
    .line 172
    invoke-virtual {v0}, Ll/s07;->n3()Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0, v3}, Lrx/c;->take(I)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v1, Ll/idl;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/idl;-><init>(Ll/tel;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 198
    .line 199
    .line 200
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 203
    .line 204
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNewUserIn24H()Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-eqz v0, :cond_0

    .line 213
    .line 214
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 215
    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G0:Ll/s07;

    .line 217
    .line 218
    invoke-virtual {v0}, Ll/s07;->o3()Lrx/c;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v0, v3}, Lrx/c;->take(I)Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    new-instance v1, Ll/xcl;

    .line 235
    .line 236
    invoke-direct {v1, p0}, Ll/xcl;-><init>(Ll/tel;)V

    .line 237
    .line 238
    .line 239
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 244
    .line 245
    .line 246
    new-instance v0, Ll/ycl;

    .line 247
    .line 248
    invoke-direct {v0}, Ll/ycl;-><init>()V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    new-instance v1, Ll/zcl;

    .line 256
    .line 257
    invoke-direct {v1, p0}, Ll/zcl;-><init>(Ll/tel;)V

    .line 258
    .line 259
    .line 260
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 265
    .line 266
    .line 267
    :cond_0
    return-void
.end method

.method public static synthetic G0(Ll/tel;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->k2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic H0(Ll/tel;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->e2(Landroid/os/Bundle;)V

    return-void
.end method

.method private H1()V
    .locals 2

    .line 1
    new-instance v0, Ll/jdl;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jdl;-><init>(Ll/tel;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/kdl;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/kdl;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic I0()V
    .locals 0

    .line 1
    return-void
.end method

.method private I1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/zdl;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/zdl;-><init>(Ll/tel;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/kel;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/kel;-><init>(Ll/tel;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic J0(Ll/tel;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->u2(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private J1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/qdl;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/qdl;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/rdl;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/rdl;-><init>(Ll/tel;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic L0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->S1()V

    return-void
.end method

.method private L1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/nel;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/nel;-><init>(Ll/tel;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/oel;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/oel;-><init>(Ll/tel;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v3, Ll/yfl;

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const/16 v4, 0x73

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/qyf;->e(Lrx/c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/dkb;->wa()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/pel;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/pel;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/qel;

    .line 100
    .line 101
    invoke-direct {v1}, Ll/qel;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/rel;

    .line 109
    .line 110
    invoke-direct {v1}, Ll/rel;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/tcl;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/tcl;-><init>(Ll/tel;)V

    .line 128
    .line 129
    .line 130
    new-instance p0, Ll/ucl;

    .line 131
    .line 132
    invoke-direct {p0}, Ll/ucl;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public static synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private N2()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ldl;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ldl;-><init>(Ll/tel;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/mdl;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/mdl;-><init>(Ll/tel;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ll/ndl;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Ll/ndl;-><init>(Ll/tel;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/pdl;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/pdl;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1, v2, v3, p0}, Ll/xxv;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Landroid/content/DialogInterface$OnCancelListener;Ljava/lang/Runnable;Ll/x20;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic O0()Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 12
    .line 13
    const-string v2, "svip"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/hel;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/hel;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    return-object v0
.end method

.method public static synthetic P0(Ll/tel;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->Y1(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Q0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->T1()V

    return-void
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private R2()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic S0()V
    .locals 1

    .line 1
    sget-object v0, Ll/fph0;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/fph0;->n0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic U0(Ll/tel;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->i2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic V0(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic W0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->f2()V

    return-void
.end method

.method public static synthetic X0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->d2()V

    return-void
.end method

.method public static synthetic Y0(Ll/tel;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->r2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a1(Ll/tel;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->a2(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c1(Ll/tel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->U1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d1(Ll/tel;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->Q1(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e0(Ll/tel;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->W1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e1(Ll/tel;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->j2(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/tel;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tel;->t2(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic f1(Ll/tel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->V1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g0(Ll/tel;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->c2(Ll/pf60;)V

    return-void
.end method

.method public static synthetic g1(Ll/tel;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tel;->m2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic h0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h1(Ll/tel;Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tel;->s2(Lrx/subjects/a;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Ll/tel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->l2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i1(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/dkb;->va(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic j1(Ll/tel;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->h2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic l0(Ll/pf60;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic m0(Ljava/util/List;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    invoke-virtual {v2, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v2, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic n0(Ll/tel;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tel;->n2(Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method

.method private n1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    invoke-static {}, Ll/d09;->d()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v2, ""

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object v0, v0, Ll/dkb;->c0:Ll/jxd0;

    .line 30
    .line 31
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/fel;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/fel;-><init>(Ll/tel;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    invoke-static {v0, v2, v1, p0}, Ll/qtk;->O0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/tel;->l1()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    iget-object v1, v1, Ll/dkb;->c0:Ll/jxd0;

    .line 61
    .line 62
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/gel;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/gel;-><init>(Ll/tel;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    invoke-static {v0, v2, v1, p0}, Ll/qtk;->O0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Z)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object p0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 78
    .line 79
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    iget-object p0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 86
    .line 87
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic o0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->X1()V

    return-void
.end method

.method private synthetic o2()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tel;->f:Z

    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "sourcepage"

    .line 10
    .line 11
    sget-object v2, Ll/tel;->J:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    const-string v1, "actiontype"

    .line 17
    .line 18
    sget-object v2, Ll/tel;->K:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 26
    .line 27
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->clone()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 44
    .line 45
    .line 46
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/b0;->b4(Ljava/util/Map;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    new-instance v1, Ll/tdl;

    .line 61
    .line 62
    invoke-direct {v1, p0, v2}, Ll/tdl;-><init>(Ll/tel;Lcom/p1/mobile/putong/data/User;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Ll/udl;

    .line 66
    .line 67
    invoke-direct {v3, p0, v2}, Ll/udl;-><init>(Ll/tel;Lcom/p1/mobile/putong/data/User;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 79
    .line 80
    check-cast v0, Ll/yfl;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 93
    .line 94
    check-cast v0, Ll/yfl;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast v1, Ll/yfl;

    .line 107
    .line 108
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    const-string v3, ""

    .line 113
    .line 114
    invoke-direct {p0, v0, v3, v1, v2}, Ll/tel;->p1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p0, v0, v3}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    const/4 v0, 0x1

    .line 122
    iput-boolean v0, p0, Ll/tel;->f:Z

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Jq:I

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    sget v2, Ll/dbc0;->jv:I

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    sget v2, Ll/dbc0;->js:I

    .line 161
    .line 162
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {v0, v1, p0}, Ll/o1j0;->H(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public static synthetic p0(Ll/tel;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->Z1(Ll/uxj0;)V

    return-void
.end method

.method private p1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/b0;->y3()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, -0x1

    .line 10
    .line 11
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    if-ltz p0, :cond_0

    .line 18
    .line 19
    iget-object v0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-le v0, p0, :cond_0

    .line 26
    .line 27
    iget-object v0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string v0, ""

    .line 45
    .line 46
    const/4 p4, 0x0

    .line 47
    :goto_0
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 58
    .line 59
    .line 60
    return-object p1
.end method

.method public static synthetic q0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic r0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method private r1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->o0()Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->requested:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->e(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;)V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Ll/tel;->q:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/tel;->q:Z

    .line 20
    .line 21
    iget-object p0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 22
    .line 23
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic s0(Ll/tel;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tel;->g2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic t0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u0(Ll/tel;Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tel;->q2(Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic x0(Ll/tel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->v2()V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/core/data/ComStatusAward;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "newUserComGuideNewUI"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final B1(Landroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "heart_confession_uid"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "heart_confession_content"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v1, Ll/yfl;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string v1, ""

    .line 35
    .line 36
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iput-object v0, p0, Ll/tel;->u:Ljava/lang/String;

    .line 55
    .line 56
    iput-object p1, p0, Ll/tel;->v:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public B2()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/tel;->s:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x7d0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/tel;->s:J

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Ll/tel;->F2(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public C1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Ll/yfl;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/yfl;->I0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v0, Ll/yfl;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v0, Ll/yfl;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/yfl;->B1()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    sget-boolean v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    sput-boolean v1, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 53
    .line 54
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v0, Ll/yfl;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/yfl;->C1()V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-static {}, Ll/f4s;->d()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-static {v1}, Ll/f4s;->e(Z)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast p0, Ll/yfl;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/yfl;->C1()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public C2(I[Ljava/lang/String;[I)V
    .locals 2
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p2, 0x0

    .line 2
    move v0, p2

    .line 3
    :goto_0
    array-length v1, p3

    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    aget v1, p3, v0

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    move p3, p2

    .line 16
    :goto_1
    if-eqz p3, :cond_2

    .line 17
    .line 18
    sget-object v0, Ll/fph0;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Ll/fph0;->l0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_2
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/xxv;->n(Lcom/p1/mobile/android/app/Act;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    const-string v0, "off"

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_3
    const-string v0, "on"

    .line 38
    .line 39
    :goto_2
    sget-object v1, Ll/fph0;->h:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/fph0;->m0(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :goto_3
    const/16 v0, 0x700

    .line 45
    .line 46
    if-ne p1, v0, :cond_5

    .line 47
    .line 48
    if-nez p3, :cond_4

    .line 49
    .line 50
    invoke-direct {p0}, Ll/tel;->N2()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p1, Ll/yfl;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/yfl;->o0()Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object p3, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;->requested:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;

    .line 63
    .line 64
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->e(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView$LocationPermissionState;)V

    .line 65
    .line 66
    .line 67
    iget-boolean p1, p0, Ll/tel;->q:Z

    .line 68
    .line 69
    if-eqz p1, :cond_5

    .line 70
    .line 71
    iput-boolean p2, p0, Ll/tel;->q:Z

    .line 72
    .line 73
    iget-boolean p1, p0, Ll/tel;->p:Z

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iget-object p0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 78
    .line 79
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :cond_5
    return-void
.end method

.method public D1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tel;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public D2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tel;->r:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/yfl;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yfl;->q1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public F2(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tel;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 24
    .line 25
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/nh00;->f()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/nh00;->c()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->tabId:Ljava/lang/String;

    .line 49
    .line 50
    :goto_1
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/api/b0;->S3(Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v1, Ll/vdl;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/vdl;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/wdl;

    .line 69
    .line 70
    invoke-direct {v2, p0, v0}, Ll/wdl;-><init>(Ll/tel;Lrx/subjects/a;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public H2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/tel;->g:Z

    .line 6
    .line 7
    invoke-static {}, Ll/sdp;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/tel;->g:Z

    .line 6
    .line 7
    invoke-static {}, Ll/sdp;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public J2(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tel;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public K2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tel;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public L2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tel;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public M2()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yfl;->b0()Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public N1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tel;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tel;->u:Ljava/lang/String;

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
    iget-object v0, p0, Ll/tel;->u:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/tel;->v:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public P1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tel;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public P2(Z)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/tel;->Q2(ZZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final synthetic Q1(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Ll/tel;->F:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public Q2(ZZ)Z
    .locals 12

    .line 1
    const-string p2, ""

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v1, Ll/yfl;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    move-object v1, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Ll/yfl;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    :goto_0
    iget-boolean v3, p0, Ll/tel;->g:Z

    .line 32
    .line 33
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 34
    .line 35
    iget-object v5, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast v5, Ll/yfl;

    .line 38
    .line 39
    invoke-virtual {v5}, Ll/yfl;->r0()Ll/f1g0;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-static {v1, v0, v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d(Ll/ik4;ZZLcom/p1/mobile/putong/core/data/SwipeDirection;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    goto :goto_4

    .line 48
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 51
    .line 52
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v1, Ll/yfl;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-nez v2, :cond_2

    .line 67
    .line 68
    move-object v3, p2

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    :goto_1
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast v4, Ll/yfl;

    .line 75
    .line 76
    invoke-virtual {v4}, Ll/yfl;->r0()Ll/f1g0;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-static {v1, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    if-eqz v2, :cond_4

    .line 85
    .line 86
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 87
    .line 88
    if-nez v3, :cond_3

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_3
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_4
    :goto_2
    move-object v3, p2

    .line 95
    :goto_3
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 96
    .line 97
    .line 98
    :goto_4
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 101
    .line 102
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    const/4 v4, 0x0

    .line 111
    if-eqz v3, :cond_5

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 118
    .line 119
    .line 120
    const-string p1, "failJailedUser"

    .line 121
    .line 122
    invoke-virtual {p0, v1, p1}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return v4

    .line 126
    :cond_5
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 127
    .line 128
    check-cast v3, Ll/yfl;

    .line 129
    .line 130
    invoke-virtual {v3}, Ll/yfl;->r0()Ll/f1g0;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-interface {v3}, Ll/f1g0;->d()Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-eqz v5, :cond_f

    .line 143
    .line 144
    instance-of v5, v3, Ll/t7m;

    .line 145
    .line 146
    if-eqz v5, :cond_6

    .line 147
    .line 148
    check-cast v3, Ll/t7m;

    .line 149
    .line 150
    invoke-interface {v3}, Ll/t7m;->k0()Z

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-nez v3, :cond_f

    .line 155
    .line 156
    :cond_6
    iget-boolean v3, p0, Ll/tel;->f:Z

    .line 157
    .line 158
    if-eqz v3, :cond_f

    .line 159
    .line 160
    if-eqz p1, :cond_7

    .line 161
    .line 162
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 163
    .line 164
    check-cast p0, Ll/yfl;

    .line 165
    .line 166
    invoke-virtual {p0}, Ll/yfl;->r0()Ll/f1g0;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 171
    .line 172
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 173
    .line 174
    .line 175
    return v4

    .line 176
    :cond_7
    invoke-direct {p0}, Ll/tel;->R2()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_b

    .line 181
    .line 182
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 187
    .line 188
    invoke-static {}, Ll/d79;->j0()Z

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    if-eqz v3, :cond_8

    .line 193
    .line 194
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    if-eqz v3, :cond_8

    .line 199
    .line 200
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->letter:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    if-nez v3, :cond_8

    .line 207
    .line 208
    sget p1, Lcom/p1/mobile/putong/core/R$string;->a3:I

    .line 209
    .line 210
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 211
    .line 212
    .line 213
    goto/16 :goto_5

    .line 214
    .line 215
    :cond_8
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 216
    .line 217
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    iget-object v5, v3, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 222
    .line 223
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 224
    .line 225
    iget v6, v3, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->reset:I

    .line 226
    .line 227
    mul-int/lit16 v6, v6, 0x3e8

    .line 228
    .line 229
    int-to-long v6, v6

    .line 230
    iget-wide v8, v5, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 231
    .line 232
    add-long/2addr v6, v8

    .line 233
    sget-object v5, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 234
    .line 235
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 236
    .line 237
    .line 238
    move-result-wide v8

    .line 239
    sub-long/2addr v6, v8

    .line 240
    const-wide/16 v8, 0x0

    .line 241
    .line 242
    cmp-long v5, v6, v8

    .line 243
    .line 244
    if-lez v5, :cond_9

    .line 245
    .line 246
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 247
    .line 248
    .line 249
    move-result v3

    .line 250
    if-nez v3, :cond_9

    .line 251
    .line 252
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 257
    .line 258
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 259
    .line 260
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 261
    .line 262
    iget-object v11, p1, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 263
    .line 264
    const-string v6, "p_home,undo"

    .line 265
    .line 266
    const/4 v8, 0x0

    .line 267
    const/4 v9, 0x0

    .line 268
    const/4 v10, 0x0

    .line 269
    invoke-static/range {v5 .. v11}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 270
    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_9
    iget-boolean v3, p0, Ll/tel;->f:Z

    .line 274
    .line 275
    if-eqz v3, :cond_c

    .line 276
    .line 277
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 278
    .line 279
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 280
    .line 281
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 282
    .line 283
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 284
    .line 285
    if-eqz v3, :cond_c

    .line 286
    .line 287
    iget-object v3, p0, Ll/tel;->A:Ljava/lang/Runnable;

    .line 288
    .line 289
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 290
    .line 291
    .line 292
    invoke-static {}, Ll/spl0;->Z()Z

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    if-eqz v3, :cond_a

    .line 297
    .line 298
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    iget-object v5, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {v3, v5}, Ll/bpe0;->i(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 308
    .line 309
    check-cast v3, Ll/yfl;

    .line 310
    .line 311
    invoke-virtual {v3}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    const-string v5, "other_user_id"

    .line 320
    .line 321
    iget-object v6, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 322
    .line 323
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 332
    .line 333
    invoke-virtual {v6, p1}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    const-string v6, "superlike_quantity"

    .line 342
    .line 343
    invoke-static {v6, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    filled-new-array {v5, p1}, [Ll/pf60;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    const-string v5, "e_undo_superlike"

    .line 352
    .line 353
    invoke-static {v5, v3, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 354
    .line 355
    .line 356
    :cond_a
    move p1, v0

    .line 357
    goto :goto_6

    .line 358
    :cond_b
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    invoke-static {p1}, Ll/axj0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 363
    .line 364
    .line 365
    :cond_c
    :goto_5
    move p1, v4

    .line 366
    :goto_6
    move v3, p1

    .line 367
    if-nez v3, :cond_e

    .line 368
    .line 369
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 370
    .line 371
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 372
    .line 373
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/b0;->y3()I

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    sub-int/2addr v3, v0

    .line 378
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_d

    .line 383
    .line 384
    if-ltz v3, :cond_d

    .line 385
    .line 386
    iget-object v0, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 387
    .line 388
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    if-le v0, v3, :cond_d

    .line 393
    .line 394
    iget-object p2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 395
    .line 396
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object p2

    .line 400
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 401
    .line 402
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 403
    .line 404
    iget-object v0, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 405
    .line 406
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 407
    .line 408
    .line 409
    move-result v4

    .line 410
    :cond_d
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 411
    .line 412
    .line 413
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 417
    .line 418
    .line 419
    const-string p2, "failUndoLocal"

    .line 420
    .line 421
    invoke-virtual {p0, v1, p2}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    :cond_e
    return p1

    .line 425
    :cond_f
    return v4
.end method

.method public final synthetic R1(Ll/pf60;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "checkIntro error, local has user me is "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v1, ", "

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Ll/vg60;

    .line 43
    .line 44
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    move v1, v2

    .line 53
    :goto_0
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v3, Ll/vg60;

    .line 56
    .line 57
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-ge v1, v3, :cond_2

    .line 64
    .line 65
    const/4 v3, 0x5

    .line 66
    if-ge v1, v3, :cond_2

    .line 67
    .line 68
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v3, Ll/vg60;

    .line 71
    .line 72
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    const-string v4, "cid-"

    .line 83
    .line 84
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v4, " : "

    .line 91
    .line 92
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 98
    .line 99
    invoke-virtual {v4, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_0

    .line 108
    .line 109
    const-string v3, "1"

    .line 110
    .line 111
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_0
    const-string v3, "0"

    .line 116
    .line 117
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_1
    const-string p1, "local has no conversations"

    .line 124
    .line 125
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    iput v2, p0, Ll/tel;->F:I

    .line 141
    .line 142
    return-void
.end method

.method public final synthetic S1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/tel;->o:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic T1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/tel;->o:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic U1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/yfl;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/yfl;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Ll/tel;->B:Z

    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public final synthetic V1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xdl;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/xdl;-><init>(Ll/tel;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1, v1}, Ll/qtk;->Q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O2:Ll/wyd0;

    .line 16
    .line 17
    const-string p1, ""

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic W1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/tel;->l:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/tel;->n1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic X1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->z1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/tel;->C1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Y1(Ll/bkj0;)V
    .locals 10

    .line 1
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->needRefresh()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v2, Ll/yfl;

    .line 18
    .line 19
    iget-object v2, v2, Ll/yfl;->W:Ll/v740;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/v740;->y(Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Ll/tel;->c:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x0

    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    invoke-static {}, Ll/uih0;->m0()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v3}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_1

    .line 61
    .line 62
    :cond_0
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v3, p0, Ll/tel;->c:Ljava/lang/String;

    .line 71
    .line 72
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const-string v5, ","

    .line 77
    .line 78
    const/4 v6, 0x1

    .line 79
    if-eq v0, v3, :cond_2

    .line 80
    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v7, "moment render List refresh change "

    .line 84
    .line 85
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    move v0, v6

    .line 109
    goto :goto_0

    .line 110
    :cond_2
    move v0, v1

    .line 111
    :goto_0
    if-eqz v0, :cond_3

    .line 112
    .line 113
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 114
    .line 115
    check-cast v3, Ll/yfl;

    .line 116
    .line 117
    iget-object v3, v3, Ll/yfl;->W:Ll/v740;

    .line 118
    .line 119
    invoke-virtual {v3, v2}, Ll/v740;->G(Ljava/util/List;)V

    .line 120
    .line 121
    .line 122
    :cond_3
    if-nez v0, :cond_4

    .line 123
    .line 124
    invoke-virtual {p1, v6}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 125
    .line 126
    .line 127
    :cond_4
    iput-boolean v6, p0, Ll/tel;->d:Z

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    new-instance v7, Ll/ael;

    .line 134
    .line 135
    invoke-direct {v7, p0}, Ll/ael;-><init>(Ll/tel;)V

    .line 136
    .line 137
    .line 138
    const-wide/16 v8, 0x64

    .line 139
    .line 140
    invoke-virtual {v3, v7, v8, v9}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 141
    .line 142
    .line 143
    new-instance v3, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v7, "moment render cards: "

    .line 146
    .line 147
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_5

    .line 167
    .line 168
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_5

    .line 173
    .line 174
    move v0, v6

    .line 175
    goto :goto_1

    .line 176
    :cond_5
    move v0, v4

    .line 177
    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-nez p1, :cond_6

    .line 202
    .line 203
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_6

    .line 208
    .line 209
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 210
    .line 211
    check-cast p1, Ll/yfl;

    .line 212
    .line 213
    invoke-virtual {p1, v6, v4, v6}, Ll/yfl;->t1(ZZZ)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 222
    .line 223
    if-eqz p1, :cond_7

    .line 224
    .line 225
    check-cast v0, Ll/yfl;

    .line 226
    .line 227
    invoke-virtual {v0, v6, v6, v6}, Ll/yfl;->t1(ZZZ)V

    .line 228
    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_7
    check-cast v0, Ll/yfl;

    .line 232
    .line 233
    invoke-virtual {v0, v4, v6, v6}, Ll/yfl;->t1(ZZZ)V

    .line 234
    .line 235
    .line 236
    :goto_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 237
    .line 238
    check-cast p1, Ll/yfl;

    .line 239
    .line 240
    invoke-virtual {p1}, Ll/yfl;->K0()Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_8

    .line 245
    .line 246
    iget-object p1, p0, Ll/tel;->k:Lrx/subjects/a;

    .line 247
    .line 248
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    if-nez p1, :cond_8

    .line 253
    .line 254
    iget-object p0, p0, Ll/tel;->k:Lrx/subjects/a;

    .line 255
    .line 256
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 257
    .line 258
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    :cond_8
    return-void
.end method

.method public final synthetic Z1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/tel;->h:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/tel;->m1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tel;->H1()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/tel;->F1()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/tel;->L1()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/tel;->I1()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/tel;->J1()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/tel;->E1()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic a2(Ljava/util/List;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ydl;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ydl;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isNewUserIn24H()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/yfl;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/yfl;->Y()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Ll/h7d0;->q0(Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->G0:Ll/s07;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/s07;->t3()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final synthetic b2(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yfl;->a0()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/h7d0;->j0()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Ll/h7d0;->r0(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic c2(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-static {p1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    :goto_0
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Ll/h7d0;->r0(Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, v0}, Ll/h7d0;->q0(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/yfl;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/yfl;->a0()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic d2()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v7, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v10, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, 0x0

    .line 28
    const/4 v5, 0x1

    .line 29
    const-string v6, "fake_to_good_dlg"

    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v9, 0x1

    .line 33
    invoke-static/range {v1 .. v10}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/16 v1, 0x73

    .line 38
    .line 39
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tel;->z:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/tel;->E2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/qyf;->d()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic e2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tel;->i:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/tel;->j:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/tel;->j:Lrx/subjects/a;

    .line 23
    .line 24
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p1, Ll/yfl;

    .line 41
    .line 42
    invoke-virtual {p1, v0, v1}, Ll/yfl;->G0(ZZ)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p1, p0, Ll/tel;->j:Lrx/subjects/a;

    .line 47
    .line 48
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Ll/tel;->j:Lrx/subjects/a;

    .line 59
    .line 60
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->hasMore()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p1, Ll/yfl;

    .line 75
    .line 76
    invoke-virtual {p1, v1, v0}, Ll/yfl;->G0(ZZ)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast p1, Ll/yfl;

    .line 83
    .line 84
    invoke-virtual {p1, v1, v1}, Ll/yfl;->G0(ZZ)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iput-boolean v1, p0, Ll/tel;->n:Z

    .line 88
    .line 89
    return-void
.end method

.method public final synthetic f2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tel;->B:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/yfl;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yfl;->r0()Ll/f1g0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic g2(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/tel;->B:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/sdl;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/sdl;-><init>(Ll/tel;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v1, 0x1f4

    .line 19
    .line 20
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic h2(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-ne p1, v0, :cond_1

    .line 19
    .line 20
    iget-boolean p1, p0, Ll/tel;->w:Z

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iput-boolean v1, p0, Ll/tel;->w:Z

    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->D(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object p0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    if-ne p1, p0, :cond_2

    .line 34
    .line 35
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->D(Z)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public final synthetic i2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yfl;->u1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j2(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tel;->m:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic k2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l1()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 10
    .line 11
    const-string v0, "wechat"

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 28
    .line 29
    const-string v0, "qq"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/d09;->o()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    iget-object p0, p0, Ll/dkb;->b0:Ll/jxd0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public final synthetic l2(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 7
    .line 8
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v1, Ll/yfl;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/yfl;->m0()Lv/VDraweeView;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p1, v1, v2}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/yfl;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/yfl;->h0()Lcom/facebook/drawee/view/DraweeView;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public m1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iput v1, p0, Ll/tel;->F:I

    .line 13
    .line 14
    iget-object v0, p0, Ll/tel;->G:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/tel;->G:Ll/kcg0;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/tel;->G:Ll/kcg0;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 33
    .line 34
    .line 35
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "checkIntro error when illegal account state, userId:"

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ", login: "

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, ", me == null"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->on()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 97
    .line 98
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v2, Ll/mw30;

    .line 103
    .line 104
    invoke-direct {v2}, Ll/mw30;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/bel;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/bel;-><init>(Ll/tel;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/cel;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/cel;-><init>(Ll/tel;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Ll/tel;->G:Ll/kcg0;

    .line 138
    .line 139
    return-void

    .line 140
    :cond_1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0}, Ll/rj50;->g0()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_2

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_2
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 156
    .line 157
    check-cast v0, Ll/yfl;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_3

    .line 170
    .line 171
    iput-boolean v1, p0, Ll/tel;->h:Z

    .line 172
    .line 173
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic m2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/yfl;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v1, Ll/yfl;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {p0, v0, p2, v1, p1}, Ll/tel;->p1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 44
    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    const-string p1, ""

    .line 52
    .line 53
    :goto_1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 54
    .line 55
    .line 56
    const-string p1, "success"

    .line 57
    .line 58
    invoke-virtual {p0, p2, p1}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    const/4 p1, 0x1

    .line 62
    iput-boolean p1, p0, Ll/tel;->f:Z

    .line 63
    .line 64
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/yfl;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v1, Ll/yfl;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, ""

    .line 36
    .line 37
    invoke-direct {p0, v0, v2, v1, p1}, Ll/tel;->p1(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1, p2}, Ll/tel;->H2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 p1, 0x1

    .line 45
    iput-boolean p1, p0, Ll/tel;->f:Z

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Jq:I

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    sget v0, Ll/dbc0;->jv:I

    .line 70
    .line 71
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget v0, Ll/dbc0;->js:I

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p1, p2, p0}, Ll/o1j0;->H(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public o1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/tel;->v:Ljava/lang/String;

    .line 3
    .line 4
    iput-object v0, p0, Ll/tel;->u:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p2(Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p4, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p4}, Ll/yfl;->r0()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    if-eqz p4, :cond_2

    .line 14
    .line 15
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p4, Ll/yfl;

    .line 18
    .line 19
    invoke-virtual {p4}, Ll/yfl;->r0()Ll/f1g0;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-interface {p4}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-ne p2, p4, :cond_1

    .line 48
    .line 49
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p4, Ll/yfl;

    .line 52
    .line 53
    invoke-virtual {p4}, Ll/yfl;->r0()Ll/f1g0;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-interface {p4, v0}, Ll/f1g0;->c(Z)Z

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    if-eqz p4, :cond_2

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-ne p2, p1, :cond_0

    .line 69
    .line 70
    invoke-static {}, Ll/d79;->j0()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_0

    .line 75
    .line 76
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    invoke-virtual {p0, p3}, Ll/tel;->B1(Landroid/content/Intent;)V

    .line 83
    .line 84
    .line 85
    :cond_0
    const/4 p1, 0x1

    .line 86
    invoke-virtual {p0, p1}, Ll/tel;->P2(Z)Z

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 95
    .line 96
    check-cast p0, Ll/yfl;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/yfl;->r0()Ll/f1g0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    return-void
.end method

.method public q1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tel;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q2(Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p3, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p3}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 10
    .line 11
    .line 12
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p3, v0}, Ll/dkb;->va(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v1, Ll/mel;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/mel;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {p3, v0, p1, p0, v1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    const-string p0, "fake_to_good_dlg"

    .line 61
    .line 62
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    invoke-static {}, Ll/fph0;->G()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    const-string p0, "fakeView"

    .line 73
    .line 74
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_1

    .line 79
    .line 80
    invoke-static {}, Ll/fph0;->v()V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public final synthetic r2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yfl;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public s1()V
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 16
    .line 17
    return-void
.end method

.method public final synthetic s2(Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/b0;->Q3()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p1, Ll/yfl;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/yfl;->K0()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Ll/tel;->E:Z

    .line 40
    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/yfl;

    .line 44
    .line 45
    const/4 p2, 0x0

    .line 46
    invoke-virtual {p0, p1, p2}, Ll/yfl;->s1(ZZ)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public t1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tel;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic t2(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Null:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/fph0;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Ll/fph0;->l0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/xxv;->n(Lcom/p1/mobile/android/app/Act;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const-string p1, "off"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p1, "on"

    .line 25
    .line 26
    :goto_0
    sget-object p2, Ll/fph0;->h:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/fph0;->m0(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :goto_1
    invoke-direct {p0}, Ll/tel;->r1()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public u1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tel;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic u2(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tel;->r1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tel;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic v2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tel;->r1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tel;->E:Z

    .line 3
    .line 4
    return-void
.end method

.method public x1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of v0, p0, Ll/cvl;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    check-cast p0, Ll/cvl;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ll/cvl;->I2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, v0}, Ll/cvl;->n2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public x2(IILandroid/content/Intent;)V
    .locals 3

    .line 1
    const/16 v0, 0x72

    .line 2
    .line 3
    if-ne p1, v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/yfl;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eq p2, v0, :cond_0

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eq p2, v0, :cond_0

    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-ne p2, v0, :cond_1

    .line 43
    .line 44
    :cond_0
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p:Z

    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v0, Ll/yfl;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ll/f1g0;->o()Ll/ik4;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_4

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_4

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eq p2, p1, :cond_2

    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eq p2, p1, :cond_2

    .line 97
    .line 98
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-ne p2, p1, :cond_4

    .line 105
    .line 106
    :cond_2
    iput-boolean v1, p0, Ll/tel;->g:Z

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    new-instance v1, Ll/scl;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/scl;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    new-instance v1, Ll/ddl;

    .line 122
    .line 123
    invoke-direct {v1, p0, v0, p2, p3}, Ll/ddl;-><init>(Ll/tel;Ljava/lang/String;ILandroid/content/Intent;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    const/16 v0, 0x73

    .line 135
    .line 136
    if-ne p1, v0, :cond_4

    .line 137
    .line 138
    const/4 p1, -0x1

    .line 139
    if-ne p2, p1, :cond_4

    .line 140
    .line 141
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Ljava/util/ArrayList;

    .line 148
    .line 149
    const-string p2, "from"

    .line 150
    .line 151
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-direct {p0, p1, p2}, Ll/tel;->A2(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_4
    return-void
.end method

.method public y2(Ll/xql;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/tel;->D:Ll/g6m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/sfh0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/sfh0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/tel;->D:Ll/g6m;

    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/tel;->d:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string v1, "moment onCardSwipe be called before card rendered"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/tl9;->b()Ll/skk0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {p1}, Ll/xql;->e0()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-interface {p1}, Ll/xql;->getCardDataProxy()Ll/ik4;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const-string v1, ""

    .line 51
    .line 52
    :goto_0
    iput-object v1, v0, Ll/skk0;->b:Ljava/lang/String;

    .line 53
    .line 54
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    const/4 v2, 0x0

    .line 58
    if-eq p2, v0, :cond_4

    .line 59
    .line 60
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 61
    .line 62
    if-ne p2, v3, :cond_3

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move v3, v2

    .line 66
    goto :goto_3

    .line 67
    :cond_4
    :goto_2
    move v3, v1

    .line 68
    :goto_3
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 69
    .line 70
    if-ne p2, v4, :cond_5

    .line 71
    .line 72
    move v5, v1

    .line 73
    goto :goto_4

    .line 74
    :cond_5
    move v5, v2

    .line 75
    :goto_4
    if-nez p3, :cond_6

    .line 76
    .line 77
    iget-object v6, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast v6, Ll/yfl;

    .line 80
    .line 81
    invoke-virtual {v6, v3, v5}, Ll/yfl;->X(ZZ)Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->i()V

    .line 86
    .line 87
    .line 88
    :cond_6
    if-eqz v3, :cond_8

    .line 89
    .line 90
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 91
    .line 92
    if-eqz v5, :cond_7

    .line 93
    .line 94
    check-cast v3, Ll/yfl;

    .line 95
    .line 96
    invoke-virtual {v3}, Ll/yfl;->j0()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->reset()V

    .line 101
    .line 102
    .line 103
    goto :goto_5

    .line 104
    :cond_7
    check-cast v3, Ll/yfl;

    .line 105
    .line 106
    invoke-virtual {v3}, Ll/yfl;->s0()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->reset()V

    .line 111
    .line 112
    .line 113
    :goto_5
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 114
    .line 115
    check-cast v3, Ll/yfl;

    .line 116
    .line 117
    invoke-virtual {v3}, Ll/yfl;->g0()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->reset()V

    .line 122
    .line 123
    .line 124
    goto :goto_6

    .line 125
    :cond_8
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 126
    .line 127
    check-cast v3, Ll/yfl;

    .line 128
    .line 129
    invoke-virtual {v3}, Ll/yfl;->j0()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->reset()V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 137
    .line 138
    check-cast v3, Ll/yfl;

    .line 139
    .line 140
    invoke-virtual {v3}, Ll/yfl;->s0()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->reset()V

    .line 145
    .line 146
    .line 147
    :goto_6
    invoke-interface {p1, p2}, Ll/xql;->j0(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 148
    .line 149
    .line 150
    const-string v3, "card"

    .line 151
    .line 152
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->E(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    const-string v3, "swipe"

    .line 156
    .line 157
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->F(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 161
    .line 162
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 163
    .line 164
    if-eq p2, v0, :cond_a

    .line 165
    .line 166
    if-ne p2, v4, :cond_9

    .line 167
    .line 168
    goto :goto_7

    .line 169
    :cond_9
    move v1, v2

    .line 170
    :cond_a
    :goto_7
    invoke-virtual {v3, v1}, Ll/r4a;->e(Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/tel;->D:Ll/g6m;

    .line 174
    .line 175
    new-instance v3, Ll/sfh0$a;

    .line 176
    .line 177
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 178
    .line 179
    move-object v5, v1

    .line 180
    check-cast v5, Ll/yfl;

    .line 181
    .line 182
    invoke-interface {p1}, Ll/xql;->getCardDataProxy()Ll/ik4;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    move-object v4, p0

    .line 187
    move-object v7, p2

    .line 188
    move v8, p3

    .line 189
    invoke-direct/range {v3 .. v8}, Ll/sfh0$a;-><init>(Ll/tel;Ll/yfl;Ll/ik4;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v0, v3}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 197
    .line 198
    sget-object p1, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 199
    .line 200
    if-ne p0, p1, :cond_b

    .line 201
    .line 202
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 203
    .line 204
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 205
    .line 206
    invoke-virtual {p2}, Ll/r4a;->f()V

    .line 207
    .line 208
    .line 209
    :cond_b
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 210
    .line 211
    if-eq p0, p2, :cond_c

    .line 212
    .line 213
    if-ne p0, p1, :cond_d

    .line 214
    .line 215
    :cond_c
    invoke-virtual {v4}, Ll/tel;->o1()V

    .line 216
    .line 217
    .line 218
    :cond_d
    iput-boolean v2, v4, Ll/tel;->g:Z

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    if-eqz p2, :cond_e

    .line 225
    .line 226
    iget-object p2, v4, Ll/ar2;->viewModel:Ll/iam;

    .line 227
    .line 228
    check-cast p2, Ll/yfl;

    .line 229
    .line 230
    invoke-virtual {p2, p0, v7}, Ll/yfl;->z1(Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 231
    .line 232
    .line 233
    if-eq p0, p1, :cond_e

    .line 234
    .line 235
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 236
    .line 237
    :cond_e
    return-object p0
.end method

.method public z1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/asj0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tel;->k1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/yfl;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/yfl;->I0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Ll/yfl;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v0, Ll/yfl;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/yfl;->r0()Ll/f1g0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/yfl;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/yfl;->r0()Ll/f1g0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    instance-of v0, p0, Ll/t7m;

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    check-cast p0, Ll/t7m;

    .line 78
    .line 79
    invoke-interface {p0}, Ll/q7m;->y()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-interface {p0}, Ll/t7m;->L()V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public z2(Z)V
    .locals 5

    .line 1
    iput-boolean p1, p0, Ll/tel;->x:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/tel;->y:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-boolean v1, p0, Ll/tel;->h:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/tel;->h:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/tel;->m1()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-boolean v1, p0, Ll/tel;->e:Z

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/tel;->e:Z

    .line 29
    .line 30
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v1, Ll/yfl;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v1, Ll/yfl;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast v1, Ll/yfl;

    .line 65
    .line 66
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast v2, Ll/yfl;

    .line 77
    .line 78
    invoke-virtual {v2}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v1, Ll/yfl;

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/yfl;->r0()Ll/f1g0;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 102
    .line 103
    check-cast v2, Ll/yfl;

    .line 104
    .line 105
    invoke-virtual {v2}, Ll/yfl;->i0()Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/themeslide/HomeThemeSlideFrag;->pageId()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    iget-object v3, p0, Ll/tel;->a:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p0, v3}, Ll/tel;->N1(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-static {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->r(Ll/ik4;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 120
    .line 121
    .line 122
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 125
    .line 126
    invoke-virtual {v1}, Ll/m27;->F3()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    sget-object v2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 137
    .line 138
    if-eq v1, v2, :cond_2

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    sget-object v2, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 145
    .line 146
    if-ne v1, v2, :cond_3

    .line 147
    .line 148
    :cond_2
    if-nez p1, :cond_3

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/tel;->M2()V

    .line 151
    .line 152
    .line 153
    :cond_3
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 154
    .line 155
    check-cast v1, Ll/yfl;

    .line 156
    .line 157
    invoke-virtual {v1, p1}, Ll/yfl;->l1(Z)V

    .line 158
    .line 159
    .line 160
    iget-boolean p1, p0, Ll/tel;->x:Z

    .line 161
    .line 162
    if-nez p1, :cond_6

    .line 163
    .line 164
    sget-boolean p1, Ll/hw80;->f:Z

    .line 165
    .line 166
    if-eqz p1, :cond_5

    .line 167
    .line 168
    iget-boolean p1, p0, Ll/tel;->n:Z

    .line 169
    .line 170
    if-eqz p1, :cond_5

    .line 171
    .line 172
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 173
    .line 174
    check-cast p1, Ll/yfl;

    .line 175
    .line 176
    const/4 v1, 0x1

    .line 177
    invoke-virtual {p1, v1, v1}, Ll/yfl;->s1(ZZ)V

    .line 178
    .line 179
    .line 180
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 183
    .line 184
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2}, Ll/nh00;->f()Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-eqz v2, :cond_4

    .line 193
    .line 194
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-virtual {v2}, Ll/nh00;->c()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    goto :goto_0

    .line 203
    :cond_4
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->tabId:Ljava/lang/String;

    .line 208
    .line 209
    :goto_0
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/api/b0;->S3(Ljava/lang/String;)Lrx/c;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    new-instance p1, Ll/del;

    .line 222
    .line 223
    invoke-direct {p1}, Ll/del;-><init>()V

    .line 224
    .line 225
    .line 226
    new-instance v1, Ll/eel;

    .line 227
    .line 228
    invoke-direct {v1}, Ll/eel;-><init>()V

    .line 229
    .line 230
    .line 231
    invoke-static {p1, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 236
    .line 237
    .line 238
    :cond_5
    sput-boolean v0, Ll/hw80;->f:Z

    .line 239
    .line 240
    :cond_6
    return-void
.end method
