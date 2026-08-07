.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;
.super Ll/v5w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/v5w<",
        "Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;",
        "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, p1, v0}, Ll/v5w;-><init>(Ljava/util/List;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->v(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic j(Landroid/view/View;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->s(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic p(ILandroid/view/ViewGroup;II)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->u(ILandroid/view/ViewGroup;II)Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;II)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/v5w;->itemList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p3, :cond_3

    .line 4
    .line 5
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-gt p3, p2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p3, p0, Ll/v5w;->itemList:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;

    .line 19
    .line 20
    if-eqz p2, :cond_3

    .line 21
    .line 22
    iget-object p3, p2, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerMedia:Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;

    .line 23
    .line 24
    if-nez p3, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;->a:Lv/VDraweeView;

    .line 28
    .line 29
    iget-object p3, p3, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;->bannerUrl:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "context_square"

    .line 32
    .line 33
    invoke-static {v1, v0, p3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->isLiveGroupType()Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-eqz p3, :cond_2

    .line 41
    .line 42
    iget-object p3, p2, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->title:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    if-nez p3, :cond_2

    .line 49
    .line 50
    iget-object p3, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;->b:Lv/VText;

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p3, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;->b:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->title:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->t(Landroid/content/Context;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iget-object p3, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;->b:Lv/VText;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    :goto_0
    new-instance p3, Ll/w1o;

    .line 79
    .line 80
    invoke-direct {p3, p0, p2}, Ll/w1o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    :goto_1
    return-void
.end method

.method public final t(Landroid/content/Context;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "img"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public u(ILandroid/view/ViewGroup;II)Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/xec0;->b0:I

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerItemView;

    .line 17
    .line 18
    sget p1, Ll/qa00;->j:I

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;->t3(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;

    .line 2
    .line 3
    return-void
.end method
