.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Ll/few;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 3

    .line 1
    new-instance p1, Ljava/util/Date;

    .line 2
    .line 3
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 4
    .line 5
    double-to-long v0, v0

    .line 6
    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ljava/util/Date;

    .line 10
    .line 11
    iget-wide v1, p2, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 12
    .line 13
    double-to-long v1, v1

    .line 14
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ll/m8c;

    .line 18
    .line 19
    const-string v1, "MM.dd"

    .line 20
    .line 21
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {p2, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->d:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "\u6d3b\u52a8\u65f6\u95f4 "

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, " - "

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p1, "  \u00b7  \u6bcf\u4eba\u4ec5\u53ef\u53d1\u9001 1 \u5c01"

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p2, "\u9650\u65f6\u6d3b\u52a8"

    .line 70
    .line 71
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->d:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;

    .line 2
    .line 3
    const/high16 v1, 0x439c0000    # 312.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->d:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->p0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/AutoVDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->a:Lv/AutoVDraweeView;

    .line 13
    .line 14
    sget v0, Ll/adc0;->qe:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/AutoVDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->b:Lv/AutoVDraweeView;

    .line 23
    .line 24
    sget v0, Ll/adc0;->re:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/AutoVDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->c:Lv/AutoVDraweeView;

    .line 33
    .line 34
    sget v0, Ll/adc0;->W0:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->d:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->a:Lv/AutoVDraweeView;

    .line 45
    .line 46
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJSRlFMWUtEVEVEUDMzSU5RQVlMUjNEWjdKSkE2TTE0IiwidyI6MTEyNSwiaCI6NDgwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTE2ODY4ODY2OTA5NzgzMzM4NzR9.png"

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    invoke-virtual {v0, v1, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/bnl0;->y0()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-float v0, v0

    .line 57
    const/high16 v1, 0x43200000    # 160.0f

    .line 58
    .line 59
    mul-float/2addr v0, v1

    .line 60
    const v1, 0x43bb8000    # 375.0f

    .line 61
    .line 62
    .line 63
    div-float/2addr v0, v1

    .line 64
    float-to-int v0, v0

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->a:Lv/AutoVDraweeView;

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->b:Lv/AutoVDraweeView;

    .line 71
    .line 72
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IktWTFM3VEMyNFFBWE1GVENCVVBLM0I1N1FEVk1MRjE0IiwidyI6MzgyLCJoIjo3NiwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjEwNzA4MDM2OTEyMzg2ODQ1NTg4fQ.png"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterMainLayout;->c:Lv/AutoVDraweeView;

    .line 78
    .line 79
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IklQMlRIU0RQQkI1NU1ONzdRUlNSR0pHN1FXS0NDMzE0IiwidyI6NjQ4LCJoIjoyNjQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjowfQ.png"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
