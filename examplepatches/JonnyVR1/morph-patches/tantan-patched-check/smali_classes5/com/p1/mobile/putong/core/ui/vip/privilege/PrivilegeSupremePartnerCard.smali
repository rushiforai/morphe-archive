.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;
.super Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Ll/lb2;

.field public m:Lcom/p1/mobile/putong/app/PutongFrag;

.field public n:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->o0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private r0()V
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
    new-instance v6, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;

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
    invoke-direct/range {v6 .. v12}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;FFLjava/lang/String;[I[F)V

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
    iget-object p0, v7, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->j:Lv/VText;

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
    iget-object p0, v7, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->j:Lv/VText;

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


# virtual methods
.method public h0(Ll/lb2;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->l:Ll/lb2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->m:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->n:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    return-void
.end method

.method public i0()V
    .locals 0

    .line 1
    return-void
.end method

.method public j0()V
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->f:Lv/VDraweeView;

    .line 4
    .line 5
    const/high16 v2, 0x43a00000    # 320.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/high16 v3, 0x43020000    # 130.0f

    .line 12
    .line 13
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const-string v4, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkpPVkhLR09PSUZFR1ZHNlBNM0lIUllDRUFHTjJLSjE0IiwidyI6OTYwLCJoIjozOTAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MDczMTM0ODkyMTEyMDYyMDEwfQ.png"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->r0()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->p0()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->n0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vj90;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m0(I)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x9

    .line 7
    .line 8
    if-gt p1, v0, :cond_0

    .line 9
    .line 10
    const-string v0, "00"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 v0, 0x63

    .line 20
    .line 21
    if-gt p1, v0, :cond_1

    .line 22
    .line 23
    const-string v0, "0"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public n0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->l:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->m:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/tj90;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/tj90;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/uj90;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/uj90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->q0(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->j:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->g:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final p0()V
    .locals 13

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Ultimate experience"

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
    new-instance v6, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;

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
    invoke-direct/range {v6 .. v12}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;FFLjava/lang/String;[I[F)V

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
    iget-object p0, v7, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->k:Lv/VText;

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
    iget-object p0, v7, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->k:Lv/VText;

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
        0x3f000000    # 0.5f
        0x3f666666    # 0.9f
    .end array-data
.end method

.method public final q0(Lcom/p1/mobile/putong/data/User;)V
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "NO."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getSupremePartnerUserCode()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {}, Ll/joa;->O3()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    if-gtz p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->m0(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    const-string p1, "XXX"

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    :goto_1
    new-instance p1, Landroid/text/SpannableString;

    .line 35
    .line 36
    invoke-direct {p1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    const-string v1, "#C5AD7D"

    .line 40
    .line 41
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const-string v3, "#F9ECCA"

    .line 46
    .line 47
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    filled-new-array {v2, v3, v4}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    const/4 v2, 0x3

    .line 60
    new-array v11, v2, [F

    .line 61
    .line 62
    fill-array-data v11, :array_0

    .line 63
    .line 64
    .line 65
    new-instance v5, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;

    .line 66
    .line 67
    const/4 v8, 0x0

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v9

    .line 72
    const/high16 v7, 0x3f800000    # 1.0f

    .line 73
    .line 74
    move-object v6, p0

    .line 75
    invoke-direct/range {v5 .. v11}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;FFLjava/lang/String;[I[F)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    const/16 v0, 0x21

    .line 83
    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-virtual {p1, v5, v2, p0, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 86
    .line 87
    .line 88
    iget-object p0, v6, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->g:Lv/VText;

    .line 89
    .line 90
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, v6, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;->g:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :array_0
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f000000    # 0.5f
        0x3f666666    # 0.9f
    .end array-data
.end method
