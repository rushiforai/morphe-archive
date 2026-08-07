.class public Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public k:Ll/b5c0;

.field public l:Z

.field public m:Lcom/p1/mobile/putong/core/data/VirtualCardType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->l:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->l:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->l:Z

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;Ll/b5c0;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->l(Ll/b5c0;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fc1;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->isValueAvailable()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->weekDay:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->h(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->beginHour:I

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const/16 v2, 0x9

    .line 28
    .line 29
    if-le p0, v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->beginHour:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    :goto_0
    const-string p0, ":00\u81f3"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->endHour:I

    .line 49
    .line 50
    if-le p0, v2, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->endHour:I

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :goto_1
    const-string p0, ":00\uff0c\u9650\u65f6\u5f00\u542f"

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_3
    :goto_2
    const-string p0, "\u6bcf\u5468"

    .line 75
    .line 76
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public final h(I)Ljava/lang/String;
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

.method public final i()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->d:Lv/VImage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->c:Lv/VDraweeView;

    .line 11
    .line 12
    const-string v2, "https://static.tancdn.com/pe-webplatform/3Sprv2rbsGvUxNUpmnj-9lwF.webp"

    .line 13
    .line 14
    sget v3, Ll/qa00;->Z:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->b:Lv/VDraweeView;

    .line 22
    .line 23
    const/high16 v2, 0x433e0000    # 190.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/high16 v3, 0x43140000    # 148.0f

    .line 30
    .line 31
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const-string v4, "https://static.tancdn.com/pe-webplatform/hTh3ByKmdeJRuvqaA0TNInZj.webp"

    .line 36
    .line 37
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->g:Lv/VDraweeView;

    .line 43
    .line 44
    const v1, 0x43958000    # 299.0f

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/high16 v2, 0x437a0000    # 250.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const-string v3, "https://static.tancdn.com/pe-webplatform/gcyXEc-3NM-VdbuEN0wPLIzc.webp"

    .line 58
    .line 59
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final j()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->d:Lv/VImage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->c:Lv/VDraweeView;

    .line 11
    .line 12
    const-string v2, "https://static.tancdn.com/pe-webplatform/_DZZOUF4eeLN6ug6QNvVkgTH.webp"

    .line 13
    .line 14
    sget v3, Ll/qa00;->Z:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->b:Lv/VDraweeView;

    .line 22
    .line 23
    const/high16 v2, 0x433e0000    # 190.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/high16 v3, 0x43140000    # 148.0f

    .line 30
    .line 31
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const-string v4, "https://static.tancdn.com/pe-webplatform/G9SeajOtK1zJHOcY3uSSUD5h.webp"

    .line 36
    .line 37
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->g:Lv/VDraweeView;

    .line 43
    .line 44
    const v1, 0x43958000    # 299.0f

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/high16 v2, 0x437a0000    # 250.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const-string v3, "https://static.tancdn.com/pe-webplatform/iKiD6UfDTb_pOoQZ2RHTCzP5.webp"

    .line 58
    .line 59
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->k:Ll/b5c0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->k:Ll/b5c0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/b5c0;->d:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->TextQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->m:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->j()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AudioQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->m:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->i()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic l(Ll/b5c0;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->m:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object p3, Lcom/p1/mobile/putong/core/data/VirtualCardType;->TextQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne p0, p3, :cond_0

    .line 6
    .line 7
    const-string p0, "quickchat_party"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "voice_quickchat_party"

    .line 11
    .line 12
    :goto_0
    const-string p3, "quickchat_activity_card_type"

    .line 13
    .line 14
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p3, "e_card_quickchat_activity"

    .line 23
    .line 24
    const-string v0, "p_suggest_users_home_view"

    .line 25
    .line 26
    invoke-static {p3, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    iput-object p0, p1, Ll/b5c0;->c:Ljava/lang/Boolean;

    .line 32
    .line 33
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 40
    .line 41
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/b5c0;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->j:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->k:Ll/b5c0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->k()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->f:Lv/VText;

    .line 14
    .line 15
    invoke-static {}, Ll/i5c0;->i()Ll/i5c0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Ll/i5c0;->a:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->f(Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->l:Z

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->l:Z

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->m:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->TextQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 38
    .line 39
    if-ne v0, v1, :cond_1

    .line 40
    .line 41
    const-string v0, "quickchat_party"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string v0, "voice_quickchat_party"

    .line 45
    .line 46
    :goto_0
    const-string v1, "quickchat_activity_card_type"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    filled-new-array {v0}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "e_card_quickchat_activity"

    .line 57
    .line 58
    const-string v2, "p_suggest_users_home_view"

    .line 59
    .line 60
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->i:Lv/VText;

    .line 64
    .line 65
    new-instance v1, Ll/ec1;

    .line 66
    .line 67
    invoke-direct {v1, p0, p2, p1}, Ll/ec1;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;Ll/b5c0;Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->i:Lv/VText;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
