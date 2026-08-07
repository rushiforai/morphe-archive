.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VMarqueeText;

.field public f:Lv/VImage;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b5o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Ll/i5o0;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/i5o0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x7e

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/16 v0, 0x70

    .line 11
    .line 12
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->d:Lv/VText;

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    int-to-float v0, v0

    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    sub-int/2addr v2, v3

    .line 24
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->e:Lv/VMarqueeText;

    .line 28
    .line 29
    invoke-static {}, Ll/bnl0;->y0()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sub-int/2addr v2, v0

    .line 38
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->b:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/i5o0;->f()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "context_livingAct"

    .line 48
    .line 49
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->g:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/i5o0;->b()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->f:Lv/VImage;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/i5o0;->k()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->d:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->f:Lv/VImage;

    .line 77
    .line 78
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    add-int/2addr v0, v1

    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->c:Lv/VDraweeView;

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    new-array v3, v3, [Landroid/view/View;

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    aput-object v1, v3, v4

    .line 90
    .line 91
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;->c:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/i5o0;->g()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {v2, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
