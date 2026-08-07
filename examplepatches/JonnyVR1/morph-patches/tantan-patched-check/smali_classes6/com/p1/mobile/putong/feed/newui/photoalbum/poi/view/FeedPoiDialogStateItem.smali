.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gqh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/Emotion;Z)V
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;->d:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 6
    .line 7
    const/high16 v3, 0x42500000    # 52.0f

    .line 8
    .line 9
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;->e:Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Landroid/view/View;->setSelected(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
