.class public Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/TextView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VImage;

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


# virtual methods
.method public h0(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;ZZ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->f:Landroid/widget/TextView;

    .line 9
    .line 10
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->duration:J

    .line 11
    .line 12
    const-wide/16 v3, 0x3e8

    .line 13
    .line 14
    div-long/2addr v1, v3

    .line 15
    invoke-static {v1, v2}, Ll/kdu;->Z(J)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->h:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->author:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->g:Lv/VImage;

    .line 30
    .line 31
    if-eqz p3, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Landroid/view/View;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->g:Lv/VImage;

    .line 37
    .line 38
    sget p3, Ll/nbc0;->m0:I

    .line 39
    .line 40
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->i:Landroid/view/View;

    .line 44
    .line 45
    const/4 p3, 0x0

    .line 46
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget p2, Ll/nbc0;->R:I

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->i:Landroid/view/View;

    .line 56
    .line 57
    const/4 p3, 0x1

    .line 58
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->e:Lv/VDraweeView;

    .line 64
    .line 65
    sget p2, Ll/nbc0;->H:I

    .line 66
    .line 67
    invoke-static {p1, p0, p2}, Ll/m120;->a(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ldc0;->Q0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->d:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/ldc0;->P:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->e:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/ldc0;->M0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->f:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/ldc0;->x1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VImage;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->g:Lv/VImage;

    .line 43
    .line 44
    sget v0, Ll/ldc0;->K0:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->h:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/ldc0;->V0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->i:Landroid/view/View;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->e:Lv/VDraweeView;

    .line 63
    .line 64
    const/high16 v0, 0x41000000    # 8.0f

    .line 65
    .line 66
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method
