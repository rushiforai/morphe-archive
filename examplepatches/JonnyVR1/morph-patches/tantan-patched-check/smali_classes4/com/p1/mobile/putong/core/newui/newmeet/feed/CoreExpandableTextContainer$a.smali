.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->y(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)Landroid/util/Pair;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->p(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$a;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->d(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 8
    .line 9
    .line 10
    const/16 p0, 0x21

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setFlags(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
