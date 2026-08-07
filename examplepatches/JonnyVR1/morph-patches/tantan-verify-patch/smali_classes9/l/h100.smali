.class public Ll/h100;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h100$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/s000;",
        ">;",
        "Landroidx/viewpager/widget/ViewPager$j;"
    }
.end annotation


# static fields
.field public static A:Ljava/lang/String; = "bubble_moment_expand_like_guide"


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VPager;

.field public d:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public e:Lv/VRelative;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public n:Ll/s000;

.field public o:Ll/h100$e;

.field public p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

.field public q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/kcg0;

.field public s:Ll/kcg0;

.field public t:Ll/kcg0;

.field public u:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

.field public v:Lcom/p1/mobile/putong/core/data/MessageMomentGuide;

.field public w:Ll/kcg0;

.field public x:Ll/l4g0;

.field public y:I

.field public z:Landroid/view/GestureDetector;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/h100;->q:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Landroid/view/GestureDetector;

    .line 12
    .line 13
    iget-object v1, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    new-instance v2, Ll/h100$d;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/h100$d;-><init>(Ll/h100;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/h100;->z:Landroid/view/GestureDetector;

    .line 24
    .line 25
    iput-object p1, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    return-void
.end method

.method public static bridge synthetic A(Ll/h100;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h100;->b0()V

    return-void
.end method

.method private J()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

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
    iget-object p0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->V()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/h100;->I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->S()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100;->Q(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method

.method public static synthetic b(Ll/h100;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h100;->L(Landroid/view/View;)V

    return-void
.end method

.method private b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

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
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->b0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/h100;->I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->X()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/Throwable;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->d(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0, p2}, Ll/r97;->z3(Ljava/lang/Throwable;)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    const-string v3, "p_moment_view"

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    move-object v2, p0

    .line 28
    move v6, p1

    .line 29
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Yc(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;ZIZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private c0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->us(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 26
    .line 27
    iget-object v1, p0, Ll/h100;->w:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    invoke-interface {v1, p2, p1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->momentRefresh(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/c100;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/c100;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/d100;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/d100;-><init>(Ll/h100;)V

    .line 54
    .line 55
    .line 56
    new-instance v3, Ll/e100;

    .line 57
    .line 58
    invoke-direct {v3}, Ll/e100;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, p0, Ll/h100;->w:Ll/kcg0;

    .line 70
    .line 71
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 78
    .line 79
    if-eqz v1, :cond_1

    .line 80
    .line 81
    sget v1, Ll/ibc0;->B3:I

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    sget v1, Ll/ibc0;->E3:I

    .line 85
    .line 86
    :goto_0
    iget-object v2, p0, Ll/h100;->g:Lv/VImage;

    .line 87
    .line 88
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    iget-object v1, p0, Ll/h100;->g:Lv/VImage;

    .line 93
    .line 94
    sget v2, Ll/ibc0;->E3:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 97
    .line 98
    .line 99
    :goto_1
    iget-object v1, p0, Ll/h100;->g:Lv/VImage;

    .line 100
    .line 101
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    iget-object v1, p0, Ll/h100;->g:Lv/VImage;

    .line 112
    .line 113
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Landroid/view/View;

    .line 118
    .line 119
    invoke-virtual {v1}, Landroid/view/View;->getTouchDelegate()Landroid/view/TouchDelegate;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    if-nez v1, :cond_3

    .line 124
    .line 125
    iget-object v1, p0, Ll/h100;->g:Lv/VImage;

    .line 126
    .line 127
    new-instance v2, Ll/f100;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/f100;-><init>(Ll/h100;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 133
    .line 134
    .line 135
    :cond_3
    iget-object v1, p0, Ll/h100;->g:Lv/VImage;

    .line 136
    .line 137
    new-instance v2, Ll/g100;

    .line 138
    .line 139
    invoke-direct {v2, p0, v0, p1, p2}, Ll/g100;-><init>(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public static synthetic d(Ll/h100;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/h100;->O(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public static synthetic f(Ll/h100;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100;->N(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic i(Ll/h100;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/h100;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->K()V

    return-void
.end method

.method public static synthetic k(Ll/h100;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h100;->U(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l(Ll/h100;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->R()V

    return-void
.end method

.method public static synthetic m(Ll/h100;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100;->M(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/h100;->P(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/h100;->S(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h100;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sget v2, Ll/qa00;->c:I

    .line 12
    .line 13
    sub-int/2addr v1, v2

    .line 14
    sub-int/2addr v1, v2

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    iget-object v1, p0, Ll/h100;->b:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/h100;->c:Lv/VPager;

    .line 23
    .line 24
    new-instance v1, Ll/h100$a;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h100$a;-><init>(Ll/h100;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/h100;->c:Lv/VPager;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v1, p0, Ll/h100;->f:Lv/VDraweeView;

    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v3, "res://"

    .line 45
    .line 46
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v3, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v3, "/"

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    sget v3, Ll/ibc0;->D3:I

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/h100;->c:Lv/VPager;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/h100;->l:Lv/VImage;

    .line 87
    .line 88
    new-instance v1, Ll/y000;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/y000;-><init>(Ll/h100;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static bridge synthetic s(Ll/h100;)Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-object p0
.end method

.method public static bridge synthetic u(Ll/h100;)Ll/s000;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h100;->n:Ll/s000;

    return-object p0
.end method

.method public static bridge synthetic v(Ll/h100;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->G()V

    return-void
.end method

.method public static bridge synthetic w(Ll/h100;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->V()V

    return-void
.end method

.method public static bridge synthetic x(Ll/h100;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->W()V

    return-void
.end method

.method public static bridge synthetic y(Ll/h100;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h100;->Z()V

    return-void
.end method

.method public static bridge synthetic z(Ll/h100;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100;->a0(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l100;->b(Ll/h100;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public C()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Ll/s000;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h100;->n:Ll/s000;

    .line 2
    .line 3
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/h100;->u:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    .line 3
    .line 4
    iget-object v0, p0, Ll/h100;->w:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/h100;->r:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/h100;->s:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/h100;->t:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->g0()V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Ll/h100;->I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->a0()V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 51
    .line 52
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 59
    .line 60
    new-instance v1, Ll/t000;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/t000;-><init>(Ll/h100;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public final G()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/h100;->v:Lcom/p1/mobile/putong/core/data/MessageMomentGuide;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->ownerId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/h100;->n:Ll/s000;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/h100;->v:Lcom/p1/mobile/putong/core/data/MessageMomentGuide;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/clz;->d7(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/h100;->n:Ll/s000;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Ll/mzl;->B0()Ll/u1z;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/j3z;->g0()Ll/iam;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ll/d3z;

    .line 43
    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    const-string v0, ""

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    :goto_0
    iget-object v2, p0, Ll/h100;->v:Lcom/p1/mobile/putong/core/data/MessageMomentGuide;

    .line 52
    .line 53
    invoke-virtual {v1, v0, v2}, Ll/d3z;->X1(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/h100;->F()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final H()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

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
    iget-object p0, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->a0()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/h100;->I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->W()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h100;->q:Ljava/util/HashMap;

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
    iget-object v0, p0, Ll/h100;->q:Ljava/util/HashMap;

    .line 10
    .line 11
    iget v1, p0, Ll/h100;->y:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/h100;->q:Ljava/util/HashMap;

    .line 24
    .line 25
    iget p0, p0, Ll/h100;->y:I

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public final synthetic K()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    neg-int v1, v1

    .line 8
    int-to-float v1, v1

    .line 9
    const/4 v2, 0x2

    .line 10
    new-array v2, v2, [F

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    aput v3, v2, v4

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    aput v1, v2, v3

    .line 18
    .line 19
    const-string v1, "translationY"

    .line 20
    .line 21
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    .line 26
    .line 27
    const v2, 0x3f4ccccd    # 0.8f

    .line 28
    .line 29
    .line 30
    invoke-direct {v1, v2}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 34
    .line 35
    .line 36
    const-wide/16 v1, 0x12c

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    new-instance v1, Ll/h100$c;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/h100$c;-><init>(Ll/h100;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic M(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xzm0;->q()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/h100;->a:Lv/VLinear;

    .line 12
    .line 13
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/h100;->F()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic N(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Ll/h100;->J()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Ll/h100;->b0()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    invoke-virtual {p0}, Ll/h100;->H()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic O(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Ll/h100;->c0(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object p1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p3, p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/h100;->H()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    sget-object p1, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-ne p3, p1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/h100;->F()V

    .line 22
    .line 23
    .line 24
    :cond_2
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u8be5\u52a8\u6001\u56e0\u4e3a\u9690\u79c1\u8bbe\u7f6e\uff0c\u5df2\u4e0d\u53ef\u89c1"

    .line 4
    .line 5
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/h100;->C()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v4, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 24
    .line 25
    xor-int/lit8 v4, v4, 0x1

    .line 26
    .line 27
    const-string v5, "p_chat_view"

    .line 28
    .line 29
    invoke-interface {v0, v1, v2, v4, v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kn(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    new-instance v0, Ll/w000;

    .line 38
    .line 39
    move-object v1, p0

    .line 40
    move-object v2, p1

    .line 41
    move-object v4, p2

    .line 42
    move-object v5, p3

    .line 43
    invoke-direct/range {v0 .. v5}, Ll/w000;-><init>(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/x000;

    .line 47
    .line 48
    invoke-direct {p0, v2, v3}, Ll/x000;-><init>(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Z)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/ibc0;->B3:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget p1, Ll/ibc0;->E3:I

    .line 9
    .line 10
    :goto_0
    iget-object p0, p0, Ll/h100;->g:Lv/VImage;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic R()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/h100;->g:Lv/VImage;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    sget v2, Ll/qa00;->l:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    add-int/2addr v1, v2

    .line 21
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    sub-int/2addr v1, v2

    .line 26
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    new-instance v1, Landroid/view/TouchDelegate;

    .line 34
    .line 35
    iget-object v2, p0, Ll/h100;->g:Lv/VImage;

    .line 36
    .line 37
    invoke-direct {v1, v0, v2}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/h100;->g:Lv/VImage;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 6

    .line 1
    iget-boolean p5, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 2
    .line 3
    xor-int/lit8 v0, p5, 0x1

    .line 4
    .line 5
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 6
    .line 7
    if-nez p5, :cond_0

    .line 8
    .line 9
    sget p5, Ll/ibc0;->B3:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p5, Ll/ibc0;->E3:I

    .line 13
    .line 14
    :goto_0
    iget-object v0, p0, Ll/h100;->g:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {v0, p5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-boolean p5, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 20
    .line 21
    if-eqz p5, :cond_1

    .line 22
    .line 23
    iget-object p5, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    invoke-static {p5, p1}, Ll/j000;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v3, 0x0

    .line 33
    const/16 v4, 0xc9

    .line 34
    .line 35
    const-string v2, "p_moment_view"

    .line 36
    .line 37
    move-object v1, p1

    .line 38
    move v5, p2

    .line 39
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Yc(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;ZIZ)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/h100;->u:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Ll/h100;->u:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    .line 51
    .line 52
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->D(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public final synthetic T(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_moment_reply"

    .line 2
    .line 3
    const-string v0, "p_moment_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/h100;->G()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    neg-int v1, v1

    .line 8
    int-to-float v1, v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    neg-int v2, v2

    .line 25
    int-to-float v2, v2

    .line 26
    const/4 v3, 0x2

    .line 27
    new-array v3, v3, [F

    .line 28
    .line 29
    aput v2, v3, v1

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v2, 0x1

    .line 33
    aput v1, v3, v2

    .line 34
    .line 35
    const-string v1, "translationY"

    .line 36
    .line 37
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    .line 42
    .line 43
    const v2, 0x3f4ccccd    # 0.8f

    .line 44
    .line 45
    .line 46
    invoke-direct {v1, v2}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    const-wide/16 v1, 0x1f4

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Ll/h100$b;

    .line 61
    .line 62
    invoke-direct {v1, p0, p1, p2}, Ll/h100$b;-><init>(Ll/h100;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/xzm0;->i()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/u000;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/u000;-><init>(Ll/h100;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/h100;->t:Ll/kcg0;

    .line 29
    .line 30
    return-void
.end method

.method public final W()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/v000;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/v000;-><init>(Ll/h100;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/h100;->s:Ll/kcg0;

    .line 25
    .line 26
    return-void
.end method

.method public final X(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h100;->m:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/b100;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, Ll/b100;-><init>(Ll/h100;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/h100;->r:Ll/kcg0;

    .line 25
    .line 26
    return-void
.end method

.method public Y(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h100;->a:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/h100;->z:Landroid/view/GestureDetector;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h100;->x:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/h100;->x:Ll/l4g0;

    .line 11
    .line 12
    return-void
.end method

.method public final a0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-class v0, Ll/h100;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_moment_view"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/h100;->x:Ll/l4g0;

    .line 14
    .line 15
    const-string v1, "moment_id"

    .line 16
    .line 17
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/h100;->x:Ll/l4g0;

    .line 29
    .line 30
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/h100;->C()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d0(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->us(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 30
    .line 31
    :cond_0
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x1

    .line 38
    if-ne v1, v3, :cond_3

    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v1, p0, Ll/h100;->d:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 55
    .line 56
    if-le p1, v3, :cond_2

    .line 57
    .line 58
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/h100;->d:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    :goto_0
    new-instance p1, Ll/h100$e;

    .line 77
    .line 78
    invoke-direct {p1, p0}, Ll/h100$e;-><init>(Ll/h100;)V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Ll/h100;->o:Ll/h100$e;

    .line 82
    .line 83
    iget-object v1, p0, Ll/h100;->c:Lv/VPager;

    .line 84
    .line 85
    invoke-virtual {v1, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/h100;->o:Ll/h100$e;

    .line 89
    .line 90
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ll/h100$e;->x(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 97
    .line 98
    const/4 v1, 0x2

    .line 99
    if-ne p1, v1, :cond_4

    .line 100
    .line 101
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-nez p1, :cond_4

    .line 108
    .line 109
    iget-object p1, p0, Ll/h100;->d:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 110
    .line 111
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    new-instance p1, Ll/h100$e;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Ll/h100$e;-><init>(Ll/h100;)V

    .line 117
    .line 118
    .line 119
    iput-object p1, p0, Ll/h100;->o:Ll/h100$e;

    .line 120
    .line 121
    iget-object v1, p0, Ll/h100;->c:Lv/VPager;

    .line 122
    .line 123
    invoke-virtual {v1, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Ll/h100;->o:Ll/h100$e;

    .line 127
    .line 128
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ll/h100$e;->x(Ljava/util/List;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    :goto_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V
    .locals 4

    .line 1
    iput-object p2, p0, Ll/h100;->u:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    .line 2
    .line 3
    iput-object p1, p0, Ll/h100;->v:Lcom/p1/mobile/putong/core/data/MessageMomentGuide;

    .line 4
    .line 5
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->ownerId:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v2, "\u4ed6\u7684\u52a8\u6001"

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    const-string v2, "\u5979\u7684\u52a8\u6001"

    .line 30
    .line 31
    :goto_1
    iget-object v3, p0, Ll/h100;->j:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object v3, p0, Ll/h100;->k:Lv/VText;

    .line 43
    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    const/4 v2, 0x1

    .line 52
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Ll/h100;->k:Lv/VText;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    :goto_2
    invoke-virtual {p0, p1}, Ll/h100;->d0(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p1, v0}, Ll/h100;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/h100;->h:Lv/VImage;

    .line 71
    .line 72
    new-instance v0, Ll/z000;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/z000;-><init>(Ll/h100;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/h100;->a:Lv/VLinear;

    .line 81
    .line 82
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    iget-object p1, p0, Ll/h100;->a:Lv/VLinear;

    .line 89
    .line 90
    const/4 v0, 0x4

    .line 91
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/h100;->a:Lv/VLinear;

    .line 95
    .line 96
    new-instance v0, Ll/a100;

    .line 97
    .line 98
    invoke-direct {v0, p0, v1, p2}, Ll/a100;-><init>(Ll/h100;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 102
    .line 103
    .line 104
    :cond_3
    return-void
.end method

.method public f0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cl80;->k()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object p0, p0, Ll/dkb;->y2:Ll/byd0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Long;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    cmp-long p0, v0, v2

    .line 31
    .line 32
    if-lez p0, :cond_1

    .line 33
    .line 34
    :goto_0
    return-void

    .line 35
    :cond_1
    if-eqz p3, :cond_3

    .line 36
    .line 37
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    const-string p0, "\u4ed6"

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    :goto_1
    const-string p0, "\u5979"

    .line 48
    .line 49
    :goto_2
    const-string p3, "\u7684\u52a8\u6001\u4e0d\u9519\uff0c\u53cb\u597d\u4e8c\u8fde\u62c9\u8fd1\u8ddd\u79bb\uff5e"

    .line 50
    .line 51
    invoke-virtual {p0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p3, Lcom/p1/mobile/android/ui/bubble/a;

    .line 56
    .line 57
    invoke-direct {p3, p1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    const/high16 p1, 0x40000000    # 2.0f

    .line 61
    .line 62
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {p3, p1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/high16 p1, 0x41500000    # 13.0f

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, "#fe7e1d"

    .line 81
    .line 82
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    filled-new-array {p1}, [I

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const/high16 p1, 0x40e00000    # 7.0f

    .line 95
    .line 96
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const/16 p1, 0x4b

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const/high16 p1, 0x40800000    # 4.0f

    .line 111
    .line 112
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    neg-int p1, p1

    .line 117
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const/high16 p1, 0x41200000    # 10.0f

    .line 122
    .line 123
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    const-wide/16 v0, 0x1388

    .line 132
    .line 133
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    const/4 p1, 0x1

    .line 138
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    sget p1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 145
    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    sget-object p1, Ll/h100;->A:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0, p3, p2, p1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 159
    .line 160
    iget-object p0, p0, Ll/dkb;->y2:Ll/byd0;

    .line 161
    .line 162
    invoke-static {}, Ll/pzi0;->o()J

    .line 163
    .line 164
    .line 165
    move-result-wide p1

    .line 166
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/s000;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h100;->E(Ll/s000;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h100;->B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/h100;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/h100;->y:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/h100;->I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->a0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput p1, p0, Ll/h100;->y:I

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/h100;->I()Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->X()V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p0, Ll/h100;->d:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
