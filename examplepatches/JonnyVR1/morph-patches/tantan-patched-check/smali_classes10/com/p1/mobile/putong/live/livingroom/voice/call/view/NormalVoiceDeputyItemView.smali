.class public Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/tcn0;


# instance fields
.field public A:Ll/qdh0;

.field public B:Ljava/text/DecimalFormat;

.field public C:Ll/kcg0;

.field public final D:Lcom/tantan/library/svga/AnimListener;

.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Landroid/widget/ImageView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

.field public q:Lv/VDraweeView;

.field public r:Lv/VLinear;

.field public s:Lv/VText;

.field public t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public u:Lv/VLinear;

.field public v:Landroid/widget/ImageView;

.field public w:Lcom/tantan/library/svga/SVGAnimationView;

.field public x:Landroid/widget/TextView;

.field public y:Ljava/lang/String;

.field public z:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 24
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p1, "https://auto.tancdn.com/v1/raw/a5705b18-7436-41ec-8ab5-b094eacd298211.pdf"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->y:Ljava/lang/String;

    .line 7
    .line 8
    const/high16 p1, -0x80000000

    .line 9
    .line 10
    invoke-static {p1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->z:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView$a;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->D:Lcom/tantan/library/svga/AnimListener;

    .line 22
    .line 23
    return-void
.end method

.method private getVoiceAnimUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->y:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ll/ixm0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ixm0;->i4(Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Ll/h64;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Ll/ixm0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ixm0;->i4(Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n(Ll/h64;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/ixm0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ixm0;->i4(Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;ZZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    return-void
.end method


# virtual methods
.method public final A(Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final B(ZZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->n:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    if-nez p2, :cond_1

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 13
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->q:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 27
    .line 28
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final C(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/wlj;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->z:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-virtual {v0, p0}, Ll/wlj;->C(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->s0()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ptk0;->e:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 18
    .line 19
    sget p1, Ll/obc0;->F1:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->g()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public H(D)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "#,###"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B:Ljava/text/DecimalFormat;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    new-instance v1, Ljava/util/Locale;

    .line 8
    .line 9
    const-string v2, "en"

    .line 10
    .line 11
    const-string v3, "US"

    .line 12
    .line 13
    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/text/DecimalFormat;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B:Ljava/text/DecimalFormat;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v1

    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ljava/text/DecimalFormat;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B:Ljava/text/DecimalFormat;

    .line 38
    .line 39
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B:Ljava/text/DecimalFormat;

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->w()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->G()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b(Ljava/util/List;Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->F()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v(Ljava/util/List;Ljava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x1

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->j()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 33
    .line 34
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const/4 v4, 0x2

    .line 55
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p2, v2, v3, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-lt p2, v0, :cond_3

    .line 77
    .line 78
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 83
    .line 84
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->q:Lv/VDraweeView;

    .line 96
    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    const-string v2, "context_single_room"

    .line 108
    .line 109
    invoke-static {v2, p2, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->j()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public c(ILl/ixm0;)V
    .locals 2
    .param p2    # Ll/ixm0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/ixm0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    new-instance v1, Ll/bx40;

    .line 4
    .line 5
    invoke-direct {v1, p2, p1}, Ll/bx40;-><init>(Ll/ixm0;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 12
    .line 13
    new-instance v1, Ll/cx40;

    .line 14
    .line 15
    invoke-direct {v1, p2, p1}, Ll/cx40;-><init>(Ll/ixm0;I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->e:Lv/VDraweeView;

    .line 22
    .line 23
    new-instance v0, Ll/dx40;

    .line 24
    .line 25
    invoke-direct {v0, p2, p1}, Ll/dx40;-><init>(Ll/ixm0;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public d(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v(Ljava/util/List;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->b()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->f(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 49
    .line 50
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-ge p2, v0, :cond_2

    .line 59
    .line 60
    :goto_0
    return-void

    .line 61
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 70
    .line 71
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 78
    .line 79
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    check-cast p2, Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-eqz p2, :cond_3

    .line 90
    .line 91
    invoke-virtual {p0, v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 96
    .line 97
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getLoadingSvg()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView$b;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;)V

    .line 110
    .line 111
    .line 112
    const/4 v1, -0x1

    .line 113
    invoke-virtual {p2, p1, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 117
    .line 118
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ll/nsv;Ll/ixm0;Ll/wao0;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveMember;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/nsv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/ixm0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ll/wao0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/ixm0<",
            "*>;",
            "Ll/wao0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->G()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 32
    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 36
    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->C(Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 50
    .line 51
    sget v4, Ll/obc0;->l9:I

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->C(Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->G()V

    .line 65
    .line 66
    .line 67
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 68
    .line 69
    iget-object v4, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v4, Ll/h64;

    .line 72
    .line 73
    iget-object v4, v4, Ll/h64;->b:Ljava/lang/String;

    .line 74
    .line 75
    const/4 v5, -0x1

    .line 76
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 77
    .line 78
    invoke-static {v2, v4, v5, v6}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s:Lv/VText;

    .line 82
    .line 83
    iget v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 84
    .line 85
    add-int/2addr v4, v1

    .line 86
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s:Lv/VText;

    .line 94
    .line 95
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 99
    .line 100
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 104
    .line 105
    if-nez v2, :cond_3

    .line 106
    .line 107
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p0, p4, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->u(Ll/ixm0;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result p4

    .line 113
    if-eqz p4, :cond_3

    .line 114
    .line 115
    invoke-static {p1}, Ll/guk0;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 120
    .line 121
    if-eqz p2, :cond_2

    .line 122
    .line 123
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->ti:I

    .line 124
    .line 125
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 133
    .line 134
    sget p4, Ll/obc0;->A:I

    .line 135
    .line 136
    invoke-virtual {p2, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->uf:I

    .line 141
    .line 142
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 150
    .line 151
    sget p4, Ll/obc0;->s0:I

    .line 152
    .line 153
    invoke-virtual {p2, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 154
    .line 155
    .line 156
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 157
    .line 158
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_3
    if-eqz p2, :cond_4

    .line 163
    .line 164
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 165
    .line 166
    if-eqz p2, :cond_4

    .line 167
    .line 168
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 169
    .line 170
    sget p4, Ll/obc0;->B:I

    .line 171
    .line 172
    invoke-virtual {p2, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 173
    .line 174
    .line 175
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 176
    .line 177
    sget p4, Lcom/p1/mobile/putong/live/livingroom/R$string;->l7:I

    .line 178
    .line 179
    invoke-static {p4}, Ll/xau;->t(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p4

    .line 183
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 187
    .line 188
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 193
    .line 194
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    :goto_2
    invoke-virtual {p0, p1, p3, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t(Ll/wao0;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s(Ll/nsv;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public f(ILl/ixm0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->j:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 18
    .line 19
    const-string v2, "#4DFFFFFF"

    .line 20
    .line 21
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Mf:I

    .line 35
    .line 36
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->A(Landroid/widget/TextView;I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->u:Lv/VLinear;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 79
    .line 80
    const-string v2, "0"

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->G()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->C(Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_0

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_0

    .line 114
    .line 115
    const/16 v0, 0x9

    .line 116
    .line 117
    if-ne p1, v0, :cond_0

    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 120
    .line 121
    const-string v0, "BOSS"

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->m:Lv/VText;

    .line 127
    .line 128
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->e:Lv/VDraweeView;

    .line 132
    .line 133
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 137
    .line 138
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->a:Lv/VDraweeView;

    .line 142
    .line 143
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->w:Lcom/tantan/library/svga/SVGAnimationView;

    .line 147
    .line 148
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v1, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 163
    .line 164
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->r(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->h:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v0, 0x42300000    # 44.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v2, "context_single_room"

    .line 14
    .line 15
    invoke-static {v2, p0, p1, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(IZLl/ixm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->f(ILl/ixm0;)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public i(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->n0(F)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->F()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->B(ZZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->G()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->F()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->C:Ll/kcg0;

    .line 16
    .line 17
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qdh0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v1, v2}, Ll/qdh0;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->A:Ll/qdh0;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 18
    .line 19
    const/high16 v1, 0x42040000    # 33.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/high16 v3, 0x40e00000    # 7.0f

    .line 30
    .line 31
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    neg-int v3, v3

    .line 36
    const/high16 v4, 0x41280000    # 10.5f

    .line 37
    .line 38
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    neg-int v4, v4

    .line 43
    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->d(IIII)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->setClearsAfterStop(Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gx40;->a(Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->z()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->bgUrl:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->c:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->bgUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->addUrl:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->addUrl:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->bossUrl:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->e:Lv/VDraweeView;

    .line 52
    .line 53
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->bossUrl:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->indexColor:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->indexColor:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    :cond_5
    return-void
.end method

.method public final s(Ll/nsv;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 17
    .line 18
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->remainingSec:I

    .line 23
    .line 24
    if-gtz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 28
    .line 29
    const/high16 v0, 0x42680000    # 58.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, ""

    .line 46
    .line 47
    invoke-static {p0, v0, v1, p1, v2}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->j0()V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method

.method public setItemPlaceRes(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVoiceAnimUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->y:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final t(Ll/wao0;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/wao0;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget v1, Ll/wao0;->f:I

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/wao0;->d()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1}, Ll/wao0;->e()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p1, p1, Ll/wao0;->e:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget v1, Ll/wao0;->g:I

    .line 26
    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/wao0;->d()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Ll/wao0;->e()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->b(Ljava/util/List;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void

    .line 41
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->j()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final u(Ll/ixm0;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final v(Ljava/util/List;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string p0, "emojiRandomTripleDice"

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 p1, 0x3

    .line 14
    if-lt p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final w()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->getVoiceAnimUrl()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->A:Ll/qdh0;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final x(D)V
    .locals 2

    .line 1
    const-wide v0, 0x4197d783fc000000L    # 9.9999999E7

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmpl-double v0, p1, v0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->H(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->u:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->w:Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget v3, Ll/n9c0;->e1:I

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->a:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->mvpBg:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->a:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->a:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->a:Lv/VDraweeView;

    .line 61
    .line 62
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->mvpBg:Ljava/lang/String;

    .line 65
    .line 66
    const-string v4, "context_single_room"

    .line 67
    .line 68
    invoke-static {v4, v0, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    const-string v0, "pkPoint"

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pointType:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/high16 v3, 0x42680000    # 58.0f

    .line 80
    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 84
    .line 85
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 86
    .line 87
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->point:J

    .line 88
    .line 89
    long-to-double v0, v0

    .line 90
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 98
    .line 99
    iget-boolean p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->isNewTopOne:Z

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v:Landroid/widget/ImageView;

    .line 102
    .line 103
    if-eqz p3, :cond_1

    .line 104
    .line 105
    sget p3, Ll/obc0;->X9:I

    .line 106
    .line 107
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 108
    .line 109
    .line 110
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 111
    .line 112
    const-string v0, "#FFB522"

    .line 113
    .line 114
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_1
    sget p3, Ll/obc0;->W9:I

    .line 123
    .line 124
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 125
    .line 126
    .line 127
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 128
    .line 129
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->isShowAnim:Z

    .line 130
    .line 131
    if-eqz p1, :cond_2

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string p3, "https://fe-static.tancdn.com/v1/raw/7cede117-0c4a-4dfd-99a4-4a3e353b993214.svga"

    .line 142
    .line 143
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->D:Lcom/tantan/library/svga/AnimListener;

    .line 156
    .line 157
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->w:Lcom/tantan/library/svga/SVGAnimationView;

    .line 162
    .line 163
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->w:Lcom/tantan/library/svga/SVGAnimationView;

    .line 167
    .line 168
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 172
    .line 173
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    new-instance p3, Ll/ex40;

    .line 178
    .line 179
    invoke-direct {p3}, Ll/ex40;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-static {p0, p1, p2, p3, v2}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_3
    const-string v0, "lovePoint"

    .line 187
    .line 188
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pointType:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_8

    .line 195
    .line 196
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hatInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 197
    .line 198
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 199
    .line 200
    if-nez p3, :cond_4

    .line 201
    .line 202
    const-string p3, "0"

    .line 203
    .line 204
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_4
    iget-wide v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->point:D

    .line 209
    .line 210
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p3

    .line 214
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    .line 216
    .line 217
    :goto_2
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v:Landroid/widget/ImageView;

    .line 218
    .line 219
    sget v0, Ll/obc0;->J3:I

    .line 220
    .line 221
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 222
    .line 223
    .line 224
    invoke-static {p2}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-virtual {p2}, Ll/l6o0;->e()Z

    .line 229
    .line 230
    .line 231
    move-result p3

    .line 232
    if-nez p3, :cond_5

    .line 233
    .line 234
    return-void

    .line 235
    :cond_5
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hatInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 236
    .line 237
    if-eqz p3, :cond_7

    .line 238
    .line 239
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->hatUrl:Ljava/lang/String;

    .line 240
    .line 241
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 242
    .line 243
    .line 244
    move-result p3

    .line 245
    if-eqz p3, :cond_6

    .line 246
    .line 247
    goto :goto_3

    .line 248
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 249
    .line 250
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 251
    .line 252
    .line 253
    move-result p3

    .line 254
    iget-object p2, p2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 255
    .line 256
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 257
    .line 258
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hatInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 259
    .line 260
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->hatUrl:Ljava/lang/String;

    .line 261
    .line 262
    const-string v0, ""

    .line 263
    .line 264
    invoke-static {p0, p3, p2, v0, p1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :cond_7
    :goto_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 269
    .line 270
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    iget-object p2, p2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 275
    .line 276
    invoke-static {p0, p1, p2}, Ll/biv;->k(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 281
    .line 282
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    new-instance v4, Ll/fx40;

    .line 287
    .line 288
    invoke-direct {v4}, Ll/fx40;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-static {v0, v3, p2, v4, v2}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 292
    .line 293
    .line 294
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_a

    .line 299
    .line 300
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 301
    .line 302
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result p3

    .line 308
    if-eqz p3, :cond_a

    .line 309
    .line 310
    iget p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 311
    .line 312
    sget v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_NINE_MIC_BOSS_POSITION:I

    .line 313
    .line 314
    if-ne p3, v0, :cond_9

    .line 315
    .line 316
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 317
    .line 318
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 319
    .line 320
    .line 321
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->m:Lv/VText;

    .line 322
    .line 323
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 324
    .line 325
    .line 326
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s:Lv/VText;

    .line 327
    .line 328
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 329
    .line 330
    .line 331
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 332
    .line 333
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 334
    .line 335
    check-cast p2, Ll/h64;

    .line 336
    .line 337
    iget-object p2, p2, Ll/h64;->b:Ljava/lang/String;

    .line 338
    .line 339
    const-string v0, "#FFE2AB"

    .line 340
    .line 341
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 346
    .line 347
    invoke-static {p3, p2, v0, v1}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 348
    .line 349
    .line 350
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 351
    .line 352
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 353
    .line 354
    .line 355
    move-result-object p3

    .line 356
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 357
    .line 358
    .line 359
    move-result-object p3

    .line 360
    sget v0, Ll/n9c0;->P0:I

    .line 361
    .line 362
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 363
    .line 364
    .line 365
    move-result p3

    .line 366
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 367
    .line 368
    .line 369
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v:Landroid/widget/ImageView;

    .line 370
    .line 371
    sget p3, Ll/obc0;->T9:I

    .line 372
    .line 373
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 374
    .line 375
    .line 376
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 377
    .line 378
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 379
    .line 380
    long-to-double p1, p1

    .line 381
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    .line 387
    .line 388
    return-void

    .line 389
    :cond_9
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v:Landroid/widget/ImageView;

    .line 390
    .line 391
    sget p3, Ll/obc0;->V9:I

    .line 392
    .line 393
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 394
    .line 395
    .line 396
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 397
    .line 398
    long-to-double p1, p1

    .line 399
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x(D)V

    .line 400
    .line 401
    .line 402
    return-void

    .line 403
    :cond_a
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v:Landroid/widget/ImageView;

    .line 404
    .line 405
    sget-object p3, Ll/htd0;->f:Ll/htd0;

    .line 406
    .line 407
    invoke-static {p3}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object p3

    .line 411
    check-cast p3, Ll/civ;

    .line 412
    .line 413
    invoke-virtual {p3}, Ll/civ;->n()Z

    .line 414
    .line 415
    .line 416
    move-result p3

    .line 417
    if-eqz p3, :cond_b

    .line 418
    .line 419
    sget p3, Ll/obc0;->p9:I

    .line 420
    .line 421
    goto :goto_4

    .line 422
    :cond_b
    sget p3, Ll/obc0;->n9:I

    .line 423
    .line 424
    :goto_4
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 425
    .line 426
    .line 427
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 428
    .line 429
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 430
    .line 431
    long-to-double p1, p1

    .line 432
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object p1

    .line 436
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    .line 438
    .line 439
    return-void
.end method

.method public final z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    sget v1, Ll/obc0;->R0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 9
    .line 10
    sget v1, Ll/obc0;->m9:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->e:Lv/VDraweeView;

    .line 16
    .line 17
    sget v1, Ll/obc0;->U9:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s:Lv/VText;

    .line 23
    .line 24
    const-string v0, "#FFFFFF"

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
