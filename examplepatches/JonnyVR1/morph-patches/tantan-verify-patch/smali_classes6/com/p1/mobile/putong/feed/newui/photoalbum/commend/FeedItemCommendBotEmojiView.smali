.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VImage;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Lcom/p1/mobile/android/app/Act;Ll/y20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->X(Lcom/p1/mobile/android/app/Act;Ll/y20;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->Y(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->Z(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic T(ILl/y20;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    if-ne p2, p0, :cond_0

    .line 11
    .line 12
    const-string p0, "selectedImages"

    .line 13
    .line 14
    invoke-virtual {p4, p0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uah;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final W(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;->X1(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/tah;

    .line 6
    .line 7
    const/16 v0, 0x2712

    .line 8
    .line 9
    invoke-direct {p1, v0, p3}, Ll/tah;-><init>(ILl/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/android/app/Act;Ll/y20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p3, -0x1

    .line 2
    if-ne p4, p3, :cond_0

    .line 3
    .line 4
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    sget-object p3, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p5, p3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-nez p4, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->W(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public final synthetic Y(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->c:Lv/VImage;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic Z(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->d:Lv/VImage;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public a0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x4

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/sah;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1, p2}, Ll/sah;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    const/16 p0, 0x2711

    .line 41
    .line 42
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public b0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lv/VImage;",
            ">;",
            "Ll/y20<",
            "Lv/VImage;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->c:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/pah;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Ll/pah;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->d:Lv/VImage;

    .line 12
    .line 13
    new-instance p2, Ll/qah;

    .line 14
    .line 15
    invoke-direct {p2, p0, p3}, Ll/qah;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->e:Lv/VImage;

    .line 22
    .line 23
    new-instance p1, Ll/rah;

    .line 24
    .line 25
    invoke-direct {p1, p4}, Ll/rah;-><init>(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->c:Lv/VImage;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->d:Lv/VImage;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->e:Lv/VImage;

    .line 12
    .line 13
    filled-new-array {v0, v1, v2}, [Lv/VImage;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->e:Lv/VImage;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/j4h;->h()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->c:Lv/VImage;

    .line 36
    .line 37
    sget v1, Ll/lbc0;->y0:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->d:Lv/VImage;

    .line 43
    .line 44
    sget v1, Ll/lbc0;->z0:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->e:Lv/VImage;

    .line 50
    .line 51
    sget v0, Ll/lbc0;->A0:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public setImageViewSelected(I)V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lv/VImage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->setImageViewSelected(Lv/VImage;)V

    return-void
.end method

.method public setImageViewSelected(Lv/VImage;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    move p1, v0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge p1, v1, :cond_3

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lv/VImage;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lv/VImage;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move v1, v0

    .line 43
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v1, v2, :cond_3

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    if-ne p1, v2, :cond_2

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-virtual {p1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->f:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lv/VImage;

    .line 71
    .line 72
    invoke-virtual {v2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 73
    .line 74
    .line 75
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    return-void
.end method
