.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/ayn0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ayn0;->I0(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ll/ayn0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ayn0;->I0(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/axn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Ljava/lang/String;I)V
    .locals 3

    .line 1
    const-string v0, "male"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v1, Ll/obc0;->V5:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v1, Ll/obc0;->T5:I

    .line 13
    .line 14
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->d:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->c:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    const p1, -0xa18f02

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const p1, -0x7c767

    .line 32
    .line 33
    .line 34
    :goto_1
    const/high16 v0, 0x40a00000    # 5.0f

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    int-to-float v0, v0

    .line 41
    invoke-static {p1, v0}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->e:Lv/VText;

    .line 49
    .line 50
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->e:Lv/VText;

    .line 56
    .line 57
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public f(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ayn0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->a:Lv/VDraweeView;

    .line 4
    .line 5
    new-instance v1, Ll/xwn0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/xwn0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p3, v1}, Ll/ql3;->c(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/nsv;Ll/qcj;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->b:Landroid/widget/TextView;

    .line 14
    .line 15
    iget-object v1, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->e(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->a:Lv/VDraweeView;

    .line 48
    .line 49
    new-instance v1, Ll/ywn0;

    .line 50
    .line 51
    invoke-direct {v1, p1, p3}, Ll/ywn0;-><init>(Ll/ayn0;Ll/nsv;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->b:Landroid/widget/TextView;

    .line 58
    .line 59
    new-instance v1, Ll/zwn0;

    .line 60
    .line 61
    invoke-direct {v1, p1, p3}, Ll/zwn0;-><init>(Ll/ayn0;Ll/nsv;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->f:Lv/VText;

    .line 68
    .line 69
    iget-wide p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;->heartbeatRewardPoint:J

    .line 70
    .line 71
    long-to-double p1, p1

    .line 72
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
