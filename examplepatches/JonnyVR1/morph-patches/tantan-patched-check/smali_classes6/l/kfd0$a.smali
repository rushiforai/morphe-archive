.class public final Ll/kfd0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kfd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public s:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public t:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public u:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "NA"

    .line 5
    .line 6
    iput-object v0, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/kfd0$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/kfd0$a;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Ll/kfd0$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "page"

    .line 15
    .line 16
    iput-object v1, p0, Ll/kfd0$a;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, ""

    .line 19
    .line 20
    iput-object v1, p0, Ll/kfd0$a;->f:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, p0, Ll/kfd0$a;->g:Ljava/lang/Object;

    .line 23
    .line 24
    iput-object v1, p0, Ll/kfd0$a;->h:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, p0, Ll/kfd0$a;->i:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, p0, Ll/kfd0$a;->k:Ljava/lang/String;

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    iput v1, p0, Ll/kfd0$a;->l:I

    .line 32
    .line 33
    iput-object v0, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "0"

    .line 36
    .line 37
    iput-object v0, p0, Ll/kfd0$a;->o:Ljava/lang/String;

    .line 38
    .line 39
    return-void
.end method

.method public synthetic constructor <init>(Ll/lfd0;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ll/kfd0$a;-><init>()V

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/Object;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public B(J)Ll/kfd0$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/kfd0$a;->h:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public C(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public D(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Ll/kfd0;
    .locals 2

    .line 1
    new-instance v0, Ll/kfd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kfd0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/kfd0$a;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/kfd0;->k(Ll/kfd0;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/kfd0$a;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/kfd0;->p(Ll/kfd0;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/kfd0$a;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/kfd0;->f(Ll/kfd0;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/kfd0;->a(Ll/kfd0;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/kfd0$a;->g:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/kfd0;->q(Ll/kfd0;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/kfd0$a;->h:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/kfd0;->t(Ll/kfd0;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/kfd0$a;->d:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/kfd0;->l(Ll/kfd0;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/kfd0$a;->e:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/kfd0;->o(Ll/kfd0;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/kfd0$a;->i:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/kfd0;->u(Ll/kfd0;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/kfd0$a;->j:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/kfd0;->n(Ll/kfd0;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/kfd0$a;->k:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/kfd0;->e(Ll/kfd0;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget v1, p0, Ll/kfd0$a;->l:I

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/kfd0;->r(Ll/kfd0;I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/kfd0$a;->n:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/kfd0;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/kfd0$a;->o:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/kfd0;->i(Ll/kfd0;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/kfd0$a;->q:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/kfd0;->b(Ll/kfd0;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/kfd0$a;->r:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/kfd0;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/kfd0$a;->s:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/kfd0;->g(Ll/kfd0;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Ll/kfd0$a;->t:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/kfd0;->j(Ll/kfd0;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/kfd0$a;->u:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/kfd0;->d(Ll/kfd0;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/kfd0;->m(Ll/kfd0;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/kfd0$a;->p:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0, p0}, Ll/kfd0;->s(Ll/kfd0;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/kfd0$a;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->getRecommendCategoryForTrack()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/kfd0$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const-string v0, "NA"

    .line 27
    .line 28
    iget-object v1, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    move-object v1, p1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, Ll/kfd0$a;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 52
    .line 53
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 60
    .line 61
    .line 62
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/kfd0$a;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->getRecommendCategoryForTrack()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/kfd0$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/kfd0$a;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 39
    .line 40
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 43
    .line 44
    .line 45
    return-object p0
.end method

.method public final d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p2, p1}, Ll/mfd0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "NA"

    .line 26
    .line 27
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;->showLiveId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    return p0
.end method

.method public g(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/kfd0$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/kfd0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public m(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)Ll/kfd0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "1"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "0"

    .line 7
    .line 8
    :goto_0
    iput-object p1, p0, Ll/kfd0$a;->s:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public o(Z)Ll/kfd0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "1"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "0"

    .line 7
    .line 8
    :goto_0
    iput-object p1, p0, Ll/kfd0$a;->n:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public p(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/kfd0$a;->c:Ljava/lang/String;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public s(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RoomEnterTrackParamsBuilder{anchorId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', index=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/kfd0$a;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', liveId=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/kfd0$a;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', liveRecommendCategory=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/kfd0$a;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', module=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/kfd0$a;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', rightRecommendType=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/kfd0$a;->f:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', showLabel="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/kfd0$a;->g:Ljava/lang/Object;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", traceId=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/kfd0$a;->h:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', windowType=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/kfd0$a;->i:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', liveStatus=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Ll/kfd0$a;->j:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', from=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/kfd0$a;->k:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, "\', subIndex="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Ll/kfd0$a;->l:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", isGif=\'"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/kfd0$a;->n:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\', isRedPacket=\'"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/kfd0$a;->o:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "\', currentAnchorId=\'"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/kfd0$a;->q:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "\', currentLiveId=\'"

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/kfd0$a;->r:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, "\', isAutoShow=\'"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Ll/kfd0$a;->s:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, "\', liveEnterSource=\'"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Ll/kfd0$a;->t:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string p0, "\'}"

    .line 184
    .line 185
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/kfd0$a;
    .locals 1

    .line 1
    const-string v0, "stopped"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "off"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "on"

    .line 13
    .line 14
    :goto_0
    iput-object p1, p0, Ll/kfd0$a;->j:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public v(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/lang/String;)Ll/kfd0$a;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/kfd0$a;->e:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/kfd0$a;->f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/kfd0$a;->e(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 14
    .line 15
    const-string p1, "perform_room"

    .line 16
    .line 17
    iput-object p1, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;
    .locals 1

    .line 1
    const-string v0, "officialShow"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "NA"

    .line 12
    .line 13
    iput-object p1, p0, Ll/kfd0$a;->a:Ljava/lang/String;

    .line 14
    .line 15
    const-string p1, "perform_room"

    .line 16
    .line 17
    iput-object p1, p0, Ll/kfd0$a;->m:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    return-object p0
.end method

.method public z(Ljava/lang/String;)Ll/kfd0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfd0$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
