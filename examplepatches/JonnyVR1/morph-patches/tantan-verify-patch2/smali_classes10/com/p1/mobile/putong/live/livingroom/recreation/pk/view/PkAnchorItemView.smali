.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Landroid/widget/TextView;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    check-cast p4, Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "unacceptPk"

    .line 8
    .line 9
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    sget p0, Ll/fct;->n:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/lang/String;

    .line 26
    .line 27
    const-string p4, "pking"

    .line 28
    .line 29
    invoke-static {p0, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    sget p0, Ll/fct;->o:I

    .line 36
    .line 37
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-interface {p1, p2, p3}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public b(Lv/VDraweeView;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 1

    .line 1
    iget-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->queryUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p3, Ll/obc0;->J8:I

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const/high16 p4, 0x42100000    # 36.0f

    .line 21
    .line 22
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    const-string v0, "context_single_room"

    .line 27
    .line 28
    invoke-static {v0, p1, p3, p4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public c(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Ll/z20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qq70;

    .line 2
    .line 3
    invoke-direct {v0, p1, p3, p2, p4}, Ll/qq70;-><init>(Landroid/widget/TextView;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 10
    .line 11
    iget-boolean p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 12
    .line 13
    const-string p4, "#bfbfbf"

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y9:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p2, Ll/n9c0;->v1:I

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 40
    .line 41
    .line 42
    const-string p0, "unacceptPk"

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 49
    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ba:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    sget p0, Ll/obc0;->l0:I

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 67
    .line 68
    .line 69
    const-string p0, "pking"

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Fa:I

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 78
    .line 79
    .line 80
    const-string p0, "#ffffff"

    .line 81
    .line 82
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    sget p0, Ll/obc0;->p7:I

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    const-string p0, "acceptPK"

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method
