.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;
    }
.end annotation


# static fields
.field public static Q:Ll/jxd0;

.field public static R:[Ljava/lang/String;

.field public static S:[I


# instance fields
.field public A:Landroid/widget/RelativeLayout;

.field public B:Landroid/widget/LinearLayout;

.field public C:Lv/VText;

.field public D:Lv/VImage;

.field public E:Landroid/view/ViewStub;

.field public F:Landroid/view/ViewStub;

.field public G:Landroid/view/ViewStub;

.field public H:Landroid/view/ViewStub;

.field public I:Landroid/view/ViewStub;

.field public J:I

.field public K:Landroid/widget/PopupWindow;

.field public L:Landroid/view/View;

.field public M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

.field public N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

.field public O:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

.field public P:Ljava/lang/Runnable;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VText;

.field public l:Lv/VImage;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;

.field public o:Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

.field public p:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

.field public q:Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;

.field public r:Landroid/widget/FrameLayout;

.field public s:Landroid/view/View;

.field public t:Landroid/widget/LinearLayout;

.field public u:Landroid/widget/RelativeLayout;

.field public v:Lv/VText;

.field public w:Landroid/view/View;

.field public x:Lv/VImage;

.field public y:Lv/VImage;

.field public z:Lv/VImage;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "is_operated_filter"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->Q:Ll/jxd0;

    .line 31
    .line 32
    const-string v0, "\u5728\u7ebf"

    .line 33
    .line 34
    const-string v1, "\u7fa4\u804a"

    .line 35
    .line 36
    const-string v2, "\u5168\u90e8"

    .line 37
    .line 38
    const-string v3, "\u672a\u8bfb"

    .line 39
    .line 40
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->R:[Ljava/lang/String;

    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    const/4 v1, 0x6

    .line 48
    const/4 v2, 0x0

    .line 49
    const/4 v3, 0x1

    .line 50
    filled-new-array {v2, v3, v0, v1}, [I

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->S:[I

    .line 55
    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->p0()V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Ljava/lang/String;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->n0(Ljava/lang/String;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->q0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic W(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->u0()V

    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->t0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic b0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->m0(Ljava/lang/Boolean;)V

    return-void
.end method

.method private getMessageHeaderRes()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageTabRevisionEnable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u7b5b\u9009"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget v0, Lcom/p1/mobile/putong/core/R$string;->d2:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private getMessageTabRevisionEnable()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->F0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->d3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private setLayoutCheckByType(I)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x0()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    const/16 v0, 0x9

    .line 7
    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/16 v0, 0xa

    .line 11
    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->k:Lv/VText;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->l:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y0(Lv/VText;Lv/VImage;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->h:Lv/VText;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->i:Lv/VImage;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y0(Lv/VText;Lv/VImage;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->e:Lv/VText;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f:Lv/VImage;

    .line 34
    .line 35
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y0(Lv/VText;Lv/VImage;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final A0(ZZ)V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->Q:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->Q:Ll/jxd0;

    .line 20
    .line 21
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y:Lv/VImage;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 32
    .line 33
    sget p1, Ll/dbc0;->r1:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->Q:Ll/jxd0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    const/4 v1, 0x0

    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y:Lv/VImage;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y:Lv/VImage;

    .line 60
    .line 61
    sget p2, Ll/dbc0;->ma:I

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y:Lv/VImage;

    .line 68
    .line 69
    if-nez p2, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->y:Lv/VImage;

    .line 75
    .line 76
    sget p2, Ll/dbc0;->na:I

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 86
    .line 87
    sget p1, Ll/dbc0;->s1:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final B0(Lv/VText;Lv/VImage;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/c9c0;->I:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final D0(Lv/VText;Lv/VImage;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/c9c0;->n:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public E0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->m:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->m:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public G0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->e0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->j0()V

    .line 43
    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 46
    .line 47
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->setLayoutCheckByType(I)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 51
    .line 52
    const/4 v2, -0x2

    .line 53
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/ir6;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/ir6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v2, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A0(ZZ)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 94
    .line 95
    new-instance v1, Ll/jr6;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/jr6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 104
    .line 105
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 106
    .line 107
    const/4 v2, 0x0

    .line 108
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 115
    .line 116
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 121
    .line 122
    const/high16 v2, 0x41400000    # 12.0f

    .line 123
    .line 124
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    sub-int/2addr v1, v2

    .line 129
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageTabRevisionEnable()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_2

    .line 134
    .line 135
    const/high16 p0, 0x41700000    # 15.0f

    .line 136
    .line 137
    :goto_0
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    neg-int p0, p0

    .line 142
    goto :goto_1

    .line 143
    :cond_2
    const/high16 p0, 0x41a00000    # 20.0f

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :goto_1
    invoke-virtual {v0, p1, v1, p0}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public H0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->E:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L:Landroid/view/View;

    .line 12
    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->INVALID_FILTER:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public I0(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/high16 v1, 0x40000000    # 2.0f

    .line 11
    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/high16 v3, 0x41100000    # 9.0f

    .line 21
    .line 22
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/16 v3, 0x4b

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/high16 v3, 0x41500000    # 13.0f

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-wide/16 v2, 0xbb8

    .line 64
    .line 65
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/high16 v1, 0x40400000    # 3.0f

    .line 74
    .line 75
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 84
    .line 85
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 86
    .line 87
    or-int/2addr v1, v2

    .line 88
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 96
    .line 97
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    const-string p0, "e_quickchat_relationship_timeout_tips"

    .line 101
    .line 102
    const-string p1, "p_messages_view"

    .line 103
    .line 104
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public J0()V
    .locals 9

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 14
    .line 15
    double-to-long v2, v2

    .line 16
    const/4 v4, 0x7

    .line 17
    invoke-static {v0, v1, v2, v3, v4}, Ll/tzi0;->h(JJI)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const-string v0, "\u5b8c\u6210\u8ba4\u8bc1\uff0c\u5c06\u6536\u83b7\u66f4\u591a\u804a\u5929"

    .line 24
    .line 25
    :goto_0
    move-object v3, v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const-string v0, "\u5b8c\u6210\u8ba4\u8bc1\uff0c\u88ab\u56de\u590d\u7387\u63d0\u53473\u500d"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->G:Landroid/view/ViewStub;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    iget-object v0, v0, Ll/dkb;->W3:Ll/vxd0;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 52
    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v0, v0, Ll/dkb;->V3:Ll/byd0;

    .line 59
    .line 60
    invoke-static {}, Ll/pzi0;->o()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    const-wide/32 v4, 0x5265c00

    .line 65
    .line 66
    .line 67
    add-long/2addr v1, v4

    .line 68
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    const/4 v7, 0x0

    .line 82
    const/4 v8, 0x0

    .line 83
    const-string v4, "\u53bb\u8ba4\u8bc1"

    .line 84
    .line 85
    const-string v5, "e_messages_view_verification"

    .line 86
    .line 87
    const-string v6, "p_messages_view"

    .line 88
    .line 89
    invoke-virtual/range {v1 .. v8}, Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;->k0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 90
    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->PIC_CERT:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;->l0()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public K0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->n0:Ll/byd0;

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    const-string v1, "\u5f53\u524d\u65e0\u6cd5\u63a5\u6536\u65b0\u6d88\u606f\u901a\u77e5\uff0c\u70b9\u51fb\u7acb\u5373\u5f00\u542f"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v4, Ll/c9c0;->I:I

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/16 v3, 0x21

    .line 49
    .line 50
    const/16 v4, 0xe

    .line 51
    .line 52
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A:Landroid/widget/RelativeLayout;

    .line 56
    .line 57
    new-instance v2, Ll/yq6;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/yq6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ll/gra;->z()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->D:Lv/VImage;

    .line 72
    .line 73
    sget v2, Ll/dbc0;->tg:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 76
    .line 77
    .line 78
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->D:Lv/VImage;

    .line 79
    .line 80
    new-instance v2, Ll/cr6;

    .line 81
    .line 82
    invoke-direct {v2, p0}, Ll/cr6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->C:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->NOTICE:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V

    .line 96
    .line 97
    .line 98
    const-string v0, "e_open_click"

    .line 99
    .line 100
    const-string v1, "p_messages_view"

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/dr6;

    .line 114
    .line 115
    invoke-direct {v1}, Ll/dr6;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/er6;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/er6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->O:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->WECHAT_NOTIFY:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    if-ne p1, v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 33
    .line 34
    invoke-static {p0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->PIC_CERT:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 39
    .line 40
    if-ne p1, v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 43
    .line 44
    invoke-static {p0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->NOTICE:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 49
    .line 50
    if-ne p1, v0, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A:Landroid/widget/RelativeLayout;

    .line 53
    .line 54
    invoke-static {p0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->INVALID_FILTER:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 59
    .line 60
    if-ne p1, v0, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L:Landroid/view/View;

    .line 63
    .line 64
    invoke-static {p0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->WEAKENED_TIPS:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 69
    .line 70
    if-ne p1, v0, :cond_4

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->O:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

    .line 73
    .line 74
    invoke-static {p0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    :cond_4
    return-void
.end method

.method public M0(Ll/u46;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->O:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->I:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->O:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dkb;->D5:Ll/byd0;

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->O:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

    .line 33
    .line 34
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->s0(Ll/u46;I)V

    .line 35
    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->WEAKENED_TIPS:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "tips_show_position"

    .line 43
    .line 44
    const-string p1, "up"

    .line 45
    .line 46
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {p0}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_old_messagesweaken_tips"

    .line 55
    .line 56
    const-string p2, "p_messages_view"

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public N0(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->H:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dkb;->j5:Ll/byd0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v1, 0x1

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v0, v0, Ll/dkb;->i5:Ll/vxd0;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    iget-object v0, v0, Ll/dkb;->k5:Ll/vxd0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 64
    .line 65
    iget-object v0, v0, Ll/dkb;->i5:Ll/vxd0;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    iget-object v0, v0, Ll/dkb;->j5:Ll/byd0;

    .line 75
    .line 76
    invoke-static {}, Ll/pzi0;->o()J

    .line 77
    .line 78
    .line 79
    move-result-wide v1

    .line 80
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 88
    .line 89
    new-instance v1, Ll/br6;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/br6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->d(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;Ll/x20;)V

    .line 95
    .line 96
    .line 97
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->WECHAT_NOTIFY:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final d0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mr6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lr6;->b(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f0()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public g0(I)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    const-string v1, " \u00b7 "

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v0, Lcom/p1/mobile/putong/core/R$string;->b2:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    const/4 v0, 0x6

    .line 51
    if-ne p1, v0, :cond_2

    .line 52
    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget v0, Lcom/p1/mobile/putong/core/R$string;->t1:I

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_2
    const/4 v0, 0x2

    .line 91
    if-ne p1, v0, :cond_3

    .line 92
    .line 93
    new-instance p1, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c2:I

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_3
    const/4 v0, 0x3

    .line 131
    if-ne p1, v0, :cond_4

    .line 132
    .line 133
    new-instance p1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    sget v0, Lcom/p1/mobile/putong/core/R$string;->a2:I

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0

    .line 170
    :cond_4
    const/4 v0, 0x4

    .line 171
    if-ne p1, v0, :cond_5

    .line 172
    .line 173
    new-instance p1, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .line 177
    .line 178
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    sget v0, Lcom/p1/mobile/putong/core/R$string;->x3:I

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    return-object p0

    .line 210
    :cond_5
    const/4 v0, 0x7

    .line 211
    if-ne p1, v0, :cond_6

    .line 212
    .line 213
    new-instance p1, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    sget v0, Lcom/p1/mobile/putong/core/R$string;->O3:I

    .line 237
    .line 238
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    return-object p0

    .line 250
    :cond_6
    const/16 v0, 0x8

    .line 251
    .line 252
    if-ne p1, v0, :cond_7

    .line 253
    .line 254
    new-instance p1, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    sget v0, Lcom/p1/mobile/putong/core/R$string;->H7:I

    .line 278
    .line 279
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    return-object p0

    .line 291
    :cond_7
    const/16 v0, 0xb

    .line 292
    .line 293
    if-ne p1, v0, :cond_8

    .line 294
    .line 295
    new-instance p1, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 298
    .line 299
    .line 300
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string p0, " \u00b7 \u5f02\u5e38\u4f1a\u8bdd"

    .line 308
    .line 309
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    return-object p0

    .line 317
    :cond_8
    const-string p0, ""

    .line 318
    .line 319
    return-object p0
.end method

.method public getConversationHeadRecommendLayout()Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->p:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentSortType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 2
    .line 3
    return p0
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A:Landroid/widget/RelativeLayout;

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

.method public i0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->t:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->t:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x41200000    # 10.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->u:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v:Lv/VText;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const/high16 v4, 0x41700000    # 15.0f

    .line 29
    .line 30
    invoke-virtual {v0, v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v:Lv/VText;

    .line 34
    .line 35
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->u:Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 47
    .line 48
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->u:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v:Lv/VText;

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageHeaderRes()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 66
    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    move v0, v1

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    move v0, v2

    .line 72
    :goto_0
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A0(ZZ)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 76
    .line 77
    new-instance v3, Ll/fr6;

    .line 78
    .line 79
    invoke-direct {v3, p0}, Ll/fr6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getConversationHeadRecommendLayout()Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->getVisibleObs()Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v3, Ll/gr6;

    .line 106
    .line 107
    invoke-direct {v3, p0}, Ll/gr6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 108
    .line 109
    .line 110
    new-instance v4, Ll/hr6;

    .line 111
    .line 112
    invoke-direct {v4}, Ll/hr6;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {v3, v4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ll/gra;->D2()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v0, v3, v2}, Ll/w250;->f(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_2

    .line 141
    .line 142
    invoke-static {}, Ll/iz40;->w()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-nez v0, :cond_2

    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->k0()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_1

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_1
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Ll/w250;->c()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_2

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K0()V

    .line 166
    .line 167
    .line 168
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->getMessageTabRevisionEnable()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_3

    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 175
    .line 176
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->u:Landroid/widget/RelativeLayout;

    .line 180
    .line 181
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v:Lv/VText;

    .line 185
    .line 186
    const/high16 v3, 0x42100000    # 36.0f

    .line 187
    .line 188
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 193
    .line 194
    .line 195
    :cond_3
    invoke-static {}, Ll/gra;->d3()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-nez v0, :cond_5

    .line 200
    .line 201
    invoke-static {}, Ll/gra;->G0()Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-eqz v0, :cond_4

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->s:Landroid/view/View;

    .line 209
    .line 210
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 211
    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->s:Landroid/view/View;

    .line 215
    .line 216
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    :goto_3
    invoke-static {}, Ll/gra;->g()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_6

    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 230
    .line 231
    if-eqz v0, :cond_6

    .line 232
    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->W(Lcom/p1/mobile/android/app/Act;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->o:Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

    .line 244
    .line 245
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public final j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "e_intl_messages_filter_default"

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->z0(Landroid/widget/LinearLayout;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->g:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    const/16 v1, 0x9

    .line 12
    .line 13
    const-string v2, "e_intl_messages_filter_chat"

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->z0(Landroid/widget/LinearLayout;ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->j:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    const/16 v1, 0xa

    .line 21
    .line 22
    const-string v2, "e_intl_messages_filter_matches"

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->z0(Landroid/widget/LinearLayout;ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public k0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->x:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->G0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    new-array p0, p0, [Ll/sfj0$a;

    .line 8
    .line 9
    const-string p1, "e_intl_messages_filter"

    .line 10
    .line 11
    const-string v0, "p_messages_view"

    .line 12
    .line 13
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic m0(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->w:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->v:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic n0(Ljava/lang/String;ILandroid/view/View;)V
    .locals 1

    .line 1
    const/4 p3, 0x0

    .line 2
    new-array p3, p3, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "p_messages_view"

    .line 5
    .line 6
    invoke-static {p1, v0, p3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 7
    .line 8
    .line 9
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 10
    .line 11
    if-eq p1, p2, :cond_0

    .line 12
    .line 13
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->p2:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object p2, Ll/uxj0;->a:Ll/uxj0;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->K:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->d0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v0, v1

    .line 9
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->A0(ZZ)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->J:I

    .line 13
    .line 14
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->setLayoutCheckByType(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    const-string p1, "\u5df2\u5f00\u542f\u6d88\u606f\u901a\u77e5"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->h0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_open_click"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    const-string v2, "allPushEnable"

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1, v3, v3}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/kr6;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/kr6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/zq6;

    .line 56
    .line 57
    invoke-direct {p0}, Ll/zq6;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-static {}, Ll/iz40;->A()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f0()Lcom/p1/mobile/putong/app/PutongAct;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    invoke-virtual {p1, v2, v1, v3, v3}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_close_click"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->h0()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/w250;->g()Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setFilterPopShow(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->P:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->h0()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic u0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->q5:Ll/byd0;

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;->NONE:Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->L0(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView$TipType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public v0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->M:Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/PicCertGuideView;->l0()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 32
    .line 33
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->N:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->e()V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final w0(Lv/VText;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->D0(Lv/VText;Lv/VImage;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->e:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->f:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->w0(Lv/VText;Lv/VImage;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->h:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->i:Lv/VImage;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->w0(Lv/VText;Lv/VImage;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->k:Lv/VText;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->l:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->w0(Lv/VText;Lv/VImage;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final y0(Lv/VText;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;->B0(Lv/VText;Lv/VImage;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    invoke-static {p0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final z0(Landroid/widget/LinearLayout;ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ar6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p2}, Ll/ar6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsListHeadView;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
