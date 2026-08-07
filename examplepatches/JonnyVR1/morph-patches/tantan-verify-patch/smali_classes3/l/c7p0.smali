.class public Ll/c7p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/e7p0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/x3t;

.field public b:Ll/e7p0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/e7p0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x3t;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ll/x3t;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/c7p0;->a:Ll/x3t;

    .line 11
    .line 12
    iput-object p1, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/c7p0;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Lv/VDraweeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/c7p0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Lv/VDraweeView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/c7p0;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lv/VDraweeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/c7p0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lv/VDraweeView;Landroid/view/View;)V

    return-void
.end method

.method private l(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->d:Lv/VText;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    .line 16
    .line 17
    int-to-double v2, v0

    .line 18
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 23
    .line 24
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v3, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 37
    .line 38
    invoke-virtual {v3, p1, v0, v1, v2}, Ll/e7p0;->m4(Lcom/p1/mobile/putong/data/User;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->d:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ll/e7p0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/e7p0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 2
    .line 3
    return-void
.end method

.method public final d(JZZ)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/civ;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/civ;->n()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C9:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->A9:I

    .line 28
    .line 29
    :goto_0
    invoke-static {p0}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p4, Lcom/p1/mobile/putong/live/livingroom/R$string;->We:I

    .line 34
    .line 35
    invoke-static {p4}, Ll/xau;->t(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    if-eqz p3, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    move-object p0, p4

    .line 43
    :goto_1
    const-wide/32 p3, 0xf423f

    .line 44
    .line 45
    .line 46
    cmp-long p3, p1, p3

    .line 47
    .line 48
    if-lez p3, :cond_3

    .line 49
    .line 50
    long-to-double p3, p1

    .line 51
    invoke-static {p3, p4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/xau;->o(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v1, -0x1

    .line 60
    if-eq v0, v1, :cond_3

    .line 61
    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-static {p3, p4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_3
    new-instance p3, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lv/VDraweeView;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p3, p0, Ll/c7p0;->a:Ll/x3t;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->getClassParseName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p3, v0}, Ll/x3t;->p(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-nez p3, :cond_1

    .line 12
    .line 13
    iget-object p3, p0, Ll/c7p0;->a:Ll/x3t;

    .line 14
    .line 15
    invoke-virtual {p3}, Ll/x3t;->m()V

    .line 16
    .line 17
    .line 18
    iget-object p3, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 19
    .line 20
    invoke-virtual {p3}, Ll/e7p0;->n4()Ll/vak0;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p3}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    iget-wide v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->gap:J

    .line 29
    .line 30
    iget-object p3, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 31
    .line 32
    invoke-virtual {p3}, Ll/e7p0;->n4()Ll/vak0;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    iget-wide v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->wealthRatio:D

    .line 41
    .line 42
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 43
    .line 44
    cmpl-double p3, v2, v4

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    if-nez p3, :cond_0

    .line 48
    .line 49
    move p3, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 p3, 0x0

    .line 52
    :goto_0
    invoke-virtual {p0, v0, v1, v2, p3}, Ll/c7p0;->d(JZZ)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    iget-object p0, p0, Ll/c7p0;->a:Ll/x3t;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->getClassParseName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p2, p3, p1}, Ll/x3t;->D(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Lv/VDraweeView;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p3, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/atm0;->f4()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    iget-object p3, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 10
    .line 11
    invoke-virtual {p3}, Ll/atm0;->f4()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iget-object p3, p0, Ll/c7p0;->a:Ll/x3t;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->getClassParseName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p3, v0}, Ll/x3t;->p(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-nez p3, :cond_1

    .line 40
    .line 41
    iget-object p3, p0, Ll/c7p0;->a:Ll/x3t;

    .line 42
    .line 43
    invoke-virtual {p3}, Ll/x3t;->m()V

    .line 44
    .line 45
    .line 46
    iget-object p3, p0, Ll/c7p0;->a:Ll/x3t;

    .line 47
    .line 48
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->gap:J

    .line 49
    .line 50
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->wealthRatio:D

    .line 51
    .line 52
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 53
    .line 54
    cmpl-double v2, v2, v4

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    if-nez v2, :cond_0

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move v2, v3

    .line 62
    :goto_0
    invoke-virtual {p0, v0, v1, v3, v2}, Ll/c7p0;->d(JZZ)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->getClassParseName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p3, p2, p0, p1}, Ll/x3t;->D(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public final i()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->h:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v1, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/e7p0;->n4()Ll/vak0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/vak0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 16
    .line 17
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/hiv;

    .line 22
    .line 23
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->grade:J

    .line 24
    .line 25
    invoke-virtual {v2, v3, v4}, Ll/hiv;->f(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, 0x0

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    sget v4, Ll/qa00;->v:I

    .line 43
    .line 44
    new-array v2, v2, [Landroid/view/View;

    .line 45
    .line 46
    aput-object v0, v2, v3

    .line 47
    .line 48
    invoke-static {v4, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 54
    .line 55
    new-instance v4, Ll/c7p0$b;

    .line 56
    .line 57
    invoke-direct {v4, p0, v0}, Ll/c7p0$b;-><init>(Ll/c7p0;Lv/VDraweeView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0, v3, v4}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    :goto_0
    new-instance v2, Ll/a7p0;

    .line 68
    .line 69
    invoke-direct {v2, p0, v1, v0}, Ll/a7p0;-><init>(Ll/c7p0;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lv/VDraweeView;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/e7p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/c7p0;->c(Ll/e7p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->d:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->f:Lv/VLinear;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ll/c7p0;->a:Ll/x3t;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 34
    .line 35
    iget-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->j:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 36
    .line 37
    iget-object v4, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->k:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 38
    .line 39
    iget-object v5, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 42
    .line 43
    filled-new-array {v3, v4, v5, v2}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v1, v2}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/c7p0;->a:Ll/x3t;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ll/x3t;->y(Lcom/p1/mobile/putong/data/User;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->f:Lv/VLinear;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->b:Lv/VText;

    .line 73
    .line 74
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->c:Lv/VImage;

    .line 86
    .line 87
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 88
    .line 89
    const-string v3, "male"

    .line 90
    .line 91
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_1

    .line 96
    .line 97
    sget v2, Ll/obc0;->G8:I

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    sget v2, Ll/obc0;->E8:I

    .line 101
    .line 102
    :goto_0
    invoke-static {v2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->b:Lv/VText;

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    xor-int/lit8 v2, v2, 0x1

    .line 118
    .line 119
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 125
    .line 126
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 127
    .line 128
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 129
    .line 130
    invoke-static {v2}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    invoke-direct {p0, p1}, Ll/c7p0;->l(Lcom/p1/mobile/putong/data/User;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 148
    .line 149
    invoke-virtual {v0}, Ll/e7p0;->n4()Ll/vak0;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    if-eqz v0, :cond_2

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    if-eqz v2, :cond_2

    .line 160
    .line 161
    iget-object v2, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 162
    .line 163
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 164
    .line 165
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 166
    .line 167
    sget v3, Ll/n9c0;->e1:I

    .line 168
    .line 169
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 178
    .line 179
    invoke-static {v2, p1, v3, v4}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_2
    iget-object v2, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 184
    .line 185
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    :goto_1
    iget-object p1, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->h:Lv/VDraweeView;

    .line 195
    .line 196
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0}, Ll/vak0;->u()Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_3

    .line 204
    .line 205
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p1}, Ll/vwt;->u7()Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-eqz p1, :cond_3

    .line 214
    .line 215
    invoke-virtual {v0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    if-eqz p1, :cond_3

    .line 220
    .line 221
    invoke-virtual {p0}, Ll/c7p0;->m()V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_3
    invoke-virtual {v0}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    if-eqz p1, :cond_4

    .line 230
    .line 231
    invoke-virtual {v0}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 236
    .line 237
    const-wide/16 v2, 0x0

    .line 238
    .line 239
    cmp-long p1, v0, v2

    .line 240
    .line 241
    if-ltz p1, :cond_4

    .line 242
    .line 243
    invoke-virtual {p0}, Ll/c7p0;->i()V

    .line 244
    .line 245
    .line 246
    :cond_4
    return-void
.end method

.method public k(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Ll/c7p0;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final m()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/c7p0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->h:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v1, p0, Ll/c7p0;->b:Ll/e7p0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/e7p0;->n4()Ll/vak0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 16
    .line 17
    long-to-int v2, v2

    .line 18
    sget-object v3, Ll/htd0;->c:Ll/htd0;

    .line 19
    .line 20
    invoke-static {v3}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ll/hiv;

    .line 25
    .line 26
    invoke-virtual {v3, v2}, Ll/hiv;->x(I)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v3, v2, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v4, 0x0

    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    sget v5, Ll/qa00;->v:I

    .line 44
    .line 45
    new-array v3, v3, [Landroid/view/View;

    .line 46
    .line 47
    aput-object v0, v3, v4

    .line 48
    .line 49
    invoke-static {v5, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 55
    .line 56
    new-instance v4, Ll/c7p0$a;

    .line 57
    .line 58
    invoke-direct {v4, p0, v0}, Ll/c7p0$a;-><init>(Ll/c7p0;Lv/VDraweeView;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v0, v2, v4}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    :goto_0
    new-instance v2, Ll/b7p0;

    .line 69
    .line 70
    invoke-direct {v2, p0, v1, v0}, Ll/b7p0;-><init>(Ll/c7p0;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Lv/VDraweeView;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
