.class public Ll/xjn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qjn0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Landroid/widget/RelativeLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VDraweeView;

.field public o:Lv/VDraweeView;

.field public p:Lv/VText;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/TextView;

.field public s:Ll/qjn0;

.field public t:Ll/c0s;

.field public u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

.field public v:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/xjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xjn0;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/xjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xjn0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/xjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xjn0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/xjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xjn0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/xjn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xjn0;->s(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xjn0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xjn0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/xjn0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 18
    .line 19
    iget-object v0, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Ll/xjn0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->userId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v0, p0}, Ll/qjn0;->P3(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/qjn0;->R3(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xjn0;->t:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/xjn0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/c0s;

    .line 21
    .line 22
    iget-object v2, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 23
    .line 24
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/xjn0;->t:Ll/c0s;

    .line 28
    .line 29
    iget-object v0, p0, Ll/xjn0;->c:Landroid/widget/ImageView;

    .line 30
    .line 31
    new-instance v1, Ll/rjn0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/rjn0;-><init>(Ll/xjn0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/xjn0;->a:Landroid/view/View;

    .line 40
    .line 41
    new-instance v1, Ll/sjn0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/sjn0;-><init>(Ll/xjn0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/xjn0;->q:Landroid/widget/TextView;

    .line 50
    .line 51
    new-instance v1, Ll/tjn0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/tjn0;-><init>(Ll/xjn0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/xjn0;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->b:Lv/VDraweeView;

    .line 62
    .line 63
    new-instance v1, Ll/ujn0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/ujn0;-><init>(Ll/xjn0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/xjn0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->b:Lv/VDraweeView;

    .line 74
    .line 75
    new-instance v1, Ll/vjn0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/vjn0;-><init>(Ll/xjn0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/xjn0;->b:Landroid/widget/FrameLayout;

    .line 84
    .line 85
    new-instance v1, Ll/wjn0;

    .line 86
    .line 87
    invoke-direct {v1}, Ll/wjn0;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/xjn0;->n:Lv/VDraweeView;

    .line 94
    .line 95
    sget-object v0, Ll/zft;->t:Ljava/lang/String;

    .line 96
    .line 97
    const/high16 v1, 0x430c0000    # 140.0f

    .line 98
    .line 99
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    const-string v3, "context_livingAct"

    .line 108
    .line 109
    invoke-static {v3, p0, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    :cond_0
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/qjn0;->R3(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/yjn0;->b(Ll/xjn0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qjn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xjn0;->j(Ll/qjn0;)V

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

.method public j(Ll/qjn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xjn0;->s:Ll/qjn0;

    .line 2
    .line 3
    return-void
.end method

.method public k(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xjn0;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xjn0;->i:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xjn0;->t:Ll/c0s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xjn0;->t:Ll/c0s;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xjn0;->e:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "context_single_room"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/xjn0;->f:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v2, p0, Ll/xjn0;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2, p1, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/xjn0;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

    .line 35
    .line 36
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Ll/xjn0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1, p1, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/xjn0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;

    .line 55
    .line 56
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xjn0;->q:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/graphics/ColorMatrix;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Landroid/graphics/ColorMatrixColorFilter;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/xjn0;->k:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/xjn0;->k:Lv/VDraweeView;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "context_single_room"

    .line 32
    .line 33
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/xjn0;->l:Lv/VText;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v1, p0, Ll/xjn0;->m:Lv/VText;

    .line 50
    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/4 v0, 0x1

    .line 59
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/xjn0;->m:Lv/VText;

    .line 63
    .line 64
    invoke-static {}, Ll/u8n;->a()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->re:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->me:I

    .line 74
    .line 75
    :goto_0
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, v3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    iget-object v0, p0, Ll/xjn0;->r:Landroid/widget/TextView;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/xjn0;->q:Landroid/widget/TextView;

    .line 92
    .line 93
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

    .line 94
    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 98
    .line 99
    sget v1, Ll/n9c0;->e1:I

    .line 100
    .line 101
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    goto :goto_2

    .line 106
    :cond_2
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 107
    .line 108
    sget v1, Ll/n9c0;->l1:I

    .line 109
    .line 110
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    :goto_2
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_3

    .line 122
    .line 123
    iget-object p1, p0, Ll/xjn0;->o:Lv/VDraweeView;

    .line 124
    .line 125
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->userAvatar:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v2, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Ll/xjn0;->p:Lv/VText;

    .line 131
    .line 132
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->userName:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    :cond_3
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/xjn0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xjn0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/xjn0;->k(Z)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/xjn0;->u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/xjn0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xjn0;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/xjn0;->w(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/xjn0;->t:Ll/c0s;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/xjn0;->t:Ll/c0s;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
