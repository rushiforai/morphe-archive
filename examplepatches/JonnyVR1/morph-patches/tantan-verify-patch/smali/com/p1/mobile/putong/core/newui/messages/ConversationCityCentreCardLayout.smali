.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/tul;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VDraweeView;

.field public g:Landroid/view/View;

.field public h:Lv/VLinear;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VMarqueeText;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/RelativeLayout;

.field public n:Landroid/widget/ImageView;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/widget/TextView;

.field public q:Landroid/widget/TextView;

.field public r:Lcom/tantan/library/svga/SVGAnimationView;

.field public s:Ll/kcg0;

.field public t:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/CityCData;",
            "Lcom/p1/mobile/putong/core/data/CityCBanner;",
            ">;"
        }
    .end annotation
.end field

.field public u:I

.field public v:Ljava/lang/String;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;ILl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->j(ILl/pf60;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private f()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private o(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "https://auto.tancdn.com/v1/raw/253e6c35-503a-4a4b-8b36-e056926f000714.svga"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/raw/ba4ecb95-df87-4ac1-823b-8d562c8eae9314.svga"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, -0x1

    .line 26
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->r:Lcom/tantan/library/svga/SVGAnimationView;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private setAdInfo(Lcom/p1/mobile/putong/core/data/CityCBanner;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/CityCBanner;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->j:Landroid/widget/TextView;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 17
    .line 18
    const/high16 v3, 0x41400000    # 12.0f

    .line 19
    .line 20
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CityCBanner;->title:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 31
    .line 32
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CityCBanner;->text:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CityCBanner;->url:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f:Lv/VDraweeView;

    .line 46
    .line 47
    sget v1, Ll/ibc0;->F:I

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 54
    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CityCBanner;->url:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v1, v3, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->q:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->l:Landroid/view/View;

    .line 68
    .line 69
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 78
    .line 79
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 85
    .line 86
    const/4 v0, 0x2

    .line 87
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 88
    .line 89
    .line 90
    const-string p1, "city_cover_uid"

    .line 91
    .line 92
    const-string v0, ""

    .line 93
    .line 94
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string v0, "cover_status"

    .line 99
    .line 100
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const-string v0, "e_message_city_cover"

    .line 113
    .line 114
    const-string v1, "p_messages_view"

    .line 115
    .line 116
    invoke-static {v0, v1, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 117
    .line 118
    .line 119
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->o(Z)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private setRecommendCardInfo(Lcom/p1/mobile/putong/core/data/CityCData;)V
    .locals 9
    .param p1    # Lcom/p1/mobile/putong/core/data/CityCData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->u:I

    .line 18
    .line 19
    const-string v3, "cover_status"

    .line 20
    .line 21
    const-string v4, "city_cover_uid"

    .line 22
    .line 23
    const-string v5, "p_messages_view"

    .line 24
    .line 25
    const-string v6, "e_message_city_cover"

    .line 26
    .line 27
    const/4 v7, 0x1

    .line 28
    if-ne v2, v7, :cond_2

    .line 29
    .line 30
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v6, v5, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 64
    .line 65
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 66
    .line 67
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_1

    .line 72
    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->CityCentreShowBigCard:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 74
    .line 75
    invoke-static {}, Ll/pzi0;->o()J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    const-wide/16 v5, 0x3e8

    .line 80
    .line 81
    div-long/2addr v3, v5

    .line 82
    long-to-int v3, v3

    .line 83
    invoke-virtual {v2, v0, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v2, Ll/t66;

    .line 91
    .line 92
    invoke-direct {v2, p0}, Ll/t66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;)V

    .line 93
    .line 94
    .line 95
    const-wide/16 v3, 0x1388

    .line 96
    .line 97
    invoke-static {v0, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, v7}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->o(Z)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h()V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    const/4 v8, 0x2

    .line 109
    if-ne v2, v8, :cond_3

    .line 110
    .line 111
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/4 v2, 0x0

    .line 116
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    filled-new-array {v0, v3}, [Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v6, v5, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->o(Z)V

    .line 132
    .line 133
    .line 134
    :cond_3
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CityCData;->cardTag:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->m(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CityCData;->cityName:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->o:Landroid/widget/TextView;

    .line 146
    .line 147
    if-eqz v0, :cond_4

    .line 148
    .line 149
    const-string p1, "\u57ce\u5e02\u5c01\u9762"

    .line 150
    .line 151
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CityCData;->cityName:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string p1, " \u00b7 \u57ce\u5e02\u5c01\u9762"

    .line 166
    .line 167
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->l:Landroid/view/View;

    .line 178
    .line 179
    invoke-static {p0, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    return-void
.end method


# virtual methods
.method public M(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public O()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Landroid/view/View;Lv/VImage;Lv/VText;I)V
    .locals 4

    .line 1
    int-to-float v0, p4

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr v0, v1

    .line 5
    sget v2, Ll/qa00;->t:I

    .line 6
    .line 7
    int-to-float v3, v2

    .line 8
    div-float/2addr v0, v3

    .line 9
    sub-float v0, v1, v0

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sub-int/2addr p4, v2

    .line 17
    int-to-float p4, p4

    .line 18
    mul-float/2addr p4, v1

    .line 19
    int-to-float v2, v2

    .line 20
    div-float/2addr p4, v2

    .line 21
    invoke-static {p4, v3}, Ljava/lang/Math;->max(FF)F

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    invoke-static {p4, v1}, Ljava/lang/Math;->min(FF)F

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    invoke-virtual {p1, p4}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p4}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p4}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w66;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0x64

    .line 2
    .line 3
    const-string v0, "1km"

    .line 4
    .line 5
    if-gt p1, p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const/16 p0, 0x3e8

    .line 9
    .line 10
    if-ge p1, p0, :cond_1

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    const v0, 0x186a0

    .line 14
    .line 15
    .line 16
    if-ge p1, v0, :cond_2

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    div-int/2addr p1, p0

    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "km"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const-string p0, "99+km"

    .line 38
    .line 39
    return-object p0
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public i(Ljava/lang/String;)Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->CityCentreShowBigCard:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->hasKey(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    int-to-long p0, p0

    .line 18
    const-wide/16 v2, 0x3e8

    .line 19
    .line 20
    mul-long/2addr p0, v2

    .line 21
    invoke-static {v0, v1, p0, p1}, Ll/pzi0;->C(JJ)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public final synthetic j(ILl/pf60;)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->t:Ll/pf60;

    .line 2
    .line 3
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->setRecommendCardInfo(Lcom/p1/mobile/putong/core/data/CityCData;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->setAdInfo(Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-virtual {p0, p2, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->l(Ll/ner;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(Ll/ner;Ljava/lang/String;I)V
    .locals 9

    return-void

    .line 1
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->u:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->v:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x3

    .line 8
    const/high16 v3, 0x41700000    # 15.0f

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    if-ne p3, v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 18
    .line 19
    const/high16 v5, 0x430d0000    # 141.0f

    .line 20
    .line 21
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    sub-int/2addr v0, v5

    .line 26
    new-array v5, v4, [Landroid/view/View;

    .line 27
    .line 28
    aput-object p0, v5, v1

    .line 29
    .line 30
    invoke-static {v0, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    const/high16 v0, 0x42e40000    # 114.0f

    .line 34
    .line 35
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->c:Landroid/widget/ImageView;

    .line 48
    .line 49
    sget v1, Ll/ibc0;->K:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_0
    const/high16 v0, 0x41a00000    # 20.0f

    .line 57
    .line 58
    if-ne p3, v4, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 65
    .line 66
    const/high16 v6, 0x41600000    # 14.0f

    .line 67
    .line 68
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    sub-int/2addr v5, v6

    .line 73
    new-array v6, v4, [Landroid/view/View;

    .line 74
    .line 75
    aput-object p0, v6, v1

    .line 76
    .line 77
    invoke-static {v5, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    const/high16 v1, 0x431c0000    # 156.0f

    .line 81
    .line 82
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    const/high16 v1, 0x40e00000    # 7.0f

    .line 90
    .line 91
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-static {p0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->d:Landroid/widget/RelativeLayout;

    .line 99
    .line 100
    const/high16 v5, 0x42d00000    # 104.0f

    .line 101
    .line 102
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    invoke-static {v1, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->d:Landroid/widget/RelativeLayout;

    .line 110
    .line 111
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    invoke-static {v1, v5}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->d:Landroid/widget/RelativeLayout;

    .line 119
    .line 120
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-static {v1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h:Lv/VLinear;

    .line 128
    .line 129
    const/high16 v1, 0x41000000    # 8.0f

    .line 130
    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->l:Landroid/view/View;

    .line 139
    .line 140
    const/high16 v1, 0x40400000    # 3.0f

    .line 141
    .line 142
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->m:Landroid/widget/RelativeLayout;

    .line 150
    .line 151
    const/high16 v1, 0x42400000    # 48.0f

    .line 152
    .line 153
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->m:Landroid/widget/RelativeLayout;

    .line 161
    .line 162
    const/high16 v1, 0x41800000    # 16.0f

    .line 163
    .line 164
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    invoke-static {v0, v5}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->m:Landroid/widget/RelativeLayout;

    .line 172
    .line 173
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h()V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 184
    .line 185
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->c:Landroid/widget/ImageView;

    .line 189
    .line 190
    sget v1, Ll/ibc0;->I:I

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 193
    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :cond_1
    if-ne p3, v2, :cond_2

    .line 198
    .line 199
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 204
    .line 205
    const/high16 v6, 0x41400000    # 12.0f

    .line 206
    .line 207
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v7

    .line 211
    sub-int/2addr v5, v7

    .line 212
    new-array v7, v4, [Landroid/view/View;

    .line 213
    .line 214
    aput-object p0, v7, v1

    .line 215
    .line 216
    invoke-static {v5, v7}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 217
    .line 218
    .line 219
    const/high16 v5, 0x42cc0000    # 102.0f

    .line 220
    .line 221
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 222
    .line 223
    .line 224
    move-result v7

    .line 225
    invoke-static {p0, v7}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 226
    .line 227
    .line 228
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->d:Landroid/widget/RelativeLayout;

    .line 229
    .line 230
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 231
    .line 232
    .line 233
    move-result v5

    .line 234
    invoke-static {v7, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 235
    .line 236
    .line 237
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->d:Landroid/widget/RelativeLayout;

    .line 238
    .line 239
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 240
    .line 241
    .line 242
    move-result v7

    .line 243
    invoke-static {v5, v7}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 244
    .line 245
    .line 246
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->d:Landroid/widget/RelativeLayout;

    .line 247
    .line 248
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    invoke-static {v5, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 253
    .line 254
    .line 255
    const/high16 v0, 0x42800000    # 64.0f

    .line 256
    .line 257
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->e:Landroid/widget/FrameLayout;

    .line 262
    .line 263
    new-array v8, v4, [Landroid/view/View;

    .line 264
    .line 265
    aput-object v7, v8, v1

    .line 266
    .line 267
    invoke-static {v5, v8}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 268
    .line 269
    .line 270
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->e:Landroid/widget/FrameLayout;

    .line 271
    .line 272
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    invoke-static {v5, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->b:Landroid/widget/FrameLayout;

    .line 280
    .line 281
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 282
    .line 283
    .line 284
    move-result v5

    .line 285
    invoke-static {v0, v5}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->j:Landroid/widget/TextView;

    .line 289
    .line 290
    const/high16 v5, 0x40000000    # 2.0f

    .line 291
    .line 292
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 293
    .line 294
    .line 295
    move-result v5

    .line 296
    invoke-static {v0, v5}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 297
    .line 298
    .line 299
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 300
    .line 301
    const/high16 v5, 0x40800000    # 4.0f

    .line 302
    .line 303
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 304
    .line 305
    .line 306
    move-result v5

    .line 307
    invoke-static {v0, v5}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 308
    .line 309
    .line 310
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->m:Landroid/widget/RelativeLayout;

    .line 311
    .line 312
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 316
    .line 317
    const/high16 v1, 0x41900000    # 18.0f

    .line 318
    .line 319
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 320
    .line 321
    .line 322
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->j:Landroid/widget/TextView;

    .line 323
    .line 324
    const/high16 v1, 0x41500000    # 13.0f

    .line 325
    .line 326
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 327
    .line 328
    .line 329
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 330
    .line 331
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 332
    .line 333
    .line 334
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->c:Landroid/widget/ImageView;

    .line 335
    .line 336
    sget v1, Ll/ibc0;->J:I

    .line 337
    .line 338
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 339
    .line 340
    .line 341
    :cond_2
    :goto_0
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 342
    .line 343
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v0, v4}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 347
    .line 348
    .line 349
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f:Lv/VDraweeView;

    .line 350
    .line 351
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    check-cast v1, Ll/wlj;

    .line 356
    .line 357
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 358
    .line 359
    .line 360
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 361
    .line 362
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 367
    .line 368
    .line 369
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 370
    .line 371
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 376
    .line 377
    .line 378
    if-ne p3, v2, :cond_3

    .line 379
    .line 380
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->q(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    goto :goto_1

    .line 384
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->s:Ll/kcg0;

    .line 385
    .line 386
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 387
    .line 388
    .line 389
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 390
    .line 391
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 392
    .line 393
    iget-object p2, p2, Ll/no7;->V:Lrx/subjects/a;

    .line 394
    .line 395
    invoke-interface {p1, p2}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    new-instance p2, Ll/u66;

    .line 400
    .line 401
    invoke-direct {p2, p0, p3}, Ll/u66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;I)V

    .line 402
    .line 403
    .line 404
    new-instance p3, Ll/v66;

    .line 405
    .line 406
    invoke-direct {p3}, Ll/v66;-><init>()V

    .line 407
    .line 408
    .line 409
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 410
    .line 411
    .line 412
    move-result-object p2

    .line 413
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->s:Ll/kcg0;

    .line 418
    .line 419
    :goto_1
    invoke-static {p0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 420
    .line 421
    .line 422
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->i:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, "\u5c81"

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_3

    .line 63
    .line 64
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 65
    .line 66
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_1

    .line 75
    .line 76
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_2

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 100
    .line 101
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    :cond_2
    const-string v3, "("

    .line 107
    .line 108
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 112
    .line 113
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 114
    .line 115
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->g(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v3, ")"

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    :cond_3
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-nez v3, :cond_5

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-nez v3, :cond_4

    .line 142
    .line 143
    const-string v3, " \u00b7 "

    .line 144
    .line 145
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    :cond_4
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->j:Landroid/widget/TextView;

    .line 160
    .line 161
    const/4 v4, 0x0

    .line 162
    if-eqz v2, :cond_6

    .line 163
    .line 164
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_6
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->j:Landroid/widget/TextView;

    .line 172
    .line 173
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 177
    .line 178
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->q:Landroid/widget/TextView;

    .line 182
    .line 183
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-nez p2, :cond_a

    .line 191
    .line 192
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 193
    .line 194
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 195
    .line 196
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 201
    .line 202
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 203
    .line 204
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    if-eqz p2, :cond_7

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_7
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 212
    .line 213
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 214
    .line 215
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 220
    .line 221
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 222
    .line 223
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->p:Landroid/widget/TextView;

    .line 228
    .line 229
    if-eqz p2, :cond_8

    .line 230
    .line 231
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->p:Landroid/widget/TextView;

    .line 235
    .line 236
    const-string p2, "\u6211\u8981\u4e0a\u5c01\u9762"

    .line 237
    .line 238
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    .line 240
    .line 241
    goto :goto_3

    .line 242
    :cond_8
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 243
    .line 244
    .line 245
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->p:Landroid/widget/TextView;

    .line 246
    .line 247
    new-instance v1, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    const-string v2, "\u548c"

    .line 250
    .line 251
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    if-eqz p1, :cond_9

    .line 259
    .line 260
    const-string p1, "\u5979"

    .line 261
    .line 262
    goto :goto_1

    .line 263
    :cond_9
    const-string p1, "\u4ed6"

    .line 264
    .line 265
    :goto_1
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    const-string p1, "\u804a\u804a"

    .line 269
    .line 270
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_a
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->p:Landroid/widget/TextView;

    .line 282
    .line 283
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 284
    .line 285
    .line 286
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 287
    .line 288
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 289
    .line 290
    .line 291
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->k:Lv/VMarqueeText;

    .line 292
    .line 293
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 294
    .line 295
    .line 296
    return-void
.end method

.method public n(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 12

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->u:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    const/4 v1, 0x0

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->v:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    const/4 v8, 0x0

    .line 27
    const-string v5, "from_greet_act"

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    invoke-interface/range {v2 .. v8}, Ll/r97;->A5(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->f()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget p1, Ll/y7c0;->e:I

    .line 42
    .line 43
    invoke-virtual {p0, p1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->t:Ll/pf60;

    .line 48
    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    goto/16 :goto_1

    .line 52
    .line 53
    :cond_1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v0, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 56
    .line 57
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const-string v3, "cover_status"

    .line 66
    .line 67
    const-string v4, "city_cover_uid"

    .line 68
    .line 69
    const-string v5, "p_messages_view"

    .line 70
    .line 71
    const-string v6, "e_message_city_cover"

    .line 72
    .line 73
    const/4 v7, 0x1

    .line 74
    if-eqz v2, :cond_6

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    instance-of p1, p1, Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    if-eqz p1, :cond_4

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->t:Ll/pf60;

    .line 91
    .line 92
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v2, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 95
    .line 96
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 99
    .line 100
    invoke-virtual {v8}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 107
    .line 108
    iget-object v10, v2, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v9, v10}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    iget-object v10, v2, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v11, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v10, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v10

    .line 122
    if-eqz v10, :cond_2

    .line 123
    .line 124
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 125
    .line 126
    .line 127
    move-result-object v8

    .line 128
    invoke-virtual {v8}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    invoke-interface {v8, p1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ap(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CityCData;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_2
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v10

    .line 140
    if-eqz v10, :cond_3

    .line 141
    .line 142
    iget-object v9, v9, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 143
    .line 144
    iget-object v8, v8, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 145
    .line 146
    invoke-static {v9, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 147
    .line 148
    .line 149
    move-result v8

    .line 150
    if-eqz v8, :cond_3

    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    invoke-virtual {v8}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    invoke-interface {v8, p1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ha(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CityCData;)V

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_3
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/ui/greet/d;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    :cond_4
    :goto_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->u:I

    .line 176
    .line 177
    if-ne p0, v7, :cond_5

    .line 178
    .line 179
    move v1, v7

    .line 180
    :cond_5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {v6, v5, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_9

    .line 201
    .line 202
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 207
    .line 208
    if-eqz v0, :cond_7

    .line 209
    .line 210
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-interface {v2, v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->C7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 225
    .line 226
    .line 227
    :cond_7
    const-string p1, ""

    .line 228
    .line 229
    invoke-static {v4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->u:I

    .line 234
    .line 235
    if-ne p0, v7, :cond_8

    .line 236
    .line 237
    move v1, v7

    .line 238
    :cond_8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-static {v6, v5, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 251
    .line 252
    .line 253
    :cond_9
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

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
    if-eqz v1, :cond_3

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 57
    .line 58
    iget v1, v1, Lcom/p1/mobile/putong/data/CityC;->cost:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move v1, v2

    .line 62
    :goto_0
    if-gtz v1, :cond_1

    .line 63
    .line 64
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 67
    .line 68
    iget-object v3, v3, Ll/no7;->V:Lrx/subjects/a;

    .line 69
    .line 70
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_1

    .line 79
    .line 80
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 83
    .line 84
    iget-object v3, v3, Ll/no7;->V:Lrx/subjects/a;

    .line 85
    .line 86
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Ll/pf60;

    .line 91
    .line 92
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 93
    .line 94
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_1

    .line 99
    .line 100
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v4, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 103
    .line 104
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {p1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_1

    .line 111
    .line 112
    iget-object p1, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 115
    .line 116
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CityCData;->cost:I

    .line 117
    .line 118
    :cond_1
    if-lez v1, :cond_2

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-interface {p1, v1}, Ll/r97;->G3(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->m(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->l:Landroid/view/View;

    .line 136
    .line 137
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    const/4 p1, 0x1

    .line 141
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->o(Z)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h()V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->h()V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public setMomentId(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setOnAvatarClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    return-void
.end method

.method public setShowGreetLayout(Z)V
    .locals 0

    return-void
.end method
