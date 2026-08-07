.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;->A(Lcom/p1/mobile/putong/core/data/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p1, "e_chat_post_guide"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;->a()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v1, 0x0

    .line 19
    new-array v1, v1, [Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-interface {p1, p0, v1, v2, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->toCaptionPage(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentPostGuide;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/g9c0;->D:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
