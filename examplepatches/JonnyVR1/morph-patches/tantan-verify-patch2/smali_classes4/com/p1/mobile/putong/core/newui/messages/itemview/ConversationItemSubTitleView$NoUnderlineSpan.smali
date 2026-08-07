.class Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView$NoUnderlineSpan;
.super Landroid/text/style/URLSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NoUnderlineSpan"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView$NoUnderlineSpan;->this$0:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/CharacterStyle;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
