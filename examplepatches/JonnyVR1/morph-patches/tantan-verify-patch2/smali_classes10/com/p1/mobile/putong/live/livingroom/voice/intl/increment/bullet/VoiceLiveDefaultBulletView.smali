.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lv/VText;

.field public g:Lv/VMarqueeText;

.field public h:Lv/VImage;

.field public i:Lv/VDraweeView;


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


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/swn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/i5o0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;->i:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/i5o0;->i()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "context_single_room"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;->h:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/i5o0;->k()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;->e:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/i5o0;->e()Landroid/graphics/drawable/GradientDrawable;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
