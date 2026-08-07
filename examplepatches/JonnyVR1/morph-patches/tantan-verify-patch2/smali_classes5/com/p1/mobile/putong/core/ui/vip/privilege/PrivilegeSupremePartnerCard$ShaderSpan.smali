.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;
.super Landroid/text/style/RelativeSizeSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ShaderSpan"
.end annotation


# instance fields
.field colors:[I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field positions:[F

.field start:F

.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;

.field value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;FFLjava/lang/String;[I[F)V
    .locals 0
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation

        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->this$0:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 4
    .line 5
    .line 6
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->start:F

    .line 7
    .line 8
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->value:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->colors:[I

    .line 11
    .line 12
    iput-object p6, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->positions:[F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/RelativeSizeSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->value:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->start:F

    .line 11
    .line 12
    add-float v5, v0, v1

    .line 13
    .line 14
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 15
    .line 16
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->start:F

    .line 17
    .line 18
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->colors:[I

    .line 19
    .line 20
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeSupremePartnerCard$ShaderSpan;->positions:[F

    .line 21
    .line 22
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .locals 0
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/RelativeSizeSpan;->updateMeasureState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
