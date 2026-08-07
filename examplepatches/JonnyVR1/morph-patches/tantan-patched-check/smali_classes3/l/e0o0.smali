.class public Ll/e0o0;
.super Ll/qo2;
.source "SourceFile"


# instance fields
.field public A:Lcom/google/android/material/tabs/TabLayout;

.field public B:Lv/VPagerNoPage;

.field public C:Landroid/widget/LinearLayout;

.field public D:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Landroid/widget/TextView;

.field public i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public j:Landroid/widget/FrameLayout;

.field public k:Landroid/widget/ImageView;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Landroid/widget/RelativeLayout;

.field public v:Landroid/widget/TextView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireProgressView;

.field public x:Landroid/widget/LinearLayout;

.field public y:Landroidx/recyclerview/widget/RecyclerView;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qo2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/e0o0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e0o0;->y(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V

    return-void
.end method

.method public static synthetic l(Ll/e0o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0o0;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/e0o0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e0o0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/nsv;)Ll/nsv;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic p(Ll/nsv;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic q(Ll/e0o0;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e0o0;->A(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/nsv;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic u(Ll/nsv;)Ll/nsv;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
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
.method public final synthetic A(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e0o0;->D:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 8
    .line 9
    invoke-virtual {p2, p0, v0, p1}, Ll/ayn0;->N0(Landroid/view/ViewGroup;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final B(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b0o0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b0o0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/c0o0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/c0o0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, v0, v1}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object v0, p0, Ll/e0o0;->e:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Ll/nsv;

    .line 24
    .line 25
    new-instance v1, Ll/d0o0;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Ll/d0o0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, p2, v1}, Ll/ql3;->c(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/nsv;Ll/qcj;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Ll/e0o0;->b:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/qo2;->a:Ll/ayn0;

    .line 40
    .line 41
    invoke-virtual {p2}, Ll/ayn0;->z0()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iget-object v1, p0, Ll/e0o0;->c:Lv/VDraweeView;

    .line 46
    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/e0o0;->c:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const/16 p2, 0x8

    .line 72
    .line 73
    const-string v1, "context_livingAct"

    .line 74
    .line 75
    invoke-static {v1, p0, p1, v0, p2}, Ll/izs;->p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e0o0;->u:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->li:I

    .line 10
    .line 11
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->totalCount:I

    .line 12
    .line 13
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->currentCount:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->totalCount:I

    .line 25
    .line 26
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->currentCount:I

    .line 27
    .line 28
    sub-int/2addr v1, v2

    .line 29
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/2addr v1, v2

    .line 42
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 43
    .line 44
    invoke-direct {v3, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 48
    .line 49
    const-string v4, "#fe7e1d"

    .line 50
    .line 51
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-direct {v0, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 56
    .line 57
    .line 58
    const/16 v4, 0x21

    .line 59
    .line 60
    invoke-virtual {v3, v0, v2, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Landroid/text/style/AbsoluteSizeSpan;

    .line 64
    .line 65
    const/16 v5, 0x10

    .line 66
    .line 67
    invoke-static {v5}, Ll/qa00;->f(I)I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    invoke-direct {v0, v5}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v0, v2, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/e0o0;->v:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/e0o0;->u:Landroid/widget/RelativeLayout;

    .line 83
    .line 84
    new-instance v1, Ll/a0o0;

    .line 85
    .line 86
    invoke-direct {v1, p0, p1}, Ll/a0o0;-><init>(Ll/e0o0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/e0o0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireProgressView;

    .line 93
    .line 94
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->currentCount:I

    .line 95
    .line 96
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->totalCount:I

    .line 97
    .line 98
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireProgressView;->b(II)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    const/4 p0, 0x0

    .line 103
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final E(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p3 .. p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v1, :cond_2

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v4, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 17
    .line 18
    invoke-direct {v4}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v5, v0, Ll/e0o0;->y:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    new-instance v6, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 24
    .line 25
    iget-object v7, v0, Ll/qo2;->a:Ll/ayn0;

    .line 26
    .line 27
    invoke-virtual {v7}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    invoke-direct {v6, v7, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 35
    .line 36
    .line 37
    iget-object v5, v0, Ll/e0o0;->y:Landroidx/recyclerview/widget/RecyclerView;

    .line 38
    .line 39
    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 40
    .line 41
    .line 42
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    new-instance v6, Ll/xzn0;

    .line 47
    .line 48
    invoke-direct {v6}, Ll/xzn0;-><init>()V

    .line 49
    .line 50
    .line 51
    new-instance v7, Ll/yzn0;

    .line 52
    .line 53
    invoke-direct {v7}, Ll/yzn0;-><init>()V

    .line 54
    .line 55
    .line 56
    move-object/from16 v8, p4

    .line 57
    .line 58
    invoke-static {v8, v6, v7}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    move v7, v3

    .line 63
    :goto_0
    if-ge v7, v5, :cond_0

    .line 64
    .line 65
    move-object/from16 v8, p3

    .line 66
    .line 67
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    move-object v12, v9

    .line 72
    check-cast v12, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;

    .line 73
    .line 74
    iget-object v9, v12, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v9

    .line 80
    move-object v13, v9

    .line 81
    check-cast v13, Ll/nsv;

    .line 82
    .line 83
    new-instance v10, Ll/jdn0;

    .line 84
    .line 85
    iget-object v11, v0, Ll/qo2;->a:Ll/ayn0;

    .line 86
    .line 87
    move-object/from16 v15, p1

    .line 88
    .line 89
    move-object/from16 v14, p2

    .line 90
    .line 91
    invoke-direct/range {v10 .. v15}, Ll/jdn0;-><init>(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;Ll/nsv;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    new-instance v9, Ll/zzn0;

    .line 98
    .line 99
    invoke-direct {v9, v0, v15, v14, v13}, Ll/zzn0;-><init>(Ll/e0o0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v10, v9}, Ll/d3q;->z(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    add-int/lit8 v7, v7, 0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    const/16 v6, 0x1e

    .line 113
    .line 114
    if-lt v5, v6, :cond_1

    .line 115
    .line 116
    new-instance v5, Ll/sdn0;

    .line 117
    .line 118
    invoke-direct {v5}, Ll/sdn0;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_1
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, v0, Ll/e0o0;->x:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v1, v0, Ll/e0o0;->C:Landroid/widget/LinearLayout;

    .line 133
    .line 134
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    iget-object v1, v0, Ll/e0o0;->x:Landroid/widget/LinearLayout;

    .line 139
    .line 140
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v1, v0, Ll/e0o0;->C:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    :goto_1
    iget-object v0, v0, Ll/e0o0;->z:Landroid/widget/LinearLayout;

    .line 149
    .line 150
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/e0o0;->h:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ayn0;->z0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    xor-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->name:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/e0o0;->h:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/e0o0;->h:Landroid/widget/TextView;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/e0o0;->f:Landroid/widget/TextView;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e0o0;->n:Lv/VText;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 4
    .line 5
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/e0o0;->o:Lv/VText;

    .line 13
    .line 14
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/e0o0;->m:Lv/VText;

    .line 24
    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 26
    .line 27
    const-wide/16 v3, 0x3e8

    .line 28
    .line 29
    mul-long/2addr v1, v3

    .line 30
    invoke-static {v1, v2}, Ll/kdu;->W(J)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/e0o0;->r:Lv/VText;

    .line 38
    .line 39
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 40
    .line 41
    int-to-double v1, v1

    .line 42
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/e0o0;->j:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    new-instance v1, Ll/vzn0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/vzn0;-><init>(Ll/e0o0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->giftItems:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v1, p0, Ll/e0o0;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    const/4 v3, 0x0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/e0o0;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 81
    .line 82
    const-string v1, "https://auto.tancdn.com/v1/raw/574b190b-2eb2-4226-a8e1-51cded992fe811.so"

    .line 83
    .line 84
    const/4 v4, -0x1

    .line 85
    invoke-virtual {v0, v1, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/e0o0;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 89
    .line 90
    new-instance v1, Ll/wzn0;

    .line 91
    .line 92
    invoke-direct {v1, p0, p1}, Ll/wzn0;-><init>(Ll/e0o0;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object v0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/ayn0;->z0()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_1

    .line 105
    .line 106
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Ll/e0o0;->p:Lv/VText;

    .line 115
    .line 116
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/e0o0;->s:Lv/VText;

    .line 120
    .line 121
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_1
    const-string v0, "pop"

    .line 126
    .line 127
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iget-object v1, p0, Ll/e0o0;->p:Lv/VText;

    .line 134
    .line 135
    if-eqz v0, :cond_2

    .line 136
    .line 137
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ci:I

    .line 138
    .line 139
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/e0o0;->s:Lv/VText;

    .line 147
    .line 148
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 149
    .line 150
    invoke-static {v4, v5}, Ll/yau;->c(D)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->hi:I

    .line 159
    .line 160
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/e0o0;->s:Lv/VText;

    .line 168
    .line 169
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 170
    .line 171
    invoke-static {v4, v5}, Ll/yau;->c(D)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    :goto_1
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 179
    .line 180
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Ll/civ;

    .line 185
    .line 186
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_3

    .line 191
    .line 192
    iget-object v0, p0, Ll/e0o0;->p:Lv/VText;

    .line 193
    .line 194
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ii:I

    .line 195
    .line 196
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    :cond_3
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Ll/vwt;->o7()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    iget-object v1, p0, Ll/e0o0;->q:Lv/VText;

    .line 212
    .line 213
    if-eqz v0, :cond_4

    .line 214
    .line 215
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Ll/e0o0;->t:Lv/VText;

    .line 219
    .line 220
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    iget-object p0, p0, Ll/e0o0;->t:Lv/VText;

    .line 224
    .line 225
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 226
    .line 227
    int-to-double v0, p1

    .line 228
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_4
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 237
    .line 238
    .line 239
    iget-object p0, p0, Ll/e0o0;->t:Lv/VText;

    .line 240
    .line 241
    invoke-static {p0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 242
    .line 243
    .line 244
    return-void
.end method

.method public b(Ll/ayn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ayn0;->O0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/e0o0;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 8
    .line 9
    iget-object v2, p0, Ll/e0o0;->B:Lv/VPagerNoPage;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/e0o0;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    new-instance v2, Ll/e0o0$a;

    .line 17
    .line 18
    invoke-direct {v2, p0, v0}, Ll/e0o0$a;-><init>(Ll/e0o0;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/e0o0;->B:Lv/VPagerNoPage;

    .line 25
    .line 26
    new-instance v2, Ll/lxn0;

    .line 27
    .line 28
    invoke-direct {v2, v0}, Ll/lxn0;-><init>(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/e0o0;->x:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/e0o0;->z:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/e0o0;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/e0o0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p7}, Ll/e0o0;->B(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p6}, Ll/e0o0;->G(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p4}, Ll/e0o0;->C(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/vwt;->o7()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2, p5, p7}, Ll/qo2;->d(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2, p5, p7}, Ll/e0o0;->E(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/e0o0;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e0o0;->b(Ll/ayn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e0o0;->w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f0o0;->b(Ll/e0o0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->h5Url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ayn0;->Q0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/qo2;->j(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ayn0;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
