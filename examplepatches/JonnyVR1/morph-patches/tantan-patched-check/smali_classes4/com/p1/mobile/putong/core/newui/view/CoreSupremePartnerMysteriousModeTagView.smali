.class public Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
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
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a7b;->a(Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->e()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->c(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->d()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final c(Z)V
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "\u5979"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "\u4ed6"

    .line 9
    .line 10
    :goto_0
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string p1, "\u975e\u5e38\u4e2d\u610f\u4f60"

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    new-instance p1, Landroid/text/SpannableString;

    .line 19
    .line 20
    invoke-direct {p1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "#C5AD7D"

    .line 24
    .line 25
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const-string v3, "#F9ECCA"

    .line 30
    .line 31
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    filled-new-array {v2, v3, v4}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    const/4 v2, 0x3

    .line 44
    new-array v11, v2, [F

    .line 45
    .line 46
    fill-array-data v11, :array_0

    .line 47
    .line 48
    .line 49
    new-instance v5, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;

    .line 50
    .line 51
    const/4 v8, 0x0

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v9

    .line 56
    const/high16 v7, 0x3f800000    # 1.0f

    .line 57
    .line 58
    move-object v6, p0

    .line 59
    invoke-direct/range {v5 .. v11}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;-><init>(Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;FFLjava/lang/String;[I[F)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    const/16 v0, 0x21

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p1, v5, v2, p0, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 70
    .line 71
    .line 72
    iget-object p0, v6, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->c:Lv/VText;

    .line 73
    .line 74
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, v6, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->c:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :array_0
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f19999a    # 0.6f
        0x3f666666    # 0.9f
    .end array-data
.end method

.method public final d()V
    .locals 13

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u5339\u914d\u540e\u4e3a\u4f60\u63ed\u6653\u771f\u5b9e\u8eab\u4efd"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/text/SpannableString;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const-string v2, "#C5AD7D"

    .line 14
    .line 15
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const-string v4, "#F9ECCA"

    .line 20
    .line 21
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    filled-new-array {v3, v4, v5}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v11

    .line 33
    const/4 v3, 0x3

    .line 34
    new-array v12, v3, [F

    .line 35
    .line 36
    fill-array-data v12, :array_0

    .line 37
    .line 38
    .line 39
    new-instance v6, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;

    .line 40
    .line 41
    const/4 v9, 0x0

    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v10

    .line 46
    const/high16 v8, 0x3f800000    # 1.0f

    .line 47
    .line 48
    move-object v7, p0

    .line 49
    invoke-direct/range {v6 .. v12}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;-><init>(Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;FFLjava/lang/String;[I[F)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    const/16 v0, 0x21

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-virtual {v1, v6, v3, p0, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 60
    .line 61
    .line 62
    iget-object p0, v7, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->d:Lv/VText;

    .line 63
    .line 64
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object p0, v7, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->d:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f19999a    # 0.6f
        0x3f666666    # 0.9f
    .end array-data
.end method

.method public final e()V
    .locals 13

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u81f3\u5c0a\u5408\u4f19\u4eba"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/text/SpannableString;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const-string v2, "#D1AE68"

    .line 14
    .line 15
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const-string v4, "#FFF7E2"

    .line 20
    .line 21
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const-string v5, "#E2B761"

    .line 26
    .line 27
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    filled-new-array {v3, v4, v5}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v11

    .line 35
    const/4 v3, 0x3

    .line 36
    new-array v12, v3, [F

    .line 37
    .line 38
    fill-array-data v12, :array_0

    .line 39
    .line 40
    .line 41
    new-instance v6, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;

    .line 42
    .line 43
    const/4 v9, 0x0

    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v10

    .line 48
    const/high16 v8, 0x3f800000    # 1.0f

    .line 49
    .line 50
    move-object v7, p0

    .line 51
    invoke-direct/range {v6 .. v12}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView$ShaderSpan;-><init>(Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;FFLjava/lang/String;[I[F)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const/16 v0, 0x21

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {v1, v6, v3, p0, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 62
    .line 63
    .line 64
    iget-object p0, v7, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->b:Lv/VText;

    .line 65
    .line 66
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, v7, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->b:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :array_0
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f000000    # 0.5f
        0x3f666666    # 0.9f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
