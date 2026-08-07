.class public Ll/der;
.super Ll/f6l;
.source "SourceFile"


# static fields
.field public static final o:I


# instance fields
.field public f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardPhotoFrame;

.field public g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundLinearLayout;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/data/User;

.field public m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public n:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->L0:I

    .line 2
    .line 3
    sput v0, Ll/der;->o:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ll/der;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/der;->K(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/der;ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/der;->J(ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ll/der;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/der;->L(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic G(Ll/pf60;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Integer;

    .line 4
    .line 5
    return-object p0
.end method

.method private O()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-static {v0}, Ll/br5;->p(Lcom/p1/mobile/putong/data/User;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 44
    .line 45
    if-ne p0, v0, :cond_1

    .line 46
    .line 47
    :cond_0
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return p0
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p1, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iput p5, p0, Ll/der;->n:I

    .line 6
    .line 7
    invoke-virtual {p0, p5}, Ll/der;->N(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/der;->I()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 14
    .line 15
    new-instance p2, Ll/der$a;

    .line 16
    .line 17
    invoke-direct {p2, p0}, Ll/der$a;-><init>(Ll/der;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eer;->a(Ll/der;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final I()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/der;->h:Lv/VImage;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-direct {p0}, Ll/der;->O()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Ll/der;->h:Lv/VImage;

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 22
    .line 23
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 24
    .line 25
    if-ne v1, v2, :cond_1

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    :goto_0
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const-string v0, "profile_life_photo_compliment_btn"

    .line 33
    .line 34
    invoke-static {v0}, Ll/gp5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_2

    .line 43
    .line 44
    iget-object v2, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Ll/f6l;->A(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2, v0}, Ll/gp5;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v0, p0, Ll/der;->h:Lv/VImage;

    .line 54
    .line 55
    new-instance v2, Ll/zdr;

    .line 56
    .line 57
    invoke-direct {v2, p0, v1}, Ll/zdr;-><init>(Ll/der;Z)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    return-void
.end method

.method public final synthetic J(ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-static {}, Ll/fp5;->i()Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D2()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->V4()Ll/g6a0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Ll/g6a0;->n1(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 56
    .line 57
    return-object p0
.end method

.method public final synthetic K(ZLandroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-object v0, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 11
    .line 12
    iget-object v1, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    const-string v2, "profile_life_photo_compliment_btn"

    .line 15
    .line 16
    invoke-static {p2, v0, v1, v2}, Ll/np5;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget p2, p0, Ll/der;->n:I

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    new-instance v5, Ll/cer;

    .line 36
    .line 37
    invoke-direct {v5, p0, p1}, Ll/cer;-><init>(Ll/der;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 41
    .line 42
    iget-object v6, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveRoomInfo:Ljava/lang/String;

    .line 43
    .line 44
    const-string v2, "profile_life_photo_compliment_btn"

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-static/range {v0 .. v6}, Ll/fp5;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/Integer;Ll/x20;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x64

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/der;->i:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundLinearLayout;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->F(Lcom/p1/mobile/putong/data/Media;I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 2
    .line 3
    const-string v0, "raw"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/nwb;->n(Lcom/p1/mobile/putong/data/Media;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final N(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/der;->i:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundLinearLayout;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/d79;->e0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/der;->k:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/der;->k:Lv/VText;

    .line 30
    .line 31
    sget v3, Ll/qa00;->h:I

    .line 32
    .line 33
    invoke-virtual {v0, v3, v1, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/der;->k:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    sget v4, Lcom/p1/mobile/putong/core/R$string;->t9:I

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/der;->j:Lv/VImage;

    .line 52
    .line 53
    sget v3, Ll/dbc0;->J9:I

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-le v0, p1, :cond_6

    .line 67
    .line 68
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v3, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 75
    .line 76
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 77
    .line 78
    const-string v4, "live_profile_voice_mask_mode"

    .line 79
    .line 80
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_2

    .line 85
    .line 86
    iget-object v3, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 87
    .line 88
    invoke-virtual {v3, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->F(Lcom/p1/mobile/putong/data/Media;I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    iget-object v3, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    invoke-static {v3}, Ll/vmf;->f(Lcom/p1/mobile/putong/data/User;)Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-eqz v3, :cond_4

    .line 99
    .line 100
    sget-object v3, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 101
    .line 102
    iget-object v4, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v3, v4}, Ll/p6w;->C(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_3

    .line 111
    .line 112
    iget-object v3, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 113
    .line 114
    invoke-virtual {v3, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->F(Lcom/p1/mobile/putong/data/Media;I)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-object v4, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 123
    .line 124
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v3, v4}, Ll/p6w;->F(Ljava/lang/String;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {p0, v1, v3}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    new-instance v3, Ll/aer;

    .line 135
    .line 136
    invoke-direct {v3}, Ll/aer;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    new-instance v3, Ll/ber;

    .line 144
    .line 145
    invoke-direct {v3, p0, v0}, Ll/ber;-><init>(Ll/der;Lcom/p1/mobile/putong/data/Media;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    :goto_0
    iget-object v0, p0, Ll/der;->m:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 158
    .line 159
    const-string v1, "from_voice_buzz"

    .line 160
    .line 161
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_5

    .line 166
    .line 167
    iget-object v0, p0, Ll/der;->i:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundLinearLayout;

    .line 168
    .line 169
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_4
    iget-object v1, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 174
    .line 175
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->E(Lcom/p1/mobile/putong/data/Media;)V

    .line 176
    .line 177
    .line 178
    :cond_5
    :goto_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 179
    .line 180
    const/16 v1, 0x21

    .line 181
    .line 182
    if-lt v0, v1, :cond_6

    .line 183
    .line 184
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 185
    .line 186
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 187
    .line 188
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    add-int/2addr p1, v2

    .line 193
    if-le v0, p1, :cond_6

    .line 194
    .line 195
    iget-object v0, p0, Ll/der;->l:Lcom/p1/mobile/putong/data/User;

    .line 196
    .line 197
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-virtual {p0, p1}, Ll/der;->M(Lcom/p1/mobile/putong/data/Media;)V

    .line 202
    .line 203
    .line 204
    :cond_6
    :goto_2
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/der;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;->LIFE_PHOTO:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->setStyle(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->C()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/dmf;->s()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
