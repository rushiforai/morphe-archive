.class public Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;

.field public h:Lv/VText;

.field public i:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->j0()V

    return-void
.end method

.method private synthetic j0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;

    .line 2
    .line 3
    new-instance v1, Ll/zen0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zen0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->setOnCountDownListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 12
    .line 13
    invoke-static {p0}, Ll/n0k;->d(Landroid/widget/TextView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public g0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/afn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(I)V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->i()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "\u00d7"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " "

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 37
    .line 38
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 39
    .line 40
    sget-object v7, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 41
    .line 42
    const/4 p0, 0x2

    .line 43
    new-array v8, p0, [F

    .line 44
    .line 45
    fill-array-data v8, :array_0

    .line 46
    .line 47
    .line 48
    const-wide/16 v3, 0x0

    .line 49
    .line 50
    const-wide/16 v5, 0x12c

    .line 51
    .line 52
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x3fb33333    # 1.4f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->hasConsumedGift:Z

    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->h:Lv/VText;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

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

.method public n0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->f:Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 10
    .line 11
    sget v1, Ll/qa00;->x:I

    .line 12
    .line 13
    const-string v2, "context_livingAct"

    .line 14
    .line 15
    invoke-static {v2, p2, v0, v1, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;

    .line 19
    .line 20
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->setCountdownTime(J)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public o0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->e:Lv/VText;

    .line 13
    .line 14
    const/high16 v2, 0x41600000    # 14.0f

    .line 15
    .line 16
    invoke-virtual {v0, v3, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->setBorderWidth(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/n9c0;->p0:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sget v3, Ll/n9c0;->p0:I

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->h(II)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->h:Lv/VText;

    .line 58
    .line 59
    sget v0, Ll/obc0;->R7:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setIcon(I)V
    .locals 0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->f:Lv/VDraweeView;

    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceFastGiftView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    sget v0, Ll/qa00;->v:I

    .line 4
    .line 5
    const-string v1, "context_livingAct"

    .line 6
    .line 7
    invoke-static {v1, p0, p1, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
