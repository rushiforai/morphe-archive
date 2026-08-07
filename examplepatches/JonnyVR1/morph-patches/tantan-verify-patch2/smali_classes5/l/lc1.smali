.class public Ll/lc1;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VDraweeView;

.field public m:Landroid/widget/ImageView;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VDraweeView;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Landroid/view/View;

.field public u:Lcom/p1/mobile/android/app/Act;

.field public v:Ll/l4g0;

.field public w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

.field public x:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/dgc0;->b:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    const/16 v1, 0x18

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 15
    .line 16
    iput-object p1, p0, Ll/lc1;->u:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    iput-object p2, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic E(Ll/lc1;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lc1;->Q(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic F(Ll/lc1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lc1;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/lc1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lc1;->S(Landroid/view/View;)V

    return-void
.end method

.method private L(I)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6bcf\u5468\u65e5"

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string p0, "\u6bcf\u5468"

    .line 7
    .line 8
    :pswitch_0
    return-object p0

    .line 9
    :pswitch_1
    const-string p0, "\u6bcf\u5468\u516d"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    const-string p0, "\u6bcf\u5468\u4e94"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    const-string p0, "\u6bcf\u5468\u56db"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    const-string p0, "\u6bcf\u5468\u4e09"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    const-string p0, "\u6bcf\u5468\u4e8c"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    const-string p0, "\u6bcf\u5468\u4e00"

    .line 25
    .line 26
    :pswitch_7
    return-object p0

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private M()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/lc1;->n:Lv/VImage;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->wo:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/lc1;->l:Lv/VDraweeView;

    .line 11
    .line 12
    const/high16 v2, 0x43880000    # 272.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const-string v4, "https://static.tancdn.com/pe-webplatform/XJvjQCUAgG5U7X23Hy_4Mgxo.webp"

    .line 23
    .line 24
    invoke-virtual {v0, v1, v4, v3, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/lc1;->k:Lv/VDraweeView;

    .line 30
    .line 31
    const/high16 v2, 0x436c0000    # 236.0f

    .line 32
    .line 33
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/high16 v3, 0x43640000    # 228.0f

    .line 38
    .line 39
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const-string v4, "https://static.tancdn.com/pe-webplatform/0ehHwqaySoNpt_4Ce5KsYbDq.webp"

    .line 44
    .line 45
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 46
    .line 47
    .line 48
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object p0, p0, Ll/lc1;->q:Lv/VDraweeView;

    .line 51
    .line 52
    const v1, 0x439b8000    # 311.0f

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const/high16 v2, 0x43a00000    # 320.0f

    .line 60
    .line 61
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const-string v3, "https://static.tancdn.com/pe-webplatform/WZj8NDixaW5RhIFWlQug_4JA.webp"

    .line 66
    .line 67
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private N()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/lc1;->n:Lv/VImage;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->xo:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/lc1;->l:Lv/VDraweeView;

    .line 11
    .line 12
    const/high16 v2, 0x43880000    # 272.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const-string v4, "https://static.tancdn.com/pe-webplatform/d1leZpYbk787D4DthEXMG_EV.webp"

    .line 23
    .line 24
    invoke-virtual {v0, v1, v4, v3, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/lc1;->k:Lv/VDraweeView;

    .line 30
    .line 31
    const/high16 v2, 0x436c0000    # 236.0f

    .line 32
    .line 33
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/high16 v3, 0x43640000    # 228.0f

    .line 38
    .line 39
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const-string v4, "https://static.tancdn.com/pe-webplatform/4Mf14tKMzXfmszs-NB4SdlaY.webp"

    .line 44
    .line 45
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 46
    .line 47
    .line 48
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object p0, p0, Ll/lc1;->q:Lv/VDraweeView;

    .line 51
    .line 52
    const v1, 0x439b8000    # 311.0f

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const/high16 v2, 0x43a00000    # 320.0f

    .line 60
    .line 61
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const-string v3, "https://static.tancdn.com/pe-webplatform/Espsnpgm79p15sNAVGOcsGTv.webp"

    .line 66
    .line 67
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

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
    iget-object v0, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 12
    .line 13
    const-string v1, "quickchat"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Ll/lc1;->N()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-direct {p0}, Ll/lc1;->M()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private P()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/lc1;->O()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/lc1;->p:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lc1;->K()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/lc1;->r:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/lc1;->I()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/lc1;->m:Landroid/widget/ImageView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 29
    .line 30
    invoke-static {}, Ll/bnl0;->F0()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sget v2, Ll/qa00;->g:I

    .line 35
    .line 36
    add-int/2addr v1, v2

    .line 37
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 38
    .line 39
    iget-object v0, p0, Ll/lc1;->o:Lv/VText;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/lc1;->s:Lv/VText;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/ic1;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/ic1;-><init>(Ll/lc1;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/lc1;->s:Lv/VText;

    .line 67
    .line 68
    new-instance v1, Ll/jc1;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/jc1;-><init>(Ll/lc1;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/lc1;->m:Landroid/widget/ImageView;

    .line 77
    .line 78
    new-instance v1, Ll/kc1;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/kc1;-><init>(Ll/lc1;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private synthetic Q(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lc1;->v:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

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
    iget-object p1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 12
    .line 13
    const-string v0, "quickchat"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    invoke-virtual {p0}, Ll/lc1;->dismiss()V

    .line 25
    .line 26
    .line 27
    const-string v0, "remainingtimes"

    .line 28
    .line 29
    const-string v1, "p_quickchat_party_begin"

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "e_quickchat_button"

    .line 50
    .line 51
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/lc1;->u:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    const-string p1, "text_quickchat_party"

    .line 57
    .line 58
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 59
    .line 60
    const-string v1, "quick_chat"

    .line 61
    .line 62
    invoke-static {p0, v1, p1, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-static {}, Ll/wyb0;->i0()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {p1}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string v0, "e_voicechat_button"

    .line 87
    .line 88
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/lc1;->u:Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    const-string p1, "voice_quickchat_party"

    .line 94
    .line 95
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 96
    .line 97
    const-string v1, "voice_quick_chat"

    .line 98
    .line 99
    invoke-static {p0, v1, p1, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lc1;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private T()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x4000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v0, 0x500

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static U(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/lc1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/lc1;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/lc1;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/mc1;->b(Ll/lc1;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final I()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u6d3b\u52a8\u706b\u70ed\u8fdb\u884c\u4e2d\n\u76ee\u524d\u5171\u6709"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/lc1;->J()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "\u4eba\u5728\u7ebf\u70ed\u804a"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final J()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xb

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/16 v3, 0x223a

    .line 19
    .line 20
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/16 v4, 0x2b06

    .line 25
    .line 26
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const/16 v3, 0x1598

    .line 45
    .line 46
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const/16 v4, 0x2625

    .line 51
    .line 52
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 64
    .line 65
    const/4 v2, 0x2

    .line 66
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const/16 v3, 0x123d

    .line 71
    .line 72
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    const/16 v4, 0x1811

    .line 77
    .line 78
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 90
    .line 91
    const/4 v2, 0x3

    .line 92
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    const/16 v3, 0xc8b

    .line 97
    .line 98
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    const/16 v4, 0x1453

    .line 103
    .line 104
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 116
    .line 117
    const/4 v2, 0x4

    .line 118
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    const/16 v3, 0xb41

    .line 123
    .line 124
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    const/16 v4, 0xdfa

    .line 129
    .line 130
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 142
    .line 143
    const/4 v2, 0x5

    .line 144
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    const/16 v3, 0x1099

    .line 149
    .line 150
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    const/16 v4, 0x1774

    .line 155
    .line 156
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 168
    .line 169
    const/4 v2, 0x6

    .line 170
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    const/16 v3, 0x150c

    .line 175
    .line 176
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    const/16 v4, 0x1f82

    .line 181
    .line 182
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 194
    .line 195
    const/4 v2, 0x7

    .line 196
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const/16 v3, 0x1c46

    .line 201
    .line 202
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    const/16 v4, 0x276d

    .line 207
    .line 208
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 220
    .line 221
    const/16 v2, 0x8

    .line 222
    .line 223
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    const/16 v3, 0x209b

    .line 228
    .line 229
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    const/16 v4, 0x2be6

    .line 234
    .line 235
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 247
    .line 248
    const/16 v2, 0x9

    .line 249
    .line 250
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    const/16 v3, 0x244e

    .line 255
    .line 256
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    const/16 v4, 0x2f99

    .line 261
    .line 262
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 274
    .line 275
    const/16 v2, 0xa

    .line 276
    .line 277
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    const/16 v3, 0x2b9c

    .line 282
    .line 283
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    const/16 v4, 0x3003

    .line 288
    .line 289
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 301
    .line 302
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    const/16 v3, 0x2fe5

    .line 307
    .line 308
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    const/16 v4, 0x3225

    .line 313
    .line 314
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 315
    .line 316
    .line 317
    move-result-object v4

    .line 318
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 326
    .line 327
    const/16 v2, 0xc

    .line 328
    .line 329
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    const/16 v3, 0x29d3

    .line 334
    .line 335
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    const/16 v4, 0x30a6

    .line 340
    .line 341
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 353
    .line 354
    const/16 v2, 0xd

    .line 355
    .line 356
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    const/16 v3, 0x2c92

    .line 361
    .line 362
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 363
    .line 364
    .line 365
    move-result-object v3

    .line 366
    const/16 v4, 0x315f

    .line 367
    .line 368
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 380
    .line 381
    const/16 v2, 0xe

    .line 382
    .line 383
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    const/16 v3, 0x2cb4

    .line 388
    .line 389
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    const/16 v4, 0x31d7

    .line 394
    .line 395
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 396
    .line 397
    .line 398
    move-result-object v4

    .line 399
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 407
    .line 408
    const/16 v2, 0xf

    .line 409
    .line 410
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    const/16 v3, 0x2bc3

    .line 415
    .line 416
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 417
    .line 418
    .line 419
    move-result-object v3

    .line 420
    const/16 v4, 0x311a

    .line 421
    .line 422
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 423
    .line 424
    .line 425
    move-result-object v4

    .line 426
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 427
    .line 428
    .line 429
    move-result-object v3

    .line 430
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 434
    .line 435
    const/16 v2, 0x10

    .line 436
    .line 437
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    const/16 v3, 0x2cfc

    .line 442
    .line 443
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 444
    .line 445
    .line 446
    move-result-object v3

    .line 447
    const/16 v4, 0x3272

    .line 448
    .line 449
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 450
    .line 451
    .line 452
    move-result-object v4

    .line 453
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 454
    .line 455
    .line 456
    move-result-object v3

    .line 457
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 461
    .line 462
    const/16 v2, 0x11

    .line 463
    .line 464
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 465
    .line 466
    .line 467
    move-result-object v2

    .line 468
    const/16 v3, 0x2a1d

    .line 469
    .line 470
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 471
    .line 472
    .line 473
    move-result-object v3

    .line 474
    const/16 v4, 0x3041

    .line 475
    .line 476
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 477
    .line 478
    .line 479
    move-result-object v4

    .line 480
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 481
    .line 482
    .line 483
    move-result-object v3

    .line 484
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 488
    .line 489
    const/16 v2, 0x12

    .line 490
    .line 491
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    const/16 v3, 0x2c35

    .line 496
    .line 497
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 498
    .line 499
    .line 500
    move-result-object v3

    .line 501
    const/16 v4, 0x32cf

    .line 502
    .line 503
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 504
    .line 505
    .line 506
    move-result-object v4

    .line 507
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 508
    .line 509
    .line 510
    move-result-object v3

    .line 511
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    .line 513
    .line 514
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 515
    .line 516
    const/16 v2, 0x13

    .line 517
    .line 518
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 519
    .line 520
    .line 521
    move-result-object v2

    .line 522
    const/16 v3, 0x2e8d

    .line 523
    .line 524
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 525
    .line 526
    .line 527
    move-result-object v3

    .line 528
    const/16 v4, 0x390c

    .line 529
    .line 530
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 531
    .line 532
    .line 533
    move-result-object v4

    .line 534
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 535
    .line 536
    .line 537
    move-result-object v3

    .line 538
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 542
    .line 543
    const/16 v2, 0x14

    .line 544
    .line 545
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 546
    .line 547
    .line 548
    move-result-object v2

    .line 549
    const/16 v3, 0x3444

    .line 550
    .line 551
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 552
    .line 553
    .line 554
    move-result-object v3

    .line 555
    const/16 v4, 0x3d79

    .line 556
    .line 557
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 558
    .line 559
    .line 560
    move-result-object v4

    .line 561
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 562
    .line 563
    .line 564
    move-result-object v3

    .line 565
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    .line 567
    .line 568
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 569
    .line 570
    const/16 v2, 0x15

    .line 571
    .line 572
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 573
    .line 574
    .line 575
    move-result-object v2

    .line 576
    const/16 v3, 0x379e

    .line 577
    .line 578
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 579
    .line 580
    .line 581
    move-result-object v3

    .line 582
    const/16 v4, 0x3e7b

    .line 583
    .line 584
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 585
    .line 586
    .line 587
    move-result-object v4

    .line 588
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 589
    .line 590
    .line 591
    move-result-object v3

    .line 592
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    .line 594
    .line 595
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 596
    .line 597
    const/16 v2, 0x16

    .line 598
    .line 599
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 600
    .line 601
    .line 602
    move-result-object v2

    .line 603
    const/16 v3, 0x32d6

    .line 604
    .line 605
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 606
    .line 607
    .line 608
    move-result-object v3

    .line 609
    const/16 v4, 0x35e1

    .line 610
    .line 611
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 612
    .line 613
    .line 614
    move-result-object v4

    .line 615
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 616
    .line 617
    .line 618
    move-result-object v3

    .line 619
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    iget-object v0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 623
    .line 624
    const/16 v2, 0x17

    .line 625
    .line 626
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 627
    .line 628
    .line 629
    move-result-object v2

    .line 630
    const/16 v3, 0x2e05

    .line 631
    .line 632
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 633
    .line 634
    .line 635
    move-result-object v3

    .line 636
    const/16 v4, 0x3127

    .line 637
    .line 638
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 639
    .line 640
    .line 641
    move-result-object v4

    .line 642
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 643
    .line 644
    .line 645
    move-result-object v3

    .line 646
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 647
    .line 648
    .line 649
    :cond_0
    iget-object p0, p0, Ll/lc1;->x:Ljava/util/Map;

    .line 650
    .line 651
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 652
    .line 653
    .line 654
    move-result-object v0

    .line 655
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 656
    .line 657
    .line 658
    move-result v0

    .line 659
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 660
    .line 661
    .line 662
    move-result-object v0

    .line 663
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    .line 665
    .line 666
    move-result-object p0

    .line 667
    check-cast p0, Ll/pf60;

    .line 668
    .line 669
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 670
    .line 671
    check-cast v0, Ljava/lang/Integer;

    .line 672
    .line 673
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 674
    .line 675
    .line 676
    move-result v0

    .line 677
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 678
    .line 679
    check-cast v1, Ljava/lang/Integer;

    .line 680
    .line 681
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 682
    .line 683
    .line 684
    move-result v1

    .line 685
    sub-int/2addr v0, v1

    .line 686
    int-to-double v0, v0

    .line 687
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 688
    .line 689
    .line 690
    move-result-wide v2

    .line 691
    mul-double/2addr v0, v2

    .line 692
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 693
    .line 694
    check-cast p0, Ljava/lang/Integer;

    .line 695
    .line 696
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 697
    .line 698
    .line 699
    move-result p0

    .line 700
    int-to-double v2, p0

    .line 701
    add-double/2addr v0, v2

    .line 702
    double-to-int p0, v0

    .line 703
    return p0
.end method

.method public final K()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 7
    .line 8
    if-eqz v1, :cond_3

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->isValueAvailable()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 18
    .line 19
    iget v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->weekDay:I

    .line 20
    .line 21
    invoke-direct {p0, v1}, Ll/lc1;->L(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 29
    .line 30
    iget v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    const/16 v3, 0x9

    .line 34
    .line 35
    if-le v1, v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 45
    .line 46
    iget v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->beginHour:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    :goto_0
    const-string v1, ":00\u81f3"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 57
    .line 58
    iget v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 59
    .line 60
    if-le v1, v3, :cond_2

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 70
    .line 71
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->endHour:I

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :goto_1
    const-string p0, ":00\uff0c\u9650\u65f6\u5f00\u542f"

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_3
    :goto_2
    const-string p0, "\u6bcf\u5468"

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method

.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/g1e;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/lc1;->u:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/lc1;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/lc1;->t:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/lc1;->T()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/lc1;->P()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "p_quickchat_party_begin"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/lc1;->v:Ll/l4g0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/lc1;->w:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->partyType:Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 31
    .line 32
    const-string v2, "quickchat"

    .line 33
    .line 34
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v1, 0x1

    .line 43
    :goto_0
    const-string v2, "is_voicechat"

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/lc1;->v:Ll/l4g0;

    .line 61
    .line 62
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
