.class public Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/RelativeLayout;

.field public B:Lv/VText;

.field public C:Lv/VImage;

.field public D:Landroid/widget/LinearLayout;

.field public E:Ll/kcg0;

.field public F:Ll/x3t;

.field public a:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public s:Lv/VImage;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VText;

.field public v:Landroid/widget/FrameLayout;

.field public w:Lv/VText;

.field public x:Landroid/widget/LinearLayout;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->j(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic d(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic e(Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q4t;->a(Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i(JJ)Ljava/lang/String;
    .locals 3

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    const-string v0, "\u4eba\u6c14"

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p1, "\u4e0a\u699c\u8fd8\u9700"

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p3, p4}, Ll/icr;->b(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    const-wide/16 v1, 0x1

    .line 32
    .line 33
    cmp-long p0, p1, v1

    .line 34
    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p1, "\u9886\u5148"

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p3, p4}, Ll/icr;->b(J)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string p1, "\u843d\u540e"

    .line 62
    .line 63
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p3, p4}, Ll/icr;->b(J)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public final synthetic j(Ljava/lang/Long;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v4, 0x2

    .line 16
    .line 17
    rem-long/2addr v0, v4

    .line 18
    cmp-long p1, v0, v2

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x(Landroid/view/View;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x(Landroid/view/View;Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->m:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->k:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final l(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->c:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Ll/okc0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final m(D)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/p6s;->u0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 15
    .line 16
    sget v1, Ll/n9c0;->E0:I

    .line 17
    .line 18
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/p6s;->s0()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C7:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->W5:I

    .line 39
    .line 40
    :goto_0
    sget-object v1, Ll/htd0;->f:Ll/htd0;

    .line 41
    .line 42
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ll/civ;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/civ;->n()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Td:I

    .line 55
    .line 56
    :cond_1
    invoke-static {}, Ll/xau;->B()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 61
    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    new-instance p0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Ll/p6s;->s0()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_3

    .line 107
    .line 108
    sget p1, Ll/obc0;->M3:I

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    sget p1, Ll/obc0;->n:I

    .line 112
    .line 113
    :goto_1
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    check-cast p2, Ll/civ;

    .line 118
    .line 119
    invoke-virtual {p2}, Ll/civ;->n()Z

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-eqz p2, :cond_4

    .line 124
    .line 125
    sget p1, Ll/obc0;->k3:I

    .line 126
    .line 127
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-static {p2, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 141
    .line 142
    sget p1, Ll/qa00;->c:I

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public final n(Ljava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, "male"

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget v1, Ll/obc0;->V5:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v1, Ll/obc0;->T5:I

    .line 19
    .line 20
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->i:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->h:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const p1, -0xa18f02

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const p1, -0x7c767

    .line 38
    .line 39
    .line 40
    :goto_1
    const/high16 v0, 0x40a00000    # 5.0f

    .line 41
    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    invoke-static {p1, v0}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->j:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->j:Lv/VText;

    .line 62
    .line 63
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public o(Ll/y20;Ll/nsv;Ll/cm0;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v4, ""

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p(Ll/y20;Ll/nsv;Ll/cm0;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Ll/y20;Ll/nsv;Ll/cm0;Ljava/lang/String;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->E:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->v:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->D:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->m:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->c:Lv/VText;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->A:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    xor-int/2addr v3, v2

    .line 40
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 44
    .line 45
    const/high16 v3, 0x42540000    # 53.0f

    .line 46
    .line 47
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->e:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    const/high16 v3, 0x42f20000    # 121.0f

    .line 57
    .line 58
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->e:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    const/high16 v3, 0x42be0000    # 95.0f

    .line 68
    .line 69
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-static {v0, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->t:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    sget v3, Ll/qa00;->i:I

    .line 79
    .line 80
    invoke-static {v0, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 86
    .line 87
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    if-nez v0, :cond_0

    .line 99
    .line 100
    goto/16 :goto_3

    .line 101
    .line 102
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 103
    .line 104
    sget v4, Ll/qa00;->A:I

    .line 105
    .line 106
    new-instance v5, Ll/j4t;

    .line 107
    .line 108
    invoke-direct {v5, v0}, Ll/j4t;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v3, v4, p2, v5, v2}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 112
    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->f:Lv/VText;

    .line 115
    .line 116
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p2}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Ll/e3t;->d()Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-eqz v3, :cond_1

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->k()V

    .line 132
    .line 133
    .line 134
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->s:Lv/VImage;

    .line 135
    .line 136
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->s:Lv/VImage;

    .line 141
    .line 142
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 146
    .line 147
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 152
    .line 153
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->n(Ljava/lang/String;I)V

    .line 158
    .line 159
    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->h:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-nez v4, :cond_2

    .line 167
    .line 168
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v4}, Ll/vwt;->b7()Z

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    if-nez v4, :cond_2

    .line 177
    .line 178
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-virtual {v4}, Ll/vwt;->b7()Z

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    if-nez v4, :cond_2

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_2
    move v2, v1

    .line 190
    :goto_0
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    iget-object v2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 194
    .line 195
    move-object v3, v2

    .line 196
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 197
    .line 198
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 199
    .line 200
    if-eqz v3, :cond_3

    .line 201
    .line 202
    move-object v3, v2

    .line 203
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 204
    .line 205
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 206
    .line 207
    iget-wide v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 208
    .line 209
    const-wide/16 v5, 0x0

    .line 210
    .line 211
    cmp-long v3, v3, v5

    .line 212
    .line 213
    if-lez v3, :cond_3

    .line 214
    .line 215
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 216
    .line 217
    iget-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 218
    .line 219
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->v(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    .line 220
    .line 221
    .line 222
    goto :goto_1

    .line 223
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l:Lv/VDraweeView;

    .line 224
    .line 225
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    :goto_1
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->s(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V

    .line 229
    .line 230
    .line 231
    :goto_2
    iget-object p3, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 232
    .line 233
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 234
    .line 235
    iget-wide v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 236
    .line 237
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->m(D)V

    .line 238
    .line 239
    .line 240
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 241
    .line 242
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 243
    .line 244
    invoke-virtual {p0, p4, p2, p5}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;Z)V

    .line 245
    .line 246
    .line 247
    if-eqz p1, :cond_4

    .line 248
    .line 249
    new-instance p2, Ll/k4t;

    .line 250
    .line 251
    invoke-direct {p2, p1, v0}, Ll/k4t;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    :cond_4
    :goto_3
    return-void
.end method

.method public q(ZLcom/p1/mobile/android/app/Act;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->E:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->v:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->A:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p1, 0x1

    .line 21
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->A:Landroid/widget/RelativeLayout;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p3, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 32
    .line 33
    iget-wide v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 34
    .line 35
    iget p3, p4, Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;->baseAmount:I

    .line 36
    .line 37
    int-to-double v4, p3

    .line 38
    sget-object p3, Ll/htd0;->c:Ll/htd0;

    .line 39
    .line 40
    invoke-static {p3}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    check-cast p3, Ll/hiv;

    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    iget p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveLoveLeaderboard;->medalId:I

    .line 52
    .line 53
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p4, ""

    .line 57
    .line 58
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v6, "live"

    .line 66
    .line 67
    invoke-virtual {p3, v0, v6, p4}, Ll/hiv;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-static {}, Ll/eb20;->b()Z

    .line 72
    .line 73
    .line 74
    move-result p4

    .line 75
    if-eqz p3, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->z:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 78
    .line 79
    const/4 v6, 0x0

    .line 80
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->z:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 84
    .line 85
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->getStaticUrl()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveMedal;->getDynamicUrl()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-static {v0, v6, p3}, Ll/biv;->j(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 97
    .line 98
    const/high16 v0, 0x3f800000    # 1.0f

    .line 99
    .line 100
    invoke-virtual {p3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 104
    .line 105
    const/4 v6, 0x0

    .line 106
    invoke-virtual {p3, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 107
    .line 108
    .line 109
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 110
    .line 111
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 115
    .line 116
    invoke-virtual {p3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 117
    .line 118
    .line 119
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 120
    .line 121
    invoke-virtual {p3, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 122
    .line 123
    .line 124
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    cmpl-double p3, v2, v4

    .line 130
    .line 131
    if-ltz p3, :cond_3

    .line 132
    .line 133
    if-eqz p4, :cond_2

    .line 134
    .line 135
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 136
    .line 137
    const-string p3, "\u606d\u559c\u8363\u767b\u5ba0\u7231\u699c"

    .line 138
    .line 139
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 143
    .line 144
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 148
    .line 149
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->y:Lv/VText;

    .line 154
    .line 155
    const-string p3, "\u8363\u767b\u5ba0\u7231\u699c,\u5df2\u5f97"

    .line 156
    .line 157
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 166
    .line 167
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_3
    double-to-int p3, v2

    .line 172
    int-to-double v2, p3

    .line 173
    sub-double/2addr v4, v2

    .line 174
    double-to-int p3, v4

    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 176
    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    const-string v3, "\u5dee"

    .line 180
    .line 181
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p3, "\u4eba\u6c14\u8363\u767b\u5ba0\u7231\u699c"

    .line 188
    .line 189
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p3

    .line 196
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->y:Lv/VText;

    .line 200
    .line 201
    const-string v0, "\u8363\u767b\u5ba0\u7231\u699c\u5f97"

    .line 202
    .line 203
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 207
    .line 208
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->x:Landroid/widget/LinearLayout;

    .line 212
    .line 213
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    if-nez p4, :cond_4

    .line 217
    .line 218
    const-wide/16 p3, 0x3

    .line 219
    .line 220
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 221
    .line 222
    invoke-static {p3, p4, p1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 235
    .line 236
    .line 237
    move-result-object p2

    .line 238
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    new-instance p2, Ll/n4t;

    .line 243
    .line 244
    invoke-direct {p2, p0}, Ll/n4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;)V

    .line 245
    .line 246
    .line 247
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->E:Ll/kcg0;

    .line 256
    .line 257
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->w:Lv/VText;

    .line 258
    .line 259
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->y:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 270
    .line 271
    .line 272
    move-result-object p2

    .line 273
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    add-int/lit8 p2, p2, 0x4

    .line 278
    .line 279
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->e:Landroid/widget/LinearLayout;

    .line 284
    .line 285
    mul-int/lit8 p1, p1, 0xc

    .line 286
    .line 287
    int-to-float p1, p1

    .line 288
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 293
    .line 294
    .line 295
    return-void
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->D:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/cm0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->F:Ll/x3t;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/x3t;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, v1}, Ll/x3t;-><init>(Z)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->F:Ll/x3t;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ll/x3t;->E(Ll/cm0;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->F:Ll/x3t;

    .line 33
    .line 34
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ll/x3t;->C(Ll/ner;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->F:Ll/x3t;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/x3t;->l()V

    .line 46
    .line 47
    .line 48
    const/4 p2, 0x2

    .line 49
    invoke-static {p2}, Ll/wft;->b(I)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->F:Ll/x3t;

    .line 54
    .line 55
    if-nez p2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 64
    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 66
    .line 67
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 68
    .line 69
    filled-new-array {v1, v2, v3, v4}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, p2, v1}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 86
    .line 87
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 88
    .line 89
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 90
    .line 91
    filled-new-array {v1, v2, v3, v4, v5}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, p2, v1}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->F:Ll/x3t;

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ll/x3t;->y(Lcom/p1/mobile/putong/data/User;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public t(Ll/y20;Ll/nsv;Ll/cm0;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 9
    .line 10
    sget v2, Ll/qa00;->D:I

    .line 11
    .line 12
    new-instance v3, Ll/l4t;

    .line 13
    .line 14
    invoke-direct {v3, v0}, Ll/l4t;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-static {v1, v2, p2, v3, v4}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/e3t;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->f:Lv/VText;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-static {p2}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    iget-object p2, p2, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->k()V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->s:Lv/VImage;

    .line 48
    .line 49
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_2

    .line 53
    .line 54
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->s:Lv/VImage;

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->n(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->h:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-nez v3, :cond_2

    .line 87
    .line 88
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3}, Ll/vwt;->b7()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-nez v3, :cond_2

    .line 97
    .line 98
    move v3, v4

    .line 99
    goto :goto_0

    .line 100
    :cond_2
    move v3, v2

    .line 101
    :goto_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0, p4}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u(Lcom/p1/mobile/putong/data/User;Z)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 108
    .line 109
    move-object v1, p2

    .line 110
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 113
    .line 114
    if-eqz v1, :cond_3

    .line 115
    .line 116
    move-object v1, p2

    .line 117
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 120
    .line 121
    iget-wide v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 122
    .line 123
    const-wide/16 v7, 0x0

    .line 124
    .line 125
    cmp-long v1, v5, v7

    .line 126
    .line 127
    if-lez v1, :cond_3

    .line 128
    .line 129
    if-nez p4, :cond_3

    .line 130
    .line 131
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 132
    .line 133
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 134
    .line 135
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->v(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l:Lv/VDraweeView;

    .line 140
    .line 141
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->m:Lv/VDraweeView;

    .line 145
    .line 146
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->s(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V

    .line 150
    .line 151
    .line 152
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->k:Landroid/widget/TextView;

    .line 153
    .line 154
    if-eqz p4, :cond_4

    .line 155
    .line 156
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->k:Landroid/widget/TextView;

    .line 160
    .line 161
    iget-object p3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 162
    .line 163
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 164
    .line 165
    invoke-static {p3}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->k:Landroid/widget/TextView;

    .line 173
    .line 174
    iget-object p3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 175
    .line 176
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 177
    .line 178
    invoke-static {p3}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 179
    .line 180
    .line 181
    move-result p3

    .line 182
    const/high16 p4, 0x40000000    # 2.0f

    .line 183
    .line 184
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 185
    .line 186
    .line 187
    move-result p4

    .line 188
    int-to-float p4, p4

    .line 189
    invoke-static {p3, p4}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 194
    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_4
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    :goto_2
    new-instance p2, Ll/m4t;

    .line 201
    .line 202
    invoke-direct {p2, p1, v0}, Ll/m4t;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 8
    .line 9
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 40
    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    iget-object p2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 46
    .line 47
    :goto_0
    move-object v0, p2

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v2, " "

    .line 62
    .line 63
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    goto :goto_0

    .line 74
    :cond_1
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    xor-int/2addr p1, v1

    .line 86
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/kny;->a(J)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget v0, Ll/i0k;->b:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget v0, Ll/i0k;->a:I

    .line 29
    .line 30
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->l:Lv/VDraweeView;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final w(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->A:Landroid/widget/RelativeLayout;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string v0, "currentWeek"

    .line 15
    .line 16
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_7

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    invoke-static {}, Ll/eb20;->b()Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->A:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    if-eqz p3, :cond_1

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 37
    .line 38
    const-string p2, "\u795e\u79d8\u4eba\u8eab\u4efd\u65e0\u6cd5\u4e0a\u699c"

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->u:Lv/VText;

    .line 44
    .line 45
    sget p1, Ll/n9c0;->l1:I

    .line 46
    .line 47
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->C:Lv/VImage;

    .line 59
    .line 60
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->B:Lv/VText;

    .line 64
    .line 65
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 66
    .line 67
    int-to-long v0, p3

    .line 68
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->gap:D

    .line 69
    .line 70
    double-to-long p2, p2

    .line 71
    invoke-virtual {p0, v0, v1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->i(JJ)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->B:Lv/VText;

    .line 79
    .line 80
    sget p1, Ll/n9c0;->l1:I

    .line 81
    .line 82
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    iget-boolean p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isNewUser:Z

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->C:Lv/VImage;

    .line 93
    .line 94
    if-eqz p3, :cond_3

    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->B:Lv/VText;

    .line 100
    .line 101
    const-string p2, "NEW"

    .line 102
    .line 103
    invoke-static {p1, p2}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->B:Lv/VText;

    .line 107
    .line 108
    const-string p1, "#FF603D"

    .line 109
    .line 110
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->B:Lv/VText;

    .line 122
    .line 123
    sget p3, Ll/n9c0;->l1:I

    .line 124
    .line 125
    invoke-static {p3}, Ll/n3d0;->a(I)I

    .line 126
    .line 127
    .line 128
    move-result p3

    .line 129
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->B:Lv/VText;

    .line 133
    .line 134
    new-instance p3, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v0, "\u672c\u5468\u6392\u540d"

    .line 137
    .line 138
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 142
    .line 143
    if-nez v0, :cond_4

    .line 144
    .line 145
    const-string v0, ""

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    :goto_0
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    invoke-static {p1, p3}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    iget p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 163
    .line 164
    if-lez p1, :cond_5

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->C:Lv/VImage;

    .line 167
    .line 168
    sget p1, Ll/obc0;->Z5:I

    .line 169
    .line 170
    invoke-static {p0, p1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->C:Lv/VImage;

    .line 175
    .line 176
    if-gez p1, :cond_6

    .line 177
    .line 178
    sget p1, Ll/obc0;->X5:I

    .line 179
    .line 180
    invoke-static {p0, p1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_6
    sget p1, Ll/obc0;->Y5:I

    .line 185
    .line 186
    invoke-static {p0, p1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_7
    const-string p2, "lastWeek"

    .line 191
    .line 192
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_8

    .line 197
    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->A:Landroid/widget/RelativeLayout;

    .line 199
    .line 200
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    :cond_8
    return-void
.end method

.method public final x(Landroid/view/View;Landroid/view/View;)V
    .locals 13

    .line 1
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/qa00;->i:I

    .line 7
    .line 8
    int-to-float v0, p0

    .line 9
    const/4 v8, 0x2

    .line 10
    new-array v7, v8, [F

    .line 11
    .line 12
    const/4 v9, 0x0

    .line 13
    aput v0, v7, v9

    .line 14
    .line 15
    const/4 v10, 0x1

    .line 16
    const/4 v11, 0x0

    .line 17
    aput v11, v7, v10

    .line 18
    .line 19
    const-string v1, "translationY"

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    const-wide/16 v4, 0x1f4

    .line 24
    .line 25
    move-object v0, p1

    .line 26
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    move-object v12, v0

    .line 31
    neg-int p0, p0

    .line 32
    int-to-float p0, p0

    .line 33
    new-array v7, v8, [F

    .line 34
    .line 35
    aput v11, v7, v9

    .line 36
    .line 37
    aput p0, v7, v10

    .line 38
    .line 39
    const-string v1, "translationY"

    .line 40
    .line 41
    move-object v0, p2

    .line 42
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-array v7, v8, [F

    .line 47
    .line 48
    fill-array-data v7, :array_0

    .line 49
    .line 50
    .line 51
    const-string v1, "alpha"

    .line 52
    .line 53
    const-wide/16 v2, 0xa6

    .line 54
    .line 55
    const-wide/16 v4, 0x14d

    .line 56
    .line 57
    move-object v0, v12

    .line 58
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v9

    .line 62
    new-array v7, v8, [F

    .line 63
    .line 64
    fill-array-data v7, :array_1

    .line 65
    .line 66
    .line 67
    const-string v1, "alpha"

    .line 68
    .line 69
    const-wide/16 v2, 0x0

    .line 70
    .line 71
    move-object v0, p2

    .line 72
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    filled-new-array {p1, p0, v9, p2}, [Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p1, Ll/o4t;

    .line 85
    .line 86
    invoke-direct {p1, v12, v0}, Ll/o4t;-><init>(Landroid/view/View;Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p0, p1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    new-instance p1, Ll/p4t;

    .line 93
    .line 94
    invoke-direct {p1, v12, v0}, Ll/p4t;-><init>(Landroid/view/View;Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    nop

    .line 105
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
