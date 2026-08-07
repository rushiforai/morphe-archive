.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public D:I

.field public c:J

.field public final d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public final e:Lcom/p1/mobile/android/app/Act;

.field public f:Ll/n570;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public i:Z

.field public final j:I

.field public k:Z

.field public l:Z

.field public m:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public r:Z

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/hrc0;

.field public u:I

.field public v:Z

.field public w:Ll/nch;

.field public x:Ll/nq00;

.field public y:Ll/p8h;

.field public z:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 8
    .line 9
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 14
    .line 15
    new-instance v1, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n:Ljava/util/HashMap;

    .line 21
    .line 22
    new-instance v1, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->o:Ljava/util/HashMap;

    .line 28
    .line 29
    new-instance v1, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->p:Ljava/util/HashMap;

    .line 35
    .line 36
    new-instance v1, Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->q:Ljava/util/HashMap;

    .line 42
    .line 43
    new-instance v1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s:Ljava/util/List;

    .line 49
    .line 50
    const-wide/16 v1, 0x0

    .line 51
    .line 52
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->z:J

    .line 53
    .line 54
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->A:Ll/h80;

    .line 60
    .line 61
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->B:Ll/h80;

    .line 67
    .line 68
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C:Ll/h80;

    .line 74
    .line 75
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->D:I

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->g:Ljava/lang/String;

    .line 86
    .line 87
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 88
    .line 89
    iput-boolean p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    .line 90
    .line 91
    iput p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    .line 92
    .line 93
    const-string p3, "feedTime"

    .line 94
    .line 95
    invoke-static {p3}, Ll/ksg;->I(Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    int-to-long p3, p3

    .line 100
    iput-wide p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->c:J

    .line 101
    .line 102
    new-instance p3, Ll/hrc0;

    .line 103
    .line 104
    new-instance p4, Ll/dng;

    .line 105
    .line 106
    invoke-direct {p4, p0}, Ll/dng;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V

    .line 107
    .line 108
    .line 109
    const/4 p5, 0x3

    .line 110
    invoke-direct {p3, p2, p4, p5}, Ll/hrc0;-><init>(Lv/VRecyclerView;Ll/y20;I)V

    .line 111
    .line 112
    .line 113
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->t:Ll/hrc0;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Z()Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-eqz p2, :cond_0

    .line 120
    .line 121
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-eqz p2, :cond_0

    .line 126
    .line 127
    new-instance p2, Ll/eng;

    .line 128
    .line 129
    invoke-direct {p2}, Ll/eng;-><init>()V

    .line 130
    .line 131
    .line 132
    new-instance p3, Ll/fng;

    .line 133
    .line 134
    invoke-direct {p3, p0}, Ll/fng;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 138
    .line 139
    .line 140
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-eqz p2, :cond_1

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p0, p1, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    new-instance p1, Ll/gng;

    .line 155
    .line 156
    invoke-direct {p1}, Ll/gng;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    new-instance p1, Ll/hng;

    .line 164
    .line 165
    invoke-direct {p1}, Ll/hng;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 173
    .line 174
    .line 175
    :cond_1
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h0()V

    return-void
.end method

.method public static synthetic F(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

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

.method public static synthetic H(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->J6()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->g0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)Ll/h80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C:Ll/h80;

    return-object p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->c:J

    return-wide v0
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->u0()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->x0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method private R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/n570;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 16
    .line 17
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/qn00;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method private d0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 4
    .line 5
    return p0
.end method

.method private synthetic g0(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->x:Ll/nq00;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->x:Ll/nq00;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/nq00;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/tec0;->e:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    if-nez p2, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget p2, Ll/tec0;->z:I

    .line 27
    .line 28
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    if-ne p2, v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget p2, Ll/tec0;->f2:I

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    const/16 v0, 0x15

    .line 50
    .line 51
    if-ne p2, v0, :cond_3

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget p2, Ll/tec0;->h5:I

    .line 60
    .line 61
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_3
    const/16 v0, 0x16

    .line 67
    .line 68
    if-ne p2, v0, :cond_4

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget p2, Ll/tec0;->j5:I

    .line 77
    .line 78
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_4
    const/16 v0, 0x17

    .line 86
    .line 87
    if-ne p2, v0, :cond_5

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    sget p2, Ll/tec0;->i5:I

    .line 96
    .line 97
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_5
    const/16 v0, 0x18

    .line 103
    .line 104
    if-ne p2, v0, :cond_6

    .line 105
    .line 106
    sget p2, Ll/tec0;->a1:I

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_6
    const/4 v0, 0x3

    .line 122
    if-ne p2, v0, :cond_7

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget p2, Ll/tec0;->e4:I

    .line 131
    .line 132
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0

    .line 137
    :cond_7
    const/4 v0, 0x4

    .line 138
    if-ne p2, v0, :cond_8

    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    sget p2, Ll/tec0;->u5:I

    .line 147
    .line 148
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0

    .line 153
    :cond_8
    const/16 v0, 0x8

    .line 154
    .line 155
    if-ne p2, v0, :cond_9

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    sget p2, Ll/tec0;->Z3:I

    .line 164
    .line 165
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0

    .line 170
    :cond_9
    const/16 v0, 0x1a

    .line 171
    .line 172
    if-ne p2, v0, :cond_a

    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 175
    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    sget p2, Ll/tec0;->c1:I

    .line 181
    .line 182
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0

    .line 187
    :cond_a
    const/16 v0, 0x19

    .line 188
    .line 189
    if-ne p2, v0, :cond_b

    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    sget p2, Ll/tec0;->e1:I

    .line 198
    .line 199
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    return-object p0

    .line 204
    :cond_b
    const/16 v0, 0x35

    .line 205
    .line 206
    if-ne p2, v0, :cond_c

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 209
    .line 210
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    sget p2, Ll/tec0;->d1:I

    .line 215
    .line 216
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    return-object p0

    .line 221
    :cond_c
    const/16 v0, 0x1b

    .line 222
    .line 223
    if-ne p2, v0, :cond_d

    .line 224
    .line 225
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 226
    .line 227
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    sget p2, Ll/tec0;->L1:I

    .line 232
    .line 233
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    return-object p0

    .line 238
    :cond_d
    const/16 v0, 0xd

    .line 239
    .line 240
    if-ne p2, v0, :cond_e

    .line 241
    .line 242
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedTimeViewInList;

    .line 243
    .line 244
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 245
    .line 246
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedTimeViewInList;-><init>(Landroid/content/Context;)V

    .line 247
    .line 248
    .line 249
    return-object p1

    .line 250
    :cond_e
    const/16 v0, 0x1d

    .line 251
    .line 252
    if-ne p2, v0, :cond_f

    .line 253
    .line 254
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    sget p2, Ll/tec0;->b0:I

    .line 261
    .line 262
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    return-object p0

    .line 267
    :cond_f
    const/16 v0, 0x28

    .line 268
    .line 269
    if-ne p2, v0, :cond_10

    .line 270
    .line 271
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 272
    .line 273
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    sget p2, Ll/tec0;->Z:I

    .line 278
    .line 279
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    return-object p0

    .line 284
    :cond_10
    const/16 v0, 0x1c

    .line 285
    .line 286
    if-ne p2, v0, :cond_11

    .line 287
    .line 288
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 289
    .line 290
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    sget p2, Ll/tec0;->T2:I

    .line 295
    .line 296
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    return-object p0

    .line 301
    :cond_11
    const/16 v0, 0x20

    .line 302
    .line 303
    if-ne p2, v0, :cond_12

    .line 304
    .line 305
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 306
    .line 307
    .line 308
    move-result-object p2

    .line 309
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    .line 310
    .line 311
    .line 312
    move-result-object p2

    .line 313
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 314
    .line 315
    invoke-interface {p2, p0, p1}, Ll/e4h;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    return-object p0

    .line 320
    :cond_12
    const/16 v0, 0x21

    .line 321
    .line 322
    if-ne p2, v0, :cond_13

    .line 323
    .line 324
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 325
    .line 326
    .line 327
    move-result-object p2

    .line 328
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 333
    .line 334
    invoke-interface {p2, p0, p1}, Ll/e4h;->b(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    return-object p0

    .line 339
    :cond_13
    const/16 v0, 0x27

    .line 340
    .line 341
    if-ne p2, v0, :cond_14

    .line 342
    .line 343
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 344
    .line 345
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    sget p2, Ll/tec0;->f1:I

    .line 350
    .line 351
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    return-object p0

    .line 356
    :cond_14
    const/16 v0, 0x22

    .line 357
    .line 358
    if-ne p2, v0, :cond_15

    .line 359
    .line 360
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 361
    .line 362
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    sget p2, Ll/tec0;->G3:I

    .line 367
    .line 368
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 373
    .line 374
    return-object p0

    .line 375
    :cond_15
    const/16 v0, 0x23

    .line 376
    .line 377
    if-ne p2, v0, :cond_16

    .line 378
    .line 379
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 380
    .line 381
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    sget p2, Ll/tec0;->B2:I

    .line 386
    .line 387
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 388
    .line 389
    .line 390
    move-result-object p0

    .line 391
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;

    .line 392
    .line 393
    return-object p0

    .line 394
    :cond_16
    const/16 v0, 0x24

    .line 395
    .line 396
    if-ne p2, v0, :cond_17

    .line 397
    .line 398
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 399
    .line 400
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    sget p2, Ll/tec0;->n3:I

    .line 405
    .line 406
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;

    .line 411
    .line 412
    return-object p0

    .line 413
    :cond_17
    const/16 v0, 0x25

    .line 414
    .line 415
    if-ne p2, v0, :cond_18

    .line 416
    .line 417
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 418
    .line 419
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    sget p2, Ll/tec0;->Z2:I

    .line 424
    .line 425
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 426
    .line 427
    .line 428
    move-result-object p0

    .line 429
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;

    .line 430
    .line 431
    return-object p0

    .line 432
    :cond_18
    const/16 v0, 0x26

    .line 433
    .line 434
    if-ne p2, v0, :cond_19

    .line 435
    .line 436
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 437
    .line 438
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 439
    .line 440
    .line 441
    move-result-object p0

    .line 442
    sget p2, Ll/tec0;->Y2:I

    .line 443
    .line 444
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 445
    .line 446
    .line 447
    move-result-object p0

    .line 448
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 449
    .line 450
    return-object p0

    .line 451
    :cond_19
    const/16 v0, 0x29

    .line 452
    .line 453
    if-ne p2, v0, :cond_1a

    .line 454
    .line 455
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 456
    .line 457
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 458
    .line 459
    .line 460
    move-result-object p0

    .line 461
    sget p2, Ll/tec0;->B0:I

    .line 462
    .line 463
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object p0

    .line 467
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;

    .line 468
    .line 469
    return-object p0

    .line 470
    :cond_1a
    const/16 v0, 0x34

    .line 471
    .line 472
    if-ne p2, v0, :cond_1b

    .line 473
    .line 474
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 475
    .line 476
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 477
    .line 478
    .line 479
    move-result-object p0

    .line 480
    sget p2, Ll/tec0;->D1:I

    .line 481
    .line 482
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;

    .line 487
    .line 488
    return-object p0

    .line 489
    :cond_1b
    const/16 v0, 0x2b

    .line 490
    .line 491
    if-ne p2, v0, :cond_1c

    .line 492
    .line 493
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 494
    .line 495
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 496
    .line 497
    .line 498
    move-result-object p0

    .line 499
    sget p2, Ll/tec0;->s3:I

    .line 500
    .line 501
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;

    .line 506
    .line 507
    return-object p0

    .line 508
    :cond_1c
    const/16 v0, 0x2a

    .line 509
    .line 510
    if-ne p2, v0, :cond_1d

    .line 511
    .line 512
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 513
    .line 514
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 515
    .line 516
    .line 517
    move-result-object p0

    .line 518
    sget p2, Ll/tec0;->L0:I

    .line 519
    .line 520
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 521
    .line 522
    .line 523
    move-result-object p0

    .line 524
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;

    .line 525
    .line 526
    return-object p0

    .line 527
    :cond_1d
    const/16 v0, 0x2f

    .line 528
    .line 529
    if-ne p2, v0, :cond_1e

    .line 530
    .line 531
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 532
    .line 533
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 534
    .line 535
    .line 536
    move-result-object p0

    .line 537
    sget p2, Ll/tec0;->c3:I

    .line 538
    .line 539
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 540
    .line 541
    .line 542
    move-result-object p0

    .line 543
    return-object p0

    .line 544
    :cond_1e
    const/16 v0, 0x2e

    .line 545
    .line 546
    if-ne p2, v0, :cond_1f

    .line 547
    .line 548
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 549
    .line 550
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 551
    .line 552
    .line 553
    move-result-object p0

    .line 554
    sget p2, Ll/tec0;->a0:I

    .line 555
    .line 556
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 557
    .line 558
    .line 559
    move-result-object p0

    .line 560
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;

    .line 561
    .line 562
    return-object p0

    .line 563
    :cond_1f
    const/16 v0, 0x31

    .line 564
    .line 565
    if-ne p2, v0, :cond_20

    .line 566
    .line 567
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 568
    .line 569
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 570
    .line 571
    .line 572
    move-result-object p0

    .line 573
    sget p2, Ll/tec0;->Z0:I

    .line 574
    .line 575
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 576
    .line 577
    .line 578
    move-result-object p0

    .line 579
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 580
    .line 581
    return-object p0

    .line 582
    :cond_20
    const/16 v0, 0x30

    .line 583
    .line 584
    if-ne p2, v0, :cond_21

    .line 585
    .line 586
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 587
    .line 588
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 589
    .line 590
    .line 591
    move-result-object p0

    .line 592
    sget p2, Ll/tec0;->b1:I

    .line 593
    .line 594
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 595
    .line 596
    .line 597
    move-result-object p0

    .line 598
    return-object p0

    .line 599
    :cond_21
    const/16 v0, 0x32

    .line 600
    .line 601
    if-ne p2, v0, :cond_22

    .line 602
    .line 603
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 604
    .line 605
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 606
    .line 607
    .line 608
    move-result-object p0

    .line 609
    sget p2, Ll/tec0;->z3:I

    .line 610
    .line 611
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    return-object p0

    .line 616
    :cond_22
    const/16 v0, 0x33

    .line 617
    .line 618
    if-ne p2, v0, :cond_23

    .line 619
    .line 620
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 621
    .line 622
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 623
    .line 624
    .line 625
    move-result-object p0

    .line 626
    sget p2, Ll/tec0;->b3:I

    .line 627
    .line 628
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 629
    .line 630
    .line 631
    move-result-object p0

    .line 632
    return-object p0

    .line 633
    :cond_23
    const/16 v0, 0x37

    .line 634
    .line 635
    if-ne p2, v0, :cond_24

    .line 636
    .line 637
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 638
    .line 639
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 640
    .line 641
    .line 642
    move-result-object p0

    .line 643
    sget p2, Ll/tec0;->o2:I

    .line 644
    .line 645
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 646
    .line 647
    .line 648
    move-result-object p0

    .line 649
    return-object p0

    .line 650
    :cond_24
    const/16 v0, 0x36

    .line 651
    .line 652
    if-ne p2, v0, :cond_25

    .line 653
    .line 654
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 655
    .line 656
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 657
    .line 658
    .line 659
    move-result-object p0

    .line 660
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 661
    .line 662
    .line 663
    move-result-object p2

    .line 664
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->mg()Ll/s1u;

    .line 665
    .line 666
    .line 667
    move-result-object p2

    .line 668
    invoke-interface {p2}, Ll/s1u;->e()I

    .line 669
    .line 670
    .line 671
    move-result p2

    .line 672
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 673
    .line 674
    .line 675
    move-result-object p0

    .line 676
    return-object p0

    .line 677
    :cond_25
    new-instance p1, Landroid/widget/TextView;

    .line 678
    .line 679
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 680
    .line 681
    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 682
    .line 683
    .line 684
    return-object p1
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V
    .locals 25

    move-object/from16 v2, p0

    move-object/from16 v6, p1

    move-object/from16 v3, p2

    move/from16 v7, p3

    move/from16 v12, p4

    .line 1
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->t0(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroidx/recyclerview/widget/RecyclerView$p;

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->S(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 5
    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C:Ll/h80;

    invoke-virtual {v4, v6, v0, v1}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 6
    :cond_0
    invoke-virtual {v2, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j0(I)Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x4

    if-ne v7, v0, :cond_1

    goto/16 :goto_1

    :cond_1
    const/16 v0, 0x8

    if-ne v7, v0, :cond_3

    .line 7
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;

    .line 8
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/see/MomentSeeEntryItemView;->L(Lcom/p1/mobile/putong/app/PutongFrag;Ll/jic0;)V

    :cond_2
    :goto_0
    move v1, v7

    goto/16 :goto_f

    :cond_3
    const/16 v0, 0xd

    if-ne v7, v0, :cond_4

    .line 9
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedTimeViewInList;

    .line 10
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->j:Ljava/lang/String;

    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->g:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v12, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedTimeViewInList;->s(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    :cond_4
    const/16 v0, 0x20

    if-ne v7, v0, :cond_5

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    move-result-object v0

    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLiveApiInfo:Ll/ftn0$a;

    .line 13
    invoke-interface {v0, v6, v1}, Ll/e4h;->d(Landroid/view/View;Ll/ftn0$a;)V

    goto :goto_0

    :cond_5
    const/16 v0, 0x21

    if-ne v7, v0, :cond_6

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    move-result-object v0

    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->feedVoiceUserEntryInfo:Ll/pbi;

    .line 16
    invoke-interface {v0, v6, v1}, Ll/e4h;->f(Landroid/view/View;Ll/pbi;)V

    goto :goto_0

    :cond_6
    const/16 v0, 0x22

    if-ne v7, v0, :cond_7

    .line 17
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 18
    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->o:Ll/pf60;

    iget-object v4, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->q:Ljava/lang/String;

    iget v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p:I

    iget v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    invoke-virtual {v0, v1, v4, v3, v5}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->Y(Ll/pf60;Ljava/lang/String;II)V

    goto :goto_0

    :cond_7
    const/16 v0, 0x23

    if-ne v7, v0, :cond_8

    .line 19
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;

    .line 20
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->r:Ll/pf60;

    invoke-virtual {v0, v1, v4, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;->I(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;ILl/pf60;)V

    goto :goto_0

    :cond_8
    const/16 v0, 0x24

    if-ne v7, v0, :cond_9

    .line 21
    move-object v8, v6

    check-cast v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;

    .line 22
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->p:Ljava/util/HashMap;

    invoke-virtual {v8, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->setShowInputMomentMap(Ljava/util/HashMap;)V

    .line 23
    iget-object v9, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-boolean v10, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    iget v11, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    iget-object v12, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->v:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    iget-object v13, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->w:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    iget-object v14, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual/range {v8 .. v14}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->l(Ljava/lang/String;ZILcom/p1/mobile/putong/feed/data/SingleTopic;Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/Moment;)V

    goto :goto_0

    :cond_9
    const/16 v0, 0x25

    if-ne v7, v0, :cond_a

    .line 24
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;

    .line 25
    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->x:Ll/pf60;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->q:Ljava/lang/String;

    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->R(Ll/pf60;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_a
    const/16 v0, 0x26

    if-ne v7, v0, :cond_b

    .line 26
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 27
    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->y:Ll/pf60;

    iget-object v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    invoke-virtual {v0, v2, v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->W(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Ll/pf60;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_b
    const/16 v0, 0x27

    if-ne v7, v0, :cond_c

    .line 28
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;

    .line 29
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)V

    goto/16 :goto_0

    :cond_c
    const/16 v0, 0x29

    if-ne v7, v0, :cond_d

    .line 30
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;

    .line 31
    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->s:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;->B(Lcom/p1/mobile/putong/feed/data/NearbyOnline;)V

    goto/16 :goto_0

    :cond_d
    const/16 v0, 0x2b

    if-ne v7, v0, :cond_e

    .line 32
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;

    .line 33
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->t:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->I(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_e
    const/16 v0, 0x34

    if-ne v7, v0, :cond_f

    .line 34
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;

    .line 35
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->u:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;->Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/data/MomentViewerBox;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_f
    const/16 v0, 0x2a

    if-ne v7, v0, :cond_10

    .line 36
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;

    .line 37
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-boolean v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    iget-object v5, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->z:Ll/pf60;

    invoke-virtual {v0, v1, v4, v5, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;->L(Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;)V

    goto/16 :goto_0

    :cond_10
    const/16 v0, 0x2f

    if-ne v7, v0, :cond_11

    .line 38
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;

    .line 39
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->mFeedSeeMoreFollowingMomentInfo:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->I(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;)V

    goto/16 :goto_0

    :cond_11
    const/16 v0, 0x37

    if-ne v7, v0, :cond_12

    .line 40
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

    .line 41
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    check-cast v3, Ll/ro00;

    iget-object v3, v3, Ll/ro00;->A:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuide;Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_12
    const/16 v0, 0x36

    if-ne v7, v0, :cond_13

    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v0

    .line 43
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->mg()Ll/s1u;

    move-result-object v0

    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleBanner:Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;

    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->getTripleList()Ljava/util/List;

    move-result-object v1

    iget v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    invoke-interface {v0, v6, v1, v3}, Ll/s1u;->b(Landroid/view/View;Ljava/util/List;I)V

    goto/16 :goto_0

    :cond_13
    if-nez v7, :cond_2

    .line 45
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->p0(Landroid/view/View;)V

    goto/16 :goto_0

    :cond_14
    :goto_1
    add-int/lit8 v0, v12, 0x1

    .line 46
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    move-result-object v0

    const/4 v4, 0x1

    if-eqz v0, :cond_16

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e()Z

    move-result v5

    if-eqz v5, :cond_16

    iget-object v5, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto :goto_2

    :cond_15
    const/4 v0, 0x0

    goto :goto_3

    :cond_16
    :goto_2
    move v0, v4

    .line 48
    :goto_3
    invoke-virtual {v2, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j0(I)Z

    move-result v5

    if-eqz v5, :cond_27

    if-ne v7, v4, :cond_17

    .line 49
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 50
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget v8, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    add-int/2addr v8, v4

    invoke-virtual {v2, v5, v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i0(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 51
    invoke-static {}, Ll/dj70$a;->a()Ll/dj70$a;

    move-result-object v5

    iget-object v8, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 52
    invoke-virtual {v5, v8}, Ll/dj70$a;->d(Lcom/p1/mobile/android/app/Act;)Ll/dj70$a;

    move-result-object v5

    iget-object v8, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 53
    invoke-virtual {v5, v8}, Ll/dj70$a;->g(Ljava/lang/String;)Ll/dj70$a;

    move-result-object v5

    iget-object v8, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 54
    invoke-direct {v2, v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v8

    invoke-virtual {v5, v8}, Ll/dj70$a;->f(Lcom/p1/mobile/putong/feed/data/RawFeed;)Ll/dj70$a;

    move-result-object v5

    .line 55
    invoke-virtual {v5, v12}, Ll/dj70$a;->n(I)Ll/dj70$a;

    move-result-object v5

    iget-object v8, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    invoke-virtual {v5, v8}, Ll/dj70$a;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/dj70$a;

    move-result-object v5

    iget-object v8, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v8, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    iget-boolean v8, v8, Ll/v670;->q:Z

    .line 57
    invoke-virtual {v5, v8}, Ll/dj70$a;->j(Z)Ll/dj70$a;

    move-result-object v5

    iget-object v8, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 58
    invoke-virtual {v5, v8}, Ll/dj70$a;->e(Ll/n570;)Ll/dj70$a;

    move-result-object v5

    const/4 v8, 0x0

    .line 59
    invoke-virtual {v5, v8}, Ll/dj70$a;->l(Landroid/os/Bundle;)Ll/dj70$a;

    move-result-object v5

    .line 60
    invoke-virtual {v5}, Ll/dj70$a;->b()Ll/dj70;

    move-result-object v5

    .line 61
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->E(Ll/dj70;)V

    goto :goto_4

    :cond_17
    const/16 v0, 0x1c

    if-ne v7, v0, :cond_18

    .line 62
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;

    .line 63
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget v8, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    add-int/2addr v8, v4

    invoke-virtual {v2, v5, v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i0(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 64
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    iget-object v8, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v9, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-object v10, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v10, v10, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    iget-boolean v10, v10, Ll/v670;->q:Z

    invoke-virtual {v0, v5, v8, v9, v10}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->c0(Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 65
    :cond_18
    :goto_4
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-boolean v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    invoke-static {v0, v5}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v22

    const/16 v0, 0x15

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x17

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x16

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x18

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x1b

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x1d

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x28

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x2e

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x31

    if-ne v7, v0, :cond_19

    goto :goto_5

    :cond_19
    move/from16 v23, v4

    const/4 v1, 0x0

    goto/16 :goto_7

    .line 66
    :cond_1a
    :goto_5
    iget-object v0, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    move-object v8, v6

    check-cast v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    .line 68
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    invoke-virtual {v8, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->setCurrentFrag(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 69
    iget-object v9, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    iget v10, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    iget-object v11, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-object v13, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n:Ljava/util/HashMap;

    iget v14, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    iget-boolean v15, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    move/from16 v23, v4

    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->o:Ljava/util/HashMap;

    .line 70
    invoke-direct {v2, v11}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_1b

    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    invoke-direct {v2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v1

    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    if-eqz v1, :cond_1b

    move/from16 v18, v23

    goto :goto_6

    :cond_1b
    const/16 v18, 0x0

    :goto_6
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    iget-boolean v1, v1, Ll/v670;->q:Z

    move/from16 v19, v1

    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 72
    invoke-direct {v2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v20

    const/4 v1, 0x0

    .line 73
    invoke-virtual {v2, v12, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e0(IZ)Z

    move-result v21

    move-object/from16 v17, v4

    move/from16 v16, v12

    move-object v12, v5

    .line 74
    invoke-virtual/range {v8 .. v21}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->T(Ll/n570;ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/util/HashMap;IZILjava/util/HashMap;ZZLcom/p1/mobile/putong/feed/data/RawFeed;Z)Z

    move-result v4

    move/from16 v12, v16

    if-eqz v4, :cond_1d

    .line 75
    invoke-static {}, Ll/j4h;->d()Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 76
    iget v4, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v0, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->y0(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 77
    :cond_1c
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    invoke-virtual {v2, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    move-result-object v4

    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->i5(Ljava/lang/String;)V

    .line 78
    :cond_1d
    iget-boolean v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v:Z

    invoke-virtual {v8, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b0(Z)V

    :goto_7
    const/16 v0, 0x32

    if-ne v7, v0, :cond_1e

    .line 79
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;

    .line 80
    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    invoke-virtual {v0, v4, v2, v3, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V

    :cond_1e
    const/16 v0, 0x33

    if-ne v7, v0, :cond_1f

    .line 81
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;

    move/from16 v24, v1

    .line 82
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    iget-object v4, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-direct {v2, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v4

    move v5, v12

    move/from16 v15, v23

    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/data/RawFeed;I)V

    :goto_8
    move-object v0, v2

    move-object v1, v3

    goto :goto_9

    :cond_1f
    move/from16 v24, v1

    move/from16 v15, v23

    goto :goto_8

    :goto_9
    const/16 v2, 0x19

    if-ne v7, v2, :cond_20

    .line 83
    move-object v8, v6

    check-cast v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;

    .line 84
    iget v9, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    iget-object v10, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v11, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-object v13, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n:Ljava/util/HashMap;

    move/from16 v12, p4

    move-object/from16 v14, v22

    invoke-virtual/range {v8 .. v14}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->j(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object v5, v14

    goto :goto_a

    :cond_20
    move-object/from16 v5, v22

    :goto_a
    const/16 v2, 0x35

    if-ne v7, v2, :cond_21

    .line 85
    move-object v2, v6

    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;

    move-object v3, v1

    .line 86
    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    move-object v4, v2

    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    move-object v8, v4

    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n:Ljava/util/HashMap;

    move-object v9, v8

    move-object v8, v0

    move-object v0, v9

    move-object v9, v3

    move/from16 v3, p4

    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    goto :goto_b

    :cond_21
    move-object v8, v0

    move-object v9, v1

    :goto_b
    const/16 v0, 0x1a

    if-ne v7, v0, :cond_22

    .line 87
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;

    .line 88
    iget v1, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    iget-object v10, v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v11, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 89
    invoke-direct {v8, v10}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v14

    move-object v12, v8

    move-object v8, v0

    move-object v0, v12

    move-object v12, v9

    move v9, v1

    move-object v1, v12

    move/from16 v12, p4

    move-object v13, v5

    .line 90
    invoke-virtual/range {v8 .. v14}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    goto :goto_c

    :cond_22
    move-object v0, v8

    move-object v1, v9

    :goto_c
    const/16 v2, 0x30

    if-ne v7, v2, :cond_23

    .line 91
    move-object v2, v6

    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;

    .line 92
    iget v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    move-object v4, v2

    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    move v1, v3

    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    move-object/from16 v9, p2

    move-object v8, v0

    move-object v0, v4

    move/from16 v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/lang/String;)V

    move v12, v4

    goto :goto_d

    :cond_23
    move/from16 v12, p4

    move-object v8, v0

    move-object v9, v1

    :goto_d
    const/4 v0, 0x3

    if-ne v7, v0, :cond_26

    .line 93
    move-object v7, v6

    check-cast v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 94
    iget-object v0, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    invoke-virtual {v7, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->setCurrentFrag(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 95
    iget-object v0, v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 96
    invoke-direct {v8, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object v0, v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 97
    invoke-direct {v8, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v0

    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    if-eqz v0, :cond_24

    move v1, v15

    goto :goto_e

    :cond_24
    move/from16 v1, v24

    .line 98
    :goto_e
    invoke-virtual {v7, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->setRawFeedsCanGreeting(Z)V

    .line 99
    iget-object v0, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    iget-boolean v0, v0, Ll/v670;->q:Z

    iget-object v1, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    iget-object v11, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n:Ljava/util/HashMap;

    iget-object v2, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    iget-boolean v13, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    iget v14, v8, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    iget v3, v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    iget-object v4, v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 100
    invoke-direct {v8, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    move-result-object v16

    iget-object v4, v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 101
    invoke-virtual {v8, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->S(Ljava/lang/String;)I

    move-result v17

    .line 102
    invoke-virtual {v8, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->c0(I)Z

    move-result v18

    .line 103
    invoke-virtual {v8, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Y(I)Z

    move-result v19

    .line 104
    invoke-virtual {v8, v12, v15}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e0(IZ)Z

    move-result v20

    move-object v12, v2

    move v15, v3

    move-object v2, v8

    move-object v10, v9

    move v8, v0

    move-object v9, v1

    move/from16 v0, v24

    move/from16 v1, p3

    .line 105
    invoke-virtual/range {v7 .. v20}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->F1(ZLl/n570;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Ljava/util/HashMap;Ljava/lang/String;ZIILcom/p1/mobile/putong/feed/data/RawFeed;IZZZ)Z

    move-object v3, v10

    .line 106
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 107
    iget-object v4, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->S(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_25

    .line 108
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->B:Ll/h80;

    invoke-virtual {v5, v6, v3, v4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 109
    :cond_25
    iget v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    invoke-virtual {v7, v0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->l2(ZI)V

    goto :goto_f

    :cond_26
    move v1, v7

    move-object v2, v8

    goto :goto_f

    :cond_27
    move v1, v7

    .line 110
    move-object v4, v6

    check-cast v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFeedCommentView;

    .line 111
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    iget-object v7, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    invoke-virtual {v4, v5, v3, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFeedCommentView;->w(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Ljava/lang/String;)V

    .line 112
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFeedCommentView;->y(Z)V

    :goto_f
    const/4 v0, 0x5

    if-ne v1, v0, :cond_28

    .line 113
    move-object v0, v6

    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V

    :cond_28
    return-void
.end method

.method public final P(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/view/View;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    check-cast p2, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    move-object v1, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    if-eqz v4, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->P(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_4
    return-object v1
.end method

.method public Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 14
    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 22
    .line 23
    return-object p0
.end method

.method public S(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->R4()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/ing;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/ing;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    return p0
.end method

.method public T(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->U(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public U(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)I
    .locals 9

    .line 1
    const/4 v0, 0x7

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_24

    .line 10
    .line 11
    instance-of v0, p1, Ll/to00;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/16 p0, 0x32

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    instance-of v0, p1, Ll/so00;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    const/16 p0, 0x33

    .line 23
    .line 24
    return p0

    .line 25
    :cond_2
    iget v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d0()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    const/16 p0, 0x1c

    .line 37
    .line 38
    return p0

    .line 39
    :cond_3
    return v1

    .line 40
    :cond_4
    if-ne v0, v1, :cond_1a

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_5

    .line 49
    .line 50
    const/16 p0, 0x2e

    .line 51
    .line 52
    return p0

    .line 53
    :cond_5
    invoke-static {}, Ll/j4h;->d()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/16 v2, 0x16

    .line 58
    .line 59
    const/16 v3, 0x17

    .line 60
    .line 61
    if-eqz v0, :cond_b

    .line 62
    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->getFromLive(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 72
    .line 73
    iget-boolean v5, v4, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 74
    .line 75
    if-eqz v5, :cond_a

    .line 76
    .line 77
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 78
    .line 79
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 80
    .line 81
    instance-of v5, v5, Lcom/p1/mobile/putong/data/Video;

    .line 82
    .line 83
    if-nez v5, :cond_9

    .line 84
    .line 85
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 86
    .line 87
    instance-of v4, v4, Lcom/p1/mobile/putong/data/Video;

    .line 88
    .line 89
    if-eqz v4, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->b0(Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_7

    .line 97
    .line 98
    const/16 p0, 0x28

    .line 99
    .line 100
    return p0

    .line 101
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 106
    .line 107
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-nez p0, :cond_8

    .line 112
    .line 113
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 116
    .line 117
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_b

    .line 122
    .line 123
    :cond_8
    return v3

    .line 124
    :cond_9
    :goto_0
    return v2

    .line 125
    :cond_a
    iget-boolean p0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 126
    .line 127
    if-eqz p0, :cond_b

    .line 128
    .line 129
    const/16 p0, 0x1d

    .line 130
    .line 131
    return p0

    .line 132
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 133
    .line 134
    invoke-static {p0}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    const/16 v0, 0x1a

    .line 139
    .line 140
    const/4 v4, 0x0

    .line 141
    const/16 v5, 0x31

    .line 142
    .line 143
    if-eqz p0, :cond_13

    .line 144
    .line 145
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 148
    .line 149
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    const/16 v7, 0x19

    .line 154
    .line 155
    const/16 v8, 0x35

    .line 156
    .line 157
    if-eqz v6, :cond_10

    .line 158
    .line 159
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    if-nez v6, :cond_e

    .line 164
    .line 165
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 166
    .line 167
    invoke-static {p0}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_c

    .line 172
    .line 173
    return v5

    .line 174
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 175
    .line 176
    invoke-static {p0}, Ll/ksg;->s0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-eqz p0, :cond_d

    .line 181
    .line 182
    return v8

    .line 183
    :cond_d
    return v7

    .line 184
    :cond_e
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    if-ne v6, v1, :cond_13

    .line 189
    .line 190
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 195
    .line 196
    if-eqz p0, :cond_13

    .line 197
    .line 198
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    if-eqz p0, :cond_f

    .line 207
    .line 208
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    if-nez p0, :cond_13

    .line 217
    .line 218
    :cond_f
    return v0

    .line 219
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 220
    .line 221
    invoke-static {p0}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-eqz p0, :cond_11

    .line 226
    .line 227
    return v5

    .line 228
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 229
    .line 230
    invoke-static {p0}, Ll/ksg;->s0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    if-eqz p0, :cond_12

    .line 235
    .line 236
    return v8

    .line 237
    :cond_12
    return v7

    .line 238
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 239
    .line 240
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 241
    .line 242
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    if-eqz p0, :cond_14

    .line 247
    .line 248
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 249
    .line 250
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 251
    .line 252
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 253
    .line 254
    invoke-static {p0}, Ll/pu20;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    if-nez p0, :cond_14

    .line 263
    .line 264
    const/16 p0, 0x30

    .line 265
    .line 266
    return p0

    .line 267
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 268
    .line 269
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 270
    .line 271
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    if-eqz p0, :cond_15

    .line 276
    .line 277
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 278
    .line 279
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 280
    .line 281
    const-string v1, "type=\"img\""

    .line 282
    .line 283
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 284
    .line 285
    .line 286
    move-result p0

    .line 287
    if-eqz p0, :cond_15

    .line 288
    .line 289
    return v0

    .line 290
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 291
    .line 292
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 293
    .line 294
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result p0

    .line 298
    if-eqz p0, :cond_18

    .line 299
    .line 300
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 301
    .line 302
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 303
    .line 304
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 305
    .line 306
    .line 307
    move-result p0

    .line 308
    if-lez p0, :cond_18

    .line 309
    .line 310
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 311
    .line 312
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 313
    .line 314
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 319
    .line 320
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 321
    .line 322
    if-eqz p1, :cond_16

    .line 323
    .line 324
    return v2

    .line 325
    :cond_16
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Audio;

    .line 326
    .line 327
    if-eqz p0, :cond_17

    .line 328
    .line 329
    const/16 p0, 0x1b

    .line 330
    .line 331
    return p0

    .line 332
    :cond_17
    return v3

    .line 333
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 334
    .line 335
    invoke-static {p0}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 336
    .line 337
    .line 338
    move-result p0

    .line 339
    if-eqz p0, :cond_19

    .line 340
    .line 341
    return v5

    .line 342
    :cond_19
    const/16 p0, 0x15

    .line 343
    .line 344
    return p0

    .line 345
    :cond_1a
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a()Z

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    if-eqz p0, :cond_1b

    .line 350
    .line 351
    const/16 p0, 0x22

    .line 352
    .line 353
    return p0

    .line 354
    :cond_1b
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h()Z

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    if-eqz p0, :cond_1c

    .line 359
    .line 360
    const/16 p0, 0x23

    .line 361
    .line 362
    return p0

    .line 363
    :cond_1c
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->o()Z

    .line 364
    .line 365
    .line 366
    move-result p0

    .line 367
    if-eqz p0, :cond_1d

    .line 368
    .line 369
    const/16 p0, 0x24

    .line 370
    .line 371
    return p0

    .line 372
    :cond_1d
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->j()Z

    .line 373
    .line 374
    .line 375
    move-result p0

    .line 376
    if-eqz p0, :cond_1e

    .line 377
    .line 378
    const/16 p0, 0x25

    .line 379
    .line 380
    return p0

    .line 381
    :cond_1e
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->i()Z

    .line 382
    .line 383
    .line 384
    move-result p0

    .line 385
    if-eqz p0, :cond_1f

    .line 386
    .line 387
    const/16 p0, 0x26

    .line 388
    .line 389
    return p0

    .line 390
    :cond_1f
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->g()Z

    .line 391
    .line 392
    .line 393
    move-result p0

    .line 394
    if-eqz p0, :cond_20

    .line 395
    .line 396
    const/16 p0, 0x29

    .line 397
    .line 398
    return p0

    .line 399
    :cond_20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->f()Z

    .line 400
    .line 401
    .line 402
    move-result p0

    .line 403
    if-eqz p0, :cond_21

    .line 404
    .line 405
    const/16 p0, 0x34

    .line 406
    .line 407
    return p0

    .line 408
    :cond_21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->p()Z

    .line 409
    .line 410
    .line 411
    move-result p0

    .line 412
    if-eqz p0, :cond_22

    .line 413
    .line 414
    const/16 p0, 0x2b

    .line 415
    .line 416
    return p0

    .line 417
    :cond_22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->n()Z

    .line 418
    .line 419
    .line 420
    move-result p0

    .line 421
    if-eqz p0, :cond_23

    .line 422
    .line 423
    const/16 p0, 0x2a

    .line 424
    .line 425
    return p0

    .line 426
    :cond_23
    const/4 p0, 0x3

    .line 427
    return p0

    .line 428
    :cond_24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d()Z

    .line 429
    .line 430
    .line 431
    move-result p0

    .line 432
    if-eqz p0, :cond_25

    .line 433
    .line 434
    const/4 p0, 0x4

    .line 435
    return p0

    .line 436
    :cond_25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->k()Z

    .line 437
    .line 438
    .line 439
    move-result p0

    .line 440
    if-eqz p0, :cond_26

    .line 441
    .line 442
    const/16 p0, 0x8

    .line 443
    .line 444
    return p0

    .line 445
    :cond_26
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->i:Z

    .line 446
    .line 447
    if-eqz p0, :cond_27

    .line 448
    .line 449
    const/16 p0, 0xd

    .line 450
    .line 451
    return p0

    .line 452
    :cond_27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->c()Z

    .line 453
    .line 454
    .line 455
    move-result p0

    .line 456
    if-eqz p0, :cond_28

    .line 457
    .line 458
    const/16 p0, 0x27

    .line 459
    .line 460
    return p0

    .line 461
    :cond_28
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;->card:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 462
    .line 463
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 464
    .line 465
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result p0

    .line 469
    if-eqz p0, :cond_29

    .line 470
    .line 471
    const/16 p0, 0x20

    .line 472
    .line 473
    return p0

    .line 474
    :cond_29
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;->profile:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 475
    .line 476
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 477
    .line 478
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 479
    .line 480
    .line 481
    move-result p0

    .line 482
    if-eqz p0, :cond_2a

    .line 483
    .line 484
    const/16 p0, 0x21

    .line 485
    .line 486
    return p0

    .line 487
    :cond_2a
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->l()Z

    .line 488
    .line 489
    .line 490
    move-result p0

    .line 491
    if-eqz p0, :cond_2b

    .line 492
    .line 493
    const/16 p0, 0x2f

    .line 494
    .line 495
    return p0

    .line 496
    :cond_2b
    instance-of p0, p1, Ll/ro00;

    .line 497
    .line 498
    if-eqz p0, :cond_2c

    .line 499
    .line 500
    const/16 p0, 0x37

    .line 501
    .line 502
    return p0

    .line 503
    :cond_2c
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b()Z

    .line 504
    .line 505
    .line 506
    move-result p0

    .line 507
    if-eqz p0, :cond_2d

    .line 508
    .line 509
    const/16 p0, 0x36

    .line 510
    .line 511
    return p0

    .line 512
    :cond_2d
    return v0
.end method

.method public V(I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-lez p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 68
    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_0
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method

.method public W()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->V4()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public X()Z
    .locals 2

    .line 1
    const-string v0, "from_nearby_focus"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "from_nearby_falls_feed"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string v0, "from_like"

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string v0, "from_discover_dating"

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "from_discover_discussion"

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    const-string v0, "from_activity_tab_one"

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    const-string v0, "from_activity_tab_two"

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_0

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 p0, 0x0

    .line 73
    return p0

    .line 74
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 75
    return p0
.end method

.method public Y(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    sub-int/2addr p1, v0

    .line 3
    const/4 v1, 0x0

    .line 4
    if-ltz p1, :cond_3

    .line 5
    .line 6
    invoke-static {}, Ll/cmg;->e()Lcom/p1/mobile/putong/feed/data/CommunityOptimization;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/CommunityOptimization;->enable:Z

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->getItemViewType(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/16 p1, 0x15

    .line 20
    .line 21
    if-eq p0, p1, :cond_2

    .line 22
    .line 23
    const/16 p1, 0x17

    .line 24
    .line 25
    if-eq p0, p1, :cond_2

    .line 26
    .line 27
    const/16 p1, 0x16

    .line 28
    .line 29
    if-ne p0, p1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return v1

    .line 33
    :cond_2
    :goto_0
    return v0

    .line 34
    :cond_3
    :goto_1
    return v1
.end method

.method public Z()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "from_nearby_focus"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public a0(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

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
    if-lt p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final b0(Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->isMultiCallType()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;->onGoing:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final c0(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    add-int/2addr p1, v1

    .line 11
    if-le v0, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 14
    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->h()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 12
    .line 13
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-int/2addr v0, p1

    .line 20
    const/4 p1, 0x3

    .line 21
    if-ge v0, p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->W()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/n570;->z()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public e0(IZ)Z
    .locals 5

    .line 1
    const/16 v0, 0x16

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    const/16 v2, 0x15

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    if-eqz p2, :cond_3

    .line 10
    .line 11
    sub-int/2addr p1, v4

    .line 12
    if-gez p1, :cond_0

    .line 13
    .line 14
    return v3

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->getItemViewType(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eq p0, v2, :cond_2

    .line 20
    .line 21
    if-eq p0, v1, :cond_2

    .line 22
    .line 23
    if-ne p0, v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v3

    .line 27
    :cond_2
    :goto_0
    return v4

    .line 28
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->getItemViewType(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eq p0, v2, :cond_5

    .line 33
    .line 34
    if-eq p0, v1, :cond_5

    .line 35
    .line 36
    if-ne p0, v0, :cond_4

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_4
    return v3

    .line 40
    :cond_5
    :goto_1
    return v4
.end method

.method public final f0(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "voiceLive"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r:Z

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x7

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x5

    .line 23
    return p0

    .line 24
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->a0(I)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->T(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public i0(Lcom/p1/mobile/putong/feed/data/Moment;I)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    const-string v0, "from_nearby_focus"

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "follow_photo"

    .line 20
    .line 21
    const-string v1, "p_follow"

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v0, "from_like"

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string v0, "like_photo"

    .line 38
    .line 39
    const-string v1, "p_like"

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const-string v0, "from_nearby_falls_feed"

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    const-string v0, "nearby_photo"

    .line 56
    .line 57
    const-string v1, "p_nearby"

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    const-string v0, "from_discover_dating"

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const-string v1, "page"

    .line 72
    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    const-string v0, "p_discover_dating"

    .line 76
    .line 77
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    const-string v0, "from_discover_discussion"

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    const-string v0, "p_discover_discussion"

    .line 92
    .line 93
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 98
    .line 99
    const-string v2, "from_activity_tab_one"

    .line 100
    .line 101
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_5

    .line 106
    .line 107
    invoke-static {v2}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 116
    .line 117
    const-string v2, "from_activity_tab_two"

    .line 118
    .line 119
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    invoke-static {v2}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_6
    return-void
.end method

.method public final j0(I)Z
    .locals 1

    .line 1
    const/4 p0, 0x1

    if-eq p1, p0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/16 v0, 0x15

    if-eq p1, v0, :cond_1

    const/16 v0, 0x16

    if-eq p1, v0, :cond_1

    const/16 v0, 0x17

    if-eq p1, v0, :cond_1

    const/16 v0, 0x18

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1a

    if-eq p1, v0, :cond_1

    const/16 v0, 0x19

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1d

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1c

    if-eq p1, v0, :cond_1

    const/16 v0, 0x28

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2e

    if-eq p1, v0, :cond_1

    const/16 v0, 0x31

    if-eq p1, v0, :cond_1

    const/16 v0, 0x30

    if-eq p1, v0, :cond_1

    const/16 v0, 0x32

    if-eq p1, v0, :cond_1

    const/16 v0, 0x33

    if-eq p1, v0, :cond_1

    const/16 v0, 0x35

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :cond_1
    :goto_0
    return p0
.end method

.method public final k0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "anchorId"

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/pf60;

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "liveId"

    .line 21
    .line 22
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/pf60;

    .line 26
    .line 27
    const-string p0, "p_nearby"

    .line 28
    .line 29
    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const-string p0, "big_card"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string p0, "user_card"

    .line 39
    .line 40
    :goto_0
    const-string v3, "audio_card_type"

    .line 41
    .line 42
    invoke-direct {v2, v3, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance v3, Ll/pf60;

    .line 46
    .line 47
    const-string p0, "audio_tab_id"

    .line 48
    .line 49
    const-string v4, ""

    .line 50
    .line 51
    invoke-direct {v3, p0, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance v4, Ll/pf60;

    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    const/4 v5, 0x0

    .line 67
    if-nez p0, :cond_1

    .line 68
    .line 69
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    goto :goto_1

    .line 74
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;->id:Ljava/lang/String;

    .line 87
    .line 88
    :goto_1
    const-string v5, "topic_id"

    .line 89
    .line 90
    invoke-direct {v4, v5, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    new-instance v5, Ll/pf60;

    .line 94
    .line 95
    const-string p0, "index"

    .line 96
    .line 97
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-direct {v5, p0, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    new-instance v6, Ll/pf60;

    .line 105
    .line 106
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 109
    .line 110
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->maskMode:Z

    .line 111
    .line 112
    if-eqz p0, :cond_2

    .line 113
    .line 114
    const-string p0, "mask_audio"

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_2
    const-string p0, "normal_audio"

    .line 118
    .line 119
    :goto_2
    const-string p1, "audio_room_type"

    .line 120
    .line 121
    invoke-direct {v6, p1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    filled-new-array/range {v0 .. v6}, [Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p1, "e_live_audio_room_enter"

    .line 129
    .line 130
    invoke-static {p1, p3, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public l0()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s:Ljava/util/List;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    move-object v1, v0

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v1, 0x0

    .line 45
    :goto_0
    instance-of v2, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    move-object v1, v0

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 51
    .line 52
    :cond_1
    if-nez v1, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s:Ljava/util/List;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_1
    return-void
.end method

.method public n0(Ll/vg60;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;Z",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p4, 0x1

    .line 2
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 3
    .line 4
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->k:Z

    .line 5
    .line 6
    const-string p2, "-1"

    .line 7
    .line 8
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n:Ljava/util/HashMap;

    .line 15
    .line 16
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {p2, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 22
    .line 23
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_2

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object p2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->z0(Ll/vg60;Ll/vg60;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 51
    .line 52
    .line 53
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->b5()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->g:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->d4:I

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget v3, Ll/lbc0;->i6:I

    .line 37
    .line 38
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    .line 39
    .line 40
    const/16 v5, 0xb0

    .line 41
    .line 42
    if-eqz v4, :cond_8

    .line 43
    .line 44
    if-eq v4, v0, :cond_7

    .line 45
    .line 46
    const/4 v0, 0x3

    .line 47
    if-eq v4, v0, :cond_6

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    if-eq v4, v0, :cond_5

    .line 51
    .line 52
    const/4 v0, 0x6

    .line 53
    if-eq v4, v0, :cond_2

    .line 54
    .line 55
    const/16 v0, 0xb

    .line 56
    .line 57
    if-eq v4, v0, :cond_1

    .line 58
    .line 59
    goto/16 :goto_3

    .line 60
    .line 61
    :cond_1
    const-string v2, "\u9644\u8fd1\u6682\u65e0\u66f4\u591a\u5728\u7ebf\u7528\u6237"

    .line 62
    .line 63
    goto/16 :goto_3

    .line 64
    .line 65
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->t1:I

    .line 70
    .line 71
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i4:I

    .line 77
    .line 78
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    :goto_0
    if-nez v1, :cond_4

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->k:Z

    .line 85
    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    sget v3, Ll/lbc0;->k6:I

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->j4:I

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    move-object v2, v1

    .line 99
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    .line 100
    .line 101
    if-ne v1, v0, :cond_a

    .line 102
    .line 103
    const/16 v5, 0x28

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->V1:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    goto :goto_3

    .line 115
    :cond_6
    sget v3, Ll/lbc0;->h6:I

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->e4:I

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    const/16 v5, 0xa0

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 129
    .line 130
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->d4:I

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_8
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 147
    .line 148
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 151
    .line 152
    iget v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followings:I

    .line 153
    .line 154
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    if-lez v1, :cond_9

    .line 157
    .line 158
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->g4:I

    .line 159
    .line 160
    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    :goto_1
    move-object v2, v1

    .line 165
    goto :goto_2

    .line 166
    :cond_9
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f4:I

    .line 167
    .line 168
    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    goto :goto_1

    .line 173
    :goto_2
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 174
    .line 175
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    :cond_a
    :goto_3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r:Z

    .line 179
    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 183
    .line 184
    const-string v0, "\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528"

    .line 185
    .line 186
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 190
    .line 191
    sget v0, Ll/lbc0;->X2:I

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 197
    .line 198
    int-to-float p1, v5

    .line 199
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 208
    .line 209
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 213
    .line 214
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 218
    .line 219
    int-to-float p1, v5

    .line 220
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;ILjava/util/List;)V
    .locals 4
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$e0;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->getItemViewType(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->Q(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 21
    .line 22
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    iget v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 25
    .line 26
    add-int/2addr v3, v1

    .line 27
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i0(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/dj70$a;->a()Ll/dj70$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/dj70$a;->d(Lcom/p1/mobile/android/app/Act;)Ll/dj70$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/dj70$a;->g(Ljava/lang/String;)Ll/dj70$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ll/dj70$a;->f(Lcom/p1/mobile/putong/feed/data/RawFeed;)Ll/dj70$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, p2}, Ll/dj70$a;->n(I)Ll/dj70$a;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 61
    .line 62
    invoke-virtual {p2, v1}, Ll/dj70$a;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/dj70$a;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    .line 69
    .line 70
    iget-boolean v1, v1, Ll/v670;->q:Z

    .line 71
    .line 72
    invoke-virtual {p2, v1}, Ll/dj70$a;->j(Z)Ll/dj70$a;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 77
    .line 78
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->R(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p2, v0}, Ll/dj70$a;->f(Lcom/p1/mobile/putong/feed/data/RawFeed;)Ll/dj70$a;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Ll/dj70$a;->e(Ll/n570;)Ll/dj70$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0, p3}, Ll/dj70$a;->m(Ljava/util/List;)Ll/dj70$a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const/4 p2, 0x0

    .line 97
    invoke-virtual {p0, p2}, Ll/dj70$a;->l(Landroid/os/Bundle;)Ll/dj70$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ll/dj70$a;->b()Ll/dj70;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->E(Ll/dj70;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/jic0;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->B:Ll/h80;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 2
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->z:J

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C:Ll/h80;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/h80;->o()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->B:Ll/h80;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public p0(Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/hdc0;->T1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    const-string v0, "from_activities_moment"

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_5

    .line 20
    .line 21
    invoke-static {}, Ll/cch;->b()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "from_like"

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 40
    .line 41
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/16 v2, 0x8

    .line 48
    .line 49
    if-lez v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->W()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    sget p0, Ll/hdc0;->w1:I

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    sget p0, Ll/hdc0;->T1:I

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    sget p0, Ll/hdc0;->E0:I

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    sget v0, Ll/hdc0;->w1:I

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    sget v0, Ll/hdc0;->T1:I

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->d0()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_2

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    :cond_2
    sget v0, Ll/hdc0;->T1:I

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const/high16 v1, 0x428c0000    # 70.0f

    .line 122
    .line 123
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 128
    .line 129
    .line 130
    :cond_3
    sget v0, Ll/hdc0;->E0:I

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v:Z

    .line 140
    .line 141
    if-eqz v0, :cond_4

    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 144
    .line 145
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    div-int/lit8 v0, v0, 0x2

    .line 152
    .line 153
    const/4 v1, 0x6

    .line 154
    if-lt v0, v1, :cond_4

    .line 155
    .line 156
    sget p0, Ll/hdc0;->T1:I

    .line 157
    .line 158
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    check-cast p0, Lv/VText;

    .line 163
    .line 164
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->o5:I

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_4
    sget v0, Ll/hdc0;->T1:I

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    check-cast p1, Lv/VText;

    .line 177
    .line 178
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->O:I

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l0()V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_5
    :goto_0
    const/4 p0, 0x4

    .line 188
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public q0(Ll/n570;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 2
    .line 3
    return-void
.end method

.method public r0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r:Z

    .line 2
    .line 3
    return-void
.end method

.method public s0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public final t0(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPostGuideView;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/hello/FeedNearbyOnlineView;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;

    .line 34
    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedGroupView;

    .line 38
    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/guide/FeedMomentViewersOperationGuideView;

    .line 42
    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;

    .line 46
    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;

    .line 50
    .line 51
    if-nez p0, :cond_1

    .line 52
    .line 53
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;

    .line 54
    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 61
    return p0
.end method

.method public final u0()Z
    .locals 2

    .line 1
    sget v0, Ll/ksg;->a:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput v0, Ll/ksg;->a:I

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->j:I

    .line 8
    .line 9
    const/16 v1, 0xe

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->D:I

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->D:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->y:Ll/p8h;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ll/p8h;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/p8h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->y:Ll/p8h;

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->y:Ll/p8h;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/p8h;->c(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public final v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "show_label"

    .line 4
    .line 5
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->k0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v3, "liveId"

    .line 23
    .line 24
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 25
    .line 26
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v3, "anchorId"

    .line 32
    .line 33
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 34
    .line 35
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 36
    .line 37
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v3, "module"

    .line 43
    .line 44
    invoke-virtual {v2, v3, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string v3, "index"

    .line 48
    .line 49
    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 50
    .line 51
    .line 52
    const-string p2, "live_status"

    .line 53
    .line 54
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 55
    .line 56
    if-nez v3, :cond_2

    .line 57
    .line 58
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-nez v3, :cond_1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string v3, "off"

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    :goto_0
    const-string v3, "on"

    .line 71
    .line 72
    :goto_1
    invoke-virtual {v2, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    const-string p2, "liveRecommendCategory"

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 78
    .line 79
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Live;->getRecommendCategory()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v2, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    const-string p2, "right_recommend_type"

    .line 90
    .line 91
    invoke-virtual {v2, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 92
    .line 93
    .line 94
    const-string p2, "live_room_live_type"

    .line 95
    .line 96
    invoke-static {p1}, Ll/dug;->c(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v2, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    .line 102
    .line 103
    new-instance p2, Lorg/json/JSONObject;

    .line 104
    .line 105
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v0, "follow_photo"

    .line 109
    .line 110
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_5

    .line 115
    .line 116
    const-string v0, "nearby_photo"

    .line 117
    .line 118
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_5

    .line 123
    .line 124
    const-string v0, "like_photo"

    .line 125
    .line 126
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    if-eqz p3, :cond_3

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 134
    .line 135
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {p3, v0}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-eqz p3, :cond_4

    .line 146
    .line 147
    const-string p3, "distance"

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->f:Ll/n570;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 158
    .line 159
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 160
    .line 161
    const/4 p1, 0x1

    .line 162
    invoke-static {p0, p1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p2, p3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 167
    .line 168
    .line 169
    :cond_4
    invoke-virtual {v2, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_5
    :goto_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v2, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 176
    .line 177
    .line 178
    :goto_3
    const-string p0, "e_live_room_enter"

    .line 179
    .line 180
    invoke-static {p0, p4, v2}, Ll/i4g0;->z(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :catch_0
    move-exception p0

    .line 185
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "picture_index"

    .line 48
    .line 49
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "moment_id"

    .line 54
    .line 55
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "owner_id"

    .line 62
    .line 63
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    filled-new-array {v2, v3, v4}, [Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v3, "e_moment_repeat_reminder"

    .line 74
    .line 75
    invoke-static {v3, v1, v2}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    :goto_1
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/feed/data/Moment;I)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    const-string v0, "from_nearby_focus"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v1, "page"

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-string v0, "p_follow"

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const-string v0, "from_like"

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const-string v0, "p_like"

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    const-string v0, "from_nearby_falls_feed"

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    const-string v0, "p_nearby"

    .line 56
    .line 57
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->i:Z

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const-string v0, "p_album"

    .line 66
    .line 67
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_4
    const-string v0, "from_discover_dating"

    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_5

    .line 80
    .line 81
    const-string v0, "p_discover_dating"

    .line 82
    .line 83
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_5
    const-string v0, "from_discover_discussion"

    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    const-string v0, "p_discover_discussion"

    .line 98
    .line 99
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 104
    .line 105
    const-string v2, "from_activity_tab_one"

    .line 106
    .line 107
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    invoke-static {v2}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->h:Ljava/lang/String;

    .line 122
    .line 123
    const-string v2, "from_activity_tab_two"

    .line 124
    .line 125
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_8

    .line 130
    .line 131
    invoke-static {v2}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->v0(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_8
    :goto_0
    return-void
.end method

.method public z0(Ll/vg60;Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->w:Ll/nch;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nch;

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->u:I

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ll/nch;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->w:Ll/nch;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->w:Ll/nch;

    .line 15
    .line 16
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 17
    .line 18
    iget-object v1, p2, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {v0, p1, v1}, Ll/nch;->m(Ljava/util/List;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->w:Ll/nch;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p1, v0}, Landroidx/recyclerview/widget/g;->c(Landroidx/recyclerview/widget/g$b;Z)Landroidx/recyclerview/widget/g$e;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->w:Ll/nch;

    .line 33
    .line 34
    iget-object p0, p0, Ll/nch;->c:Ll/epr;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/g$e;->c(Ll/epr;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
