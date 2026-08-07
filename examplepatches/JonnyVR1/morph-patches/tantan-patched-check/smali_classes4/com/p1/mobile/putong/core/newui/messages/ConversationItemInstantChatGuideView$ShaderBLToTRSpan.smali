.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;
.super Landroid/text/style/ForegroundColorSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ShaderBLToTRSpan"
.end annotation


# instance fields
.field colors:[I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field positions:[F

.field final synthetic this$0:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;

.field value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;ILjava/lang/String;[I[F)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation

        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->this$0:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->value:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->colors:[I

    .line 9
    .line 10
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->positions:[F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ForegroundColorSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->value:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/qa00;->j:I

    .line 15
    .line 16
    int-to-float v1, v1

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 24
    .line 25
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 26
    .line 27
    sub-float/2addr v1, v0

    .line 28
    :cond_0
    move v3, v1

    .line 29
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 30
    .line 31
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->colors:[I

    .line 32
    .line 33
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;->positions:[F

    .line 34
    .line 35
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    const/4 v5, 0x0

    .line 39
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 43
    .line 44
    .line 45
    return-void
.end method
