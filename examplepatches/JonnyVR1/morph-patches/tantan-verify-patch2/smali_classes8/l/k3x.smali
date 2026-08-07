.class public Ll/k3x;
.super Ll/hzw;
.source "SourceFile"

# interfaces
.implements Ll/xyl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/k3x$b;,
        Ll/k3x$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/f3x;",
        ">;",
        "Ll/xyl;"
    }
.end annotation


# static fields
.field public static l:Lcom/p1/mobile/putong/data/User;


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public f:Lv/VText;

.field public g:Lv/VRecyclerView;

.field public h:Ll/f3x;

.field public i:Ll/k3x$b;

.field public j:I

.field public k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/k3x;->j:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic j(Ll/k3x;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k3x;->A(Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ll/k3x;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k3x;->z(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic n(Ll/k3x;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k3x;->v()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k3x;->F(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "preprocessed"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 12
    .line 13
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 18
    .line 19
    new-instance p1, Ll/sim;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {p1, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    iget-object p1, p1, Ll/sim;->d:[I

    .line 33
    .line 34
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 35
    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 38
    .line 39
    const-string p1, "image/jpeg"

    .line 40
    .line 41
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 42
    .line 43
    iget p1, p0, Ll/k3x;->j:I

    .line 44
    .line 45
    if-gez p1, :cond_0

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object p0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public C(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    iget v0, p0, Ll/k3x;->j:I

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 24
    .line 25
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z1(Lcom/p1/mobile/putong/data/Video;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 42
    .line 43
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public E(Ll/vg60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    instance-of v4, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/k3x;->f:Lv/VText;

    .line 59
    .line 60
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    xor-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/k3x;->i:Ll/k3x$b;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/k3x$b;->F(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 8
    .line 9
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 10
    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 34
    .line 35
    return-void
.end method

.method public P3(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k3x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "\u6700\u591a\u53ef\u4ee5\u4e0a\u4f20"

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/k3x;->w()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    if-le p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/k3x;->v()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 31
    .line 32
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 33
    .line 34
    if-lt v0, v1, :cond_1

    .line 35
    .line 36
    new-instance p1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 42
    .line 43
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p0, "\u5f20\u7167\u7247"

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v2

    .line 61
    :cond_0
    invoke-virtual {p0}, Ll/k3x;->w()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/lit8 v0, v0, -0x1

    .line 70
    .line 71
    if-le p1, v0, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/k3x;->u()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object v1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 82
    .line 83
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 84
    .line 85
    if-lt v0, v1, :cond_1

    .line 86
    .line 87
    new-instance p1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 93
    .line 94
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p0, "\u5f20\u751f\u6d3b\u77ac\u95f4"

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return v2

    .line 112
    :cond_1
    invoke-super {p0, p1}, Ll/xyl;->P3(I)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    return p0
.end method

.method public Q1()Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k3x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 13
    .line 14
    iget-object v0, v0, Ll/ura;->W:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    xor-int/lit8 v1, v0, 0x1

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 43
    .line 44
    iget-object v0, v0, Ll/ura;->W:Ll/byd0;

    .line 45
    .line 46
    invoke-static {}, Ll/pzi0;->o()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/k3x;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const-string p0, "\u6709\u6b63\u5728\u4e0a\u4f20\u7684\u56fe\u7247"

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-ne p1, p2, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/k3x;->v()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 p1, 0x3

    .line 28
    if-lt p0, p1, :cond_1

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    const-string p0, "\u8bf7\u81f3\u5c11\u4e0a\u4f20\u4e09\u5f20\u7167\u7247"

    .line 32
    .line 33
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return v0

    .line 37
    :cond_2
    invoke-virtual {p0}, Ll/k3x;->u()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string p0, "\u8bf7\u81f3\u5c11\u4e0a\u4f20\u4e00\u5f20\u7167\u7247\uff0c\u5e0c\u671b\u6bcf\u4e2a\u52a0\u5165\u7684\u4eba\u90fd\u80fd\u5c55\u793a\u771f\u5b9e\u7684\u81ea\u6211"

    .line 48
    .line 49
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v0

    .line 53
    :cond_3
    return v1
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/k3x;->v()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, 0x3

    .line 16
    if-lt p0, p1, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    return v1

    .line 20
    :cond_1
    invoke-virtual {p0}, Ll/k3x;->u()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_2

    .line 29
    .line 30
    return v2

    .line 31
    :cond_2
    return v1
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k3x;->v()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 39
    .line 40
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/k3x;->u()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 51
    .line 52
    return-void
.end method

.method public e1()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 14
    .line 15
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0(ILcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public f2(ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/xyl;->f2(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/k3x;->j:I

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {v0, p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->j6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/16 p2, 0x6000

    .line 27
    .line 28
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getSelfActions()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k3x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->c:I

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {p0}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iput-object p1, p0, Ll/k3x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    iget-object v0, p0, Ll/k3x;->c:Lv/VText;

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setSlideWithoutPress(Z)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    sput-object p2, Ll/k3x;->l:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    sget-object v4, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_UPLOAD_PHOTOS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 37
    .line 38
    if-ne p1, v4, :cond_0

    .line 39
    .line 40
    iget-object v4, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 41
    .line 42
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->setEnableLowPhotoValid(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Ll/k3x;->c:Lv/VText;

    .line 46
    .line 47
    const-string v5, "\u8bf7\u4e0a\u4f20\u81f3\u5c113\u5f20\u7167\u7247"

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v4, p0, Ll/k3x;->d:Lv/VText;

    .line 53
    .line 54
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 58
    .line 59
    sget v4, Ll/qa00;->o:I

    .line 60
    .line 61
    invoke-static {v3, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-nez v3, :cond_1

    .line 71
    .line 72
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_0
    iget-object v3, p0, Ll/k3x;->d:Lv/VText;

    .line 76
    .line 77
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 81
    .line 82
    sget v4, Ll/qa00;->y:I

    .line 83
    .line 84
    invoke-static {v3, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 85
    .line 86
    .line 87
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 88
    .line 89
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_1

    .line 94
    .line 95
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 98
    .line 99
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_1

    .line 104
    .line 105
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 106
    .line 107
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 108
    .line 109
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 110
    .line 111
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_1

    .line 116
    .line 117
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 118
    .line 119
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 120
    .line 121
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 122
    .line 123
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-nez v4, :cond_1

    .line 130
    .line 131
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-eqz v4, :cond_1

    .line 140
    .line 141
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    check-cast v4, Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    const-string v6, "normal"

    .line 152
    .line 153
    invoke-static {v6}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    iput-object v6, v5, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 158
    .line 159
    iput-object v4, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 160
    .line 161
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_1
    :goto_1
    invoke-virtual {p0, p2, v0, p1}, Ll/k3x;->y(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)V

    .line 166
    .line 167
    .line 168
    new-instance p1, Ll/k3x$b;

    .line 169
    .line 170
    invoke-direct {p1, p0}, Ll/k3x$b;-><init>(Ll/k3x;)V

    .line 171
    .line 172
    .line 173
    iput-object p1, p0, Ll/k3x;->i:Ll/k3x$b;

    .line 174
    .line 175
    iget-object p1, p0, Ll/k3x;->f:Lv/VText;

    .line 176
    .line 177
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p1, v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 182
    .line 183
    .line 184
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/k3x;->g:Lv/VRecyclerView;

    .line 194
    .line 195
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/k3x;->g:Lv/VRecyclerView;

    .line 199
    .line 200
    iget-object v0, p0, Ll/k3x;->i:Ll/k3x$b;

    .line 201
    .line 202
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 212
    .line 213
    iget-object v0, v0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    new-instance v0, Ll/g3x;

    .line 220
    .line 221
    invoke-direct {v0, p0, p2}, Ll/g3x;-><init>(Ll/k3x;Lcom/p1/mobile/putong/data/User;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f3x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k3x;->s(Ll/f3x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k3x;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n0(IZZZ)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/xyl;->n0(IZZZ)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/k3x;->j:I

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    const/16 p2, 0x312

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    invoke-virtual {p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p0, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 49
    .line 50
    .line 51
    sget p2, Ll/z7c0;->h:I

    .line 52
    .line 53
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    const/high16 p3, 0x42200000    # 40.0f

    .line 58
    .line 59
    const v1, 0x3f4ccccd    # 0.8f

    .line 60
    .line 61
    .line 62
    if-eqz p4, :cond_1

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {}, Ll/bnl0;->y0()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    sub-int/2addr v2, p3

    .line 89
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->setCroppingNewStyle(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    invoke-virtual {p0, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 118
    .line 119
    .line 120
    sget p2, Ll/z7c0;->h:I

    .line 121
    .line 122
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 127
    .line 128
    .line 129
    move-result-object p4

    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-static {}, Ll/bnl0;->y0()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    sub-int/2addr v2, p3

    .line 151
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object p3

    .line 155
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 164
    .line 165
    .line 166
    move-result-object p4

    .line 167
    invoke-virtual {p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 168
    .line 169
    .line 170
    move-result-object p4

    .line 171
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 172
    .line 173
    .line 174
    move-result-object p4

    .line 175
    invoke-virtual {p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 176
    .line 177
    .line 178
    move-result-object p4

    .line 179
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 184
    .line 185
    .line 186
    move-result-object p3

    .line 187
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 188
    .line 189
    .line 190
    move-result-object p3

    .line 191
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 192
    .line 193
    .line 194
    move-result-object p3

    .line 195
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 196
    .line 197
    .line 198
    move-result-object p3

    .line 199
    invoke-virtual {p0, p3, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 200
    .line 201
    .line 202
    sget p2, Ll/z7c0;->h:I

    .line 203
    .line 204
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m3x;->b(Ll/k3x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 9
    .line 10
    iget-object p0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z0()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s(Ll/f3x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k3x;->h:Ll/f3x;

    .line 2
    .line 3
    return-void
.end method

.method public u()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/k3x;->w()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "http"

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    new-instance v1, Ljava/lang/RuntimeException;

    .line 36
    .line 37
    new-instance v3, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v4, "AbnormalURL_GetReordersList_RuntimeException:"

    .line 40
    .line 41
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object p0, p0, Ll/k3x;->i:Ll/k3x$b;

    .line 58
    .line 59
    invoke-static {p0}, Ll/k3x$b;->z(Ll/k3x$b;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    new-instance v1, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_3

    .line 83
    .line 84
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 89
    .line 90
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-eqz v4, :cond_2

    .line 97
    .line 98
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    move-object p0, v1

    .line 103
    :cond_4
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v1, ""

    .line 108
    .line 109
    const/4 v3, 0x0

    .line 110
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-eqz v4, :cond_6

    .line 115
    .line 116
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 121
    .line 122
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-nez v5, :cond_5

    .line 129
    .line 130
    new-instance v3, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    const/4 v3, 0x1

    .line 146
    :cond_5
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_6
    if-eqz v3, :cond_7

    .line 151
    .line 152
    new-instance p0, Ljava/lang/RuntimeException;

    .line 153
    .line 154
    new-instance v2, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v3, "AbnormalURL_SelectedList_RuntimeException:"

    .line 157
    .line 158
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 172
    .line 173
    .line 174
    :cond_7
    return-object v0
.end method

.method public final v()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    const/4 v2, 0x6

    .line 16
    if-ge v1, v2, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    iget-object v2, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 43
    .line 44
    const-string v3, "normal"

    .line 45
    .line 46
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    iget-object v2, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 53
    .line 54
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    return-object v0
.end method

.method public w()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    new-instance v1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    const/4 v3, 0x6

    .line 21
    if-ge v2, v3, :cond_1

    .line 22
    .line 23
    iget-object v3, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 24
    .line 25
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_1

    .line 36
    .line 37
    iget-object v3, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 51
    .line 52
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 57
    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 61
    .line 62
    const-string v4, "normal"

    .line 63
    .line 64
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_0

    .line 69
    .line 70
    iget-object v3, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 71
    .line 72
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 81
    .line 82
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    return-object v0
.end method

.method public x()Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :goto_0
    const/4 v4, 0x6

    .line 18
    if-ge v2, v4, :cond_2

    .line 19
    .line 20
    iget-object v4, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 21
    .line 22
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 27
    .line 28
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-nez v4, :cond_2

    .line 33
    .line 34
    iget-object v4, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 35
    .line 36
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 41
    .line 42
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 48
    .line 49
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 54
    .line 55
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 56
    .line 57
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 58
    .line 59
    const-string v5, "normal"

    .line 60
    .line 61
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-nez v4, :cond_0

    .line 66
    .line 67
    add-int/lit8 v3, v3, 0x1

    .line 68
    .line 69
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    move v3, v1

    .line 73
    :cond_2
    if-lez v3, :cond_3

    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_3
    return v1
.end method

.method public final y(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/xra;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x6

    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    invoke-static {}, Ll/xra;->n()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    :goto_0
    if-ge v3, v2, :cond_10

    .line 18
    .line 19
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 20
    .line 21
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-ge v3, p3, :cond_1

    .line 32
    .line 33
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    check-cast p3, Lcom/p1/mobile/putong/data/Media;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move-object p3, v1

    .line 41
    :goto_1
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 45
    .line 46
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setMediaOperation(Ll/xyl;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 56
    .line 57
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 62
    .line 63
    new-instance p3, Ll/j3x;

    .line 64
    .line 65
    invoke-direct {p3}, Ll/j3x;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/xra;->j()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 78
    .line 79
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 84
    .line 85
    const-string p3, "p_edit_profile_view"

    .line 86
    .line 87
    invoke-virtual {p1, v3, p3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 91
    .line 92
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 97
    .line 98
    sget-object p3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 99
    .line 100
    invoke-virtual {p1, v3, p3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0(ILcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-ne v3, p1, :cond_3

    .line 108
    .line 109
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 110
    .line 111
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P1()V

    .line 118
    .line 119
    .line 120
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    :goto_2
    invoke-static {}, Ll/xra;->q()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_5

    .line 128
    .line 129
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 130
    .line 131
    if-ne p3, v0, :cond_5

    .line 132
    .line 133
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_5
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 140
    .line 141
    invoke-static {}, Ll/xra;->n()Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-eqz v4, :cond_6

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_6
    const/16 v2, 0x9

    .line 149
    .line 150
    :goto_3
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 151
    .line 152
    .line 153
    :goto_4
    iget-object v0, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 154
    .line 155
    new-instance v2, Ll/h3x;

    .line 156
    .line 157
    invoke-direct {v2, p0, p1}, Ll/h3x;-><init>(Ll/k3x;Lcom/p1/mobile/putong/data/User;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->q(Ljava/lang/Runnable;)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 164
    .line 165
    const/4 v0, 0x1

    .line 166
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->setEnableLowPhotoValid(Z)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Ll/xra;->n()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_7

    .line 174
    .line 175
    iget-object p1, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 176
    .line 177
    new-instance v2, Ll/k3x$a;

    .line 178
    .line 179
    invoke-direct {v2, p0}, Ll/k3x$a;-><init>(Ll/k3x;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setReorderCardsCallback(Ll/t4m;)V

    .line 183
    .line 184
    .line 185
    :cond_7
    move p1, v3

    .line 186
    :goto_5
    iget-object v2, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 187
    .line 188
    iget v4, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 189
    .line 190
    if-ge p1, v4, :cond_10

    .line 191
    .line 192
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 197
    .line 198
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    if-ge p1, v4, :cond_8

    .line 203
    .line 204
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 209
    .line 210
    goto :goto_6

    .line 211
    :cond_8
    move-object v4, v1

    .line 212
    :goto_6
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setMediaOperation(Ll/xyl;)V

    .line 213
    .line 214
    .line 215
    iget-object v5, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u:Lv/VImage;

    .line 216
    .line 217
    if-nez p1, :cond_9

    .line 218
    .line 219
    sget v6, Ll/kbc0;->s1:I

    .line 220
    .line 221
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 222
    .line 223
    .line 224
    goto :goto_7

    .line 225
    :cond_9
    sget v6, Ll/kbc0;->q1:I

    .line 226
    .line 227
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 228
    .line 229
    .line 230
    :goto_7
    if-lez p1, :cond_a

    .line 231
    .line 232
    move v5, v0

    .line 233
    goto :goto_8

    .line 234
    :cond_a
    move v5, v3

    .line 235
    :goto_8
    iput-boolean v5, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 236
    .line 237
    if-nez p1, :cond_b

    .line 238
    .line 239
    move v5, v0

    .line 240
    goto :goto_9

    .line 241
    :cond_b
    move v5, v3

    .line 242
    :goto_9
    iput-boolean v5, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 243
    .line 244
    invoke-static {}, Ll/xra;->q()Z

    .line 245
    .line 246
    .line 247
    move-result v5

    .line 248
    if-eqz v5, :cond_c

    .line 249
    .line 250
    sget-object v5, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 251
    .line 252
    if-ne p3, v5, :cond_c

    .line 253
    .line 254
    invoke-virtual {v2, v3, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 255
    .line 256
    .line 257
    goto :goto_a

    .line 258
    :cond_c
    invoke-static {}, Ll/xra;->n()Z

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    xor-int/2addr v5, v0

    .line 263
    invoke-virtual {v2, v5, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 264
    .line 265
    .line 266
    :goto_a
    iget-object v5, p0, Ll/k3x;->h:Ll/f3x;

    .line 267
    .line 268
    invoke-virtual {v5}, Ll/gzw;->f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 273
    .line 274
    .line 275
    move-result v5

    .line 276
    if-eqz v5, :cond_d

    .line 277
    .line 278
    sget-object v5, Ll/tr90;->k:Ljava/lang/String;

    .line 279
    .line 280
    goto :goto_b

    .line 281
    :cond_d
    sget-object v5, Ll/tr90;->j:Ljava/lang/String;

    .line 282
    .line 283
    :goto_b
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setDataFrom(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setMediaOperation(Ll/xyl;)V

    .line 290
    .line 291
    .line 292
    new-instance v5, Ll/i3x;

    .line 293
    .line 294
    invoke-direct {v5}, Ll/i3x;-><init>()V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 298
    .line 299
    .line 300
    iget-object v5, p0, Ll/k3x;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 301
    .line 302
    invoke-virtual {v5, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 303
    .line 304
    .line 305
    move-result-object v5

    .line 306
    check-cast v5, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 307
    .line 308
    sget-object v6, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 309
    .line 310
    invoke-virtual {v5, p1, v6}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0(ILcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V

    .line 311
    .line 312
    .line 313
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    if-ne p1, v5, :cond_e

    .line 318
    .line 319
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P1()V

    .line 320
    .line 321
    .line 322
    :cond_e
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result v5

    .line 326
    if-eqz v5, :cond_f

    .line 327
    .line 328
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 329
    .line 330
    const-string v6, "normal"

    .line 331
    .line 332
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    if-nez v5, :cond_f

    .line 337
    .line 338
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 339
    .line 340
    .line 341
    :cond_f
    add-int/lit8 p1, p1, 0x1

    .line 342
    .line 343
    goto/16 :goto_5

    .line 344
    .line 345
    :cond_10
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k3x;->F(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
