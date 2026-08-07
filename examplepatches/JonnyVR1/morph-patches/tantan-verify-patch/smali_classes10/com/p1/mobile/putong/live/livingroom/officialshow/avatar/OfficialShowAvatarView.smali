.class public Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/yb50;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public i:Ll/yb50;

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42300000    # 44.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->j:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42300000    # 44.0f

    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->j:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42300000    # 44.0f

    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->j:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
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

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->i:Ll/yb50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yb50;->f4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->i:Ll/yb50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yb50;->e4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->i:Ll/yb50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yb50;->e4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->e:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
    .line 24
    const/16 v1, 0xc

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/ynp0;->s(ILjava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/high16 v1, 0x41800000    # 16.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/2addr v0, v1

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->j:I

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->g:Lv/VText;

    .line 40
    .line 41
    new-instance v1, Ll/zb50;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/zb50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->c:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    new-instance v1, Ll/ac50;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/ac50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 60
    .line 61
    new-instance v1, Ll/bc50;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/bc50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dc50;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ll/yb50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->i:Ll/yb50;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yb50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->f(Ll/yb50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public l(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/p6s;->D0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->g:Lv/VText;

    .line 16
    .line 17
    const-string v2, "\u8ba2\u9605"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->g:Lv/VText;

    .line 23
    .line 24
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->j:I

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->g:Lv/VText;

    .line 30
    .line 31
    new-array v3, v1, [Landroid/view/View;

    .line 32
    .line 33
    aput-object v2, v3, v0

    .line 34
    .line 35
    invoke-static {p1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->f:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->i:Ll/yb50;

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Ll/yb50;->h4(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->b:Lv/VLinear;

    .line 50
    .line 51
    sget v2, Ll/obc0;->L0:I

    .line 52
    .line 53
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    const/high16 p1, 0x432a0000    # 170.0f

    .line 57
    .line 58
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->b:Lv/VLinear;

    .line 63
    .line 64
    new-array v1, v1, [Landroid/view/View;

    .line 65
    .line 66
    aput-object p0, v1, v0

    .line 67
    .line 68
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->g:Lv/VText;

    .line 73
    .line 74
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->b:Lv/VLinear;

    .line 78
    .line 79
    sget v2, Ll/obc0;->M0:I

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 82
    .line 83
    .line 84
    const/high16 p1, 0x42fc0000    # 126.0f

    .line 85
    .line 86
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->b:Lv/VLinear;

    .line 91
    .line 92
    new-array v1, v1, [Landroid/view/View;

    .line 93
    .line 94
    aput-object p0, v1, v0

    .line 95
    .line 96
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/View;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->d:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->e:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->g:Lv/VText;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->b:Lv/VLinear;

    .line 25
    .line 26
    sget v2, Ll/obc0;->M0:I

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    const/high16 v0, 0x42fc0000    # 126.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->b:Lv/VLinear;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    new-array v2, v2, [Landroid/view/View;

    .line 41
    .line 42
    aput-object p0, v2, v1

    .line 43
    .line 44
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 10
    .line 11
    const/high16 v1, 0x42540000    # 53.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    new-instance v2, Ll/cc50;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/cc50;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, p2, v2}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->d:Lv/VText;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->d:Lv/VText;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    if-le p2, v1, :cond_0

    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string p2, "..."

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->e:Lv/VText;

    .line 61
    .line 62
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;->e:Lv/VText;

    .line 66
    .line 67
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
