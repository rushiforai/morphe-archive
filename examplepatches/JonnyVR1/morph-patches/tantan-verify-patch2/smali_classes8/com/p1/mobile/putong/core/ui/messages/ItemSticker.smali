.class public Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;

.field public c:Lcom/p1/mobile/putong/core/data/Message;

.field public d:Lcom/p1/mobile/putong/core/data/Sticker;

.field public e:Ljava/lang/String;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->h(Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->i(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->j(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->d:Lcom/p1/mobile/putong/core/data/Sticker;

    return-object p0
.end method

.method private synthetic j(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static k(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 10

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    div-int/lit8 v2, v1, 0x2

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    const/4 v3, 0x0

    .line 17
    if-le v0, v1, :cond_1

    .line 18
    .line 19
    sub-int v4, v0, v1

    .line 20
    .line 21
    div-int/lit8 v4, v4, 0x2

    .line 22
    .line 23
    add-int v5, v4, v1

    .line 24
    .line 25
    move v6, v1

    .line 26
    move v7, v5

    .line 27
    move v5, v2

    .line 28
    move v2, v3

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    if-le v1, v0, :cond_2

    .line 31
    .line 32
    sub-int v2, v1, v0

    .line 33
    .line 34
    div-int/lit8 v2, v2, 0x2

    .line 35
    .line 36
    add-int v4, v2, v0

    .line 37
    .line 38
    div-int/lit8 v5, v0, 0x2

    .line 39
    .line 40
    int-to-float v5, v5

    .line 41
    move v7, v0

    .line 42
    move v6, v4

    .line 43
    move v4, v3

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move v7, v0

    .line 46
    move v6, v1

    .line 47
    move v5, v2

    .line 48
    move v2, v3

    .line 49
    move v4, v2

    .line 50
    :goto_0
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 51
    .line 52
    invoke-static {v0, v1, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Landroid/graphics/Canvas;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 59
    .line 60
    .line 61
    new-instance v8, Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 64
    .line 65
    .line 66
    new-instance v9, Landroid/graphics/Rect;

    .line 67
    .line 68
    invoke-direct {v9, v4, v2, v7, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Landroid/graphics/RectF;

    .line 72
    .line 73
    invoke-direct {v2, v9}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 74
    .line 75
    .line 76
    const/4 v4, 0x1

    .line 77
    invoke-virtual {v8, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 81
    .line 82
    .line 83
    const v3, -0xbdbdbe

    .line 84
    .line 85
    .line 86
    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v2, v5, v5, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 93
    .line 94
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 95
    .line 96
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, p0, v9, v9, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 103
    .line 104
    .line 105
    return-object v0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->d:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->d:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Sticker;->couldAdd()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->f6:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    new-instance v3, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;

    .line 51
    .line 52
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)V

    .line 53
    .line 54
    .line 55
    sget p0, Ll/ibc0;->p1:I

    .line 56
    .line 57
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {v2, v3, p0, v1}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_1
    :goto_0
    return-object v1
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 10
    .line 11
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 21
    .line 22
    const-string v4, "intimate"

    .line 23
    .line 24
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x2

    .line 29
    const/4 v5, 0x1

    .line 30
    const/4 v6, 0x0

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_1

    .line 56
    .line 57
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-lt v3, v4, :cond_1

    .line 72
    .line 73
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 90
    .line 91
    const-string v7, "svga"

    .line 92
    .line 93
    invoke-static {v3, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_1

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    instance-of v3, v3, Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    if-eqz v3, :cond_1

    .line 106
    .line 107
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 108
    .line 109
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 113
    .line 114
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    check-cast v4, Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 130
    .line 131
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 136
    .line 137
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    move-object v5, v2

    .line 144
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 145
    .line 146
    move-object v2, v1

    .line 147
    move v1, v3

    .line 148
    move-object v3, v4

    .line 149
    move-object/from16 v4, p1

    .line 150
    .line 151
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->l(ZLjava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/data/Picture;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_1
    const/4 v3, 0x0

    .line 156
    iput-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->e:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 159
    .line 160
    invoke-static {v7, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 164
    .line 165
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->d:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 169
    .line 170
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 171
    .line 172
    const-string v7, ""

    .line 173
    .line 174
    if-eqz v5, :cond_14

    .line 175
    .line 176
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-nez v5, :cond_14

    .line 181
    .line 182
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->g(Lcom/p1/mobile/putong/core/data/Sticker;)Z

    .line 183
    .line 184
    .line 185
    move-result v5

    .line 186
    if-eqz v5, :cond_2

    .line 187
    .line 188
    goto/16 :goto_5

    .line 189
    .line 190
    :cond_2
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 197
    .line 198
    iget-object v8, v5, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 199
    .line 200
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    if-eqz v8, :cond_3

    .line 205
    .line 206
    iget-object v8, v5, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 207
    .line 208
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 209
    .line 210
    .line 211
    move-result v8

    .line 212
    if-nez v8, :cond_3

    .line 213
    .line 214
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 215
    .line 216
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 221
    .line 222
    :cond_3
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 223
    .line 224
    const-string v9, "unknown_"

    .line 225
    .line 226
    invoke-static {v8, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 227
    .line 228
    .line 229
    move-result v8

    .line 230
    const-string v9, "poke"

    .line 231
    .line 232
    const/high16 v10, 0x42c80000    # 100.0f

    .line 233
    .line 234
    if-nez v8, :cond_4

    .line 235
    .line 236
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 237
    .line 238
    const-string v11, "internal"

    .line 239
    .line 240
    invoke-static {v8, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v8

    .line 244
    if-nez v8, :cond_4

    .line 245
    .line 246
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 247
    .line 248
    const-string v11, "favorite"

    .line 249
    .line 250
    invoke-static {v8, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 251
    .line 252
    .line 253
    move-result v8

    .line 254
    if-eqz v8, :cond_5

    .line 255
    .line 256
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 257
    .line 258
    .line 259
    move-result-object v8

    .line 260
    invoke-virtual {v8}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 261
    .line 262
    .line 263
    move-result-object v8

    .line 264
    invoke-interface {v8}, Ll/r97;->G1()Z

    .line 265
    .line 266
    .line 267
    move-result v8

    .line 268
    if-eqz v8, :cond_11

    .line 269
    .line 270
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 271
    .line 272
    .line 273
    move-result-object v8

    .line 274
    invoke-virtual {v8}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 275
    .line 276
    .line 277
    move-result-object v8

    .line 278
    invoke-interface {v8}, Ll/r97;->G1()Z

    .line 279
    .line 280
    .line 281
    move-result v8

    .line 282
    if-eqz v8, :cond_5

    .line 283
    .line 284
    iget-object v8, v5, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 285
    .line 286
    const-string v11, "gif"

    .line 287
    .line 288
    invoke-virtual {v8, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v8

    .line 292
    if-nez v8, :cond_5

    .line 293
    .line 294
    goto/16 :goto_2

    .line 295
    .line 296
    :cond_5
    iget-object v7, v5, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 297
    .line 298
    iget v8, v7, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 299
    .line 300
    iget v7, v7, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 301
    .line 302
    const-wide/high16 v11, 0x404d000000000000L    # 58.0

    .line 303
    .line 304
    const/16 v13, 0x3a

    .line 305
    .line 306
    if-ge v8, v13, :cond_6

    .line 307
    .line 308
    int-to-double v14, v7

    .line 309
    mul-double/2addr v14, v11

    .line 310
    int-to-double v7, v8

    .line 311
    div-double/2addr v14, v7

    .line 312
    double-to-int v7, v14

    .line 313
    move v8, v13

    .line 314
    :cond_6
    if-ge v7, v13, :cond_7

    .line 315
    .line 316
    int-to-double v14, v8

    .line 317
    mul-double/2addr v11, v14

    .line 318
    int-to-double v7, v7

    .line 319
    div-double/2addr v11, v7

    .line 320
    double-to-int v8, v11

    .line 321
    goto :goto_0

    .line 322
    :cond_7
    move v13, v7

    .line 323
    :goto_0
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 324
    .line 325
    const-string v11, "sogou"

    .line 326
    .line 327
    invoke-static {v7, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 328
    .line 329
    .line 330
    move-result v7

    .line 331
    if-eqz v7, :cond_8

    .line 332
    .line 333
    const/16 v8, 0x5f

    .line 334
    .line 335
    move v13, v8

    .line 336
    :cond_8
    int-to-float v7, v8

    .line 337
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 338
    .line 339
    .line 340
    move-result v7

    .line 341
    int-to-float v8, v13

    .line 342
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 343
    .line 344
    .line 345
    move-result v8

    .line 346
    invoke-static {}, Ll/bnl0;->y0()I

    .line 347
    .line 348
    .line 349
    move-result v11

    .line 350
    div-int/2addr v11, v4

    .line 351
    if-lt v7, v11, :cond_9

    .line 352
    .line 353
    invoke-static {}, Ll/bnl0;->y0()I

    .line 354
    .line 355
    .line 356
    move-result v11

    .line 357
    int-to-double v11, v11

    .line 358
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    .line 359
    .line 360
    mul-double/2addr v11, v13

    .line 361
    int-to-double v13, v8

    .line 362
    mul-double/2addr v11, v13

    .line 363
    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    .line 364
    .line 365
    div-double/2addr v11, v13

    .line 366
    int-to-double v7, v7

    .line 367
    div-double/2addr v11, v7

    .line 368
    double-to-int v8, v11

    .line 369
    invoke-static {}, Ll/bnl0;->y0()I

    .line 370
    .line 371
    .line 372
    move-result v7

    .line 373
    div-int/2addr v7, v4

    .line 374
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 379
    .line 380
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    iput v8, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 385
    .line 386
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    invoke-interface {v4}, Ll/r97;->G1()Z

    .line 395
    .line 396
    .line 397
    move-result v4

    .line 398
    if-eqz v4, :cond_a

    .line 399
    .line 400
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 401
    .line 402
    .line 403
    move-result v4

    .line 404
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 405
    .line 406
    .line 407
    move-result-object v7

    .line 408
    iput v4, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 409
    .line 410
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 411
    .line 412
    .line 413
    move-result-object v7

    .line 414
    iput v4, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 415
    .line 416
    :cond_a
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 417
    .line 418
    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 419
    .line 420
    .line 421
    move-result v4

    .line 422
    if-eqz v4, :cond_b

    .line 423
    .line 424
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 425
    .line 426
    .line 427
    move-result-object v4

    .line 428
    const/high16 v7, 0x42a00000    # 80.0f

    .line 429
    .line 430
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 431
    .line 432
    .line 433
    move-result v8

    .line 434
    iput v8, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 435
    .line 436
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 437
    .line 438
    .line 439
    move-result-object v4

    .line 440
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 441
    .line 442
    .line 443
    move-result v7

    .line 444
    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 445
    .line 446
    :cond_b
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    instance-of v7, v4, Ljava/lang/String;

    .line 451
    .line 452
    if-eqz v7, :cond_c

    .line 453
    .line 454
    check-cast v4, Ljava/lang/String;

    .line 455
    .line 456
    iget-object v7, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 457
    .line 458
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 459
    .line 460
    .line 461
    move-result v4

    .line 462
    if-eqz v4, :cond_c

    .line 463
    .line 464
    goto/16 :goto_3

    .line 465
    .line 466
    :cond_c
    iget-object v4, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 467
    .line 468
    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 469
    .line 470
    .line 471
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 472
    .line 473
    .line 474
    move-result-object v4

    .line 475
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    invoke-interface {v4}, Ll/r97;->G1()Z

    .line 480
    .line 481
    .line 482
    move-result v4

    .line 483
    if-eqz v4, :cond_d

    .line 484
    .line 485
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 486
    .line 487
    .line 488
    goto :goto_1

    .line 489
    :cond_d
    sget v4, Ll/ibc0;->E7:I

    .line 490
    .line 491
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 492
    .line 493
    .line 494
    :goto_1
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 495
    .line 496
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 497
    .line 498
    .line 499
    move-result v4

    .line 500
    const/16 v6, 0xa

    .line 501
    .line 502
    if-lez v4, :cond_e

    .line 503
    .line 504
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 505
    .line 506
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 507
    .line 508
    .line 509
    move-result v4

    .line 510
    if-lt v4, v6, :cond_f

    .line 511
    .line 512
    :cond_e
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 513
    .line 514
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 515
    .line 516
    .line 517
    move-result v4

    .line 518
    if-lez v4, :cond_10

    .line 519
    .line 520
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 521
    .line 522
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 523
    .line 524
    .line 525
    move-result v4

    .line 526
    if-ge v4, v6, :cond_10

    .line 527
    .line 528
    :cond_f
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 529
    .line 530
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 531
    .line 532
    .line 533
    move-result-object v6

    .line 534
    iget v6, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 535
    .line 536
    invoke-virtual {v4, v6}, Landroid/view/View;->setRight(I)V

    .line 537
    .line 538
    .line 539
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 540
    .line 541
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 542
    .line 543
    .line 544
    move-result-object v6

    .line 545
    iget v6, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 546
    .line 547
    invoke-virtual {v4, v6}, Landroid/view/View;->setBottom(I)V

    .line 548
    .line 549
    .line 550
    :cond_10
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 551
    .line 552
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 553
    .line 554
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 555
    .line 556
    invoke-virtual {v4, v6, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 560
    .line 561
    .line 562
    goto :goto_3

    .line 563
    :cond_11
    :goto_2
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->stickerItemInMessages()Ll/pf60;

    .line 564
    .line 565
    .line 566
    move-result-object v4

    .line 567
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 568
    .line 569
    .line 570
    move-result-object v5

    .line 571
    iget-object v8, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 572
    .line 573
    check-cast v8, Landroid/graphics/Point;

    .line 574
    .line 575
    iget v8, v8, Landroid/graphics/Point;->x:I

    .line 576
    .line 577
    iput v8, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 578
    .line 579
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 580
    .line 581
    .line 582
    move-result-object v5

    .line 583
    iget-object v8, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 584
    .line 585
    check-cast v8, Landroid/graphics/Point;

    .line 586
    .line 587
    iget v8, v8, Landroid/graphics/Point;->y:I

    .line 588
    .line 589
    iput v8, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 590
    .line 591
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 592
    .line 593
    .line 594
    move-result-object v5

    .line 595
    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 596
    .line 597
    .line 598
    move-result-object v5

    .line 599
    invoke-interface {v5}, Ll/r97;->G1()Z

    .line 600
    .line 601
    .line 602
    move-result v5

    .line 603
    if-eqz v5, :cond_12

    .line 604
    .line 605
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 606
    .line 607
    .line 608
    move-result v5

    .line 609
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 610
    .line 611
    .line 612
    move-result-object v8

    .line 613
    iput v5, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 614
    .line 615
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 616
    .line 617
    .line 618
    move-result-object v8

    .line 619
    iput v5, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 620
    .line 621
    :cond_12
    invoke-virtual {v0, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 622
    .line 623
    .line 624
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 625
    .line 626
    .line 627
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 628
    .line 629
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 630
    .line 631
    iget-object v4, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 632
    .line 633
    check-cast v4, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 634
    .line 635
    invoke-virtual {v5, v6, v4}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 639
    .line 640
    .line 641
    :goto_3
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 642
    .line 643
    invoke-static {v4, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 644
    .line 645
    .line 646
    move-result v4

    .line 647
    if-eqz v4, :cond_13

    .line 648
    .line 649
    new-instance v3, Ll/agq;

    .line 650
    .line 651
    invoke-direct {v3, v0, v2, v1}, Ll/agq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 652
    .line 653
    .line 654
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 655
    .line 656
    .line 657
    goto :goto_4

    .line 658
    :cond_13
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 659
    .line 660
    .line 661
    :goto_4
    new-instance v1, Ll/bgq;

    .line 662
    .line 663
    invoke-direct {v1, v0}, Ll/bgq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)V

    .line 664
    .line 665
    .line 666
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 667
    .line 668
    .line 669
    return-void

    .line 670
    :cond_14
    :goto_5
    invoke-virtual {v0, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 671
    .line 672
    .line 673
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 674
    .line 675
    .line 676
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 677
    .line 678
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 679
    .line 680
    invoke-virtual {v1, v2, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 684
    .line 685
    .line 686
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/core/data/Sticker;)Z
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 2
    .line 3
    const-string v0, "sogou"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    const-string p1, "image/gif"

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 41
    .line 42
    const-string p1, ".gif"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_2

    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_2
    return v0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-static {p4}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    move-object v1, p0

    .line 34
    move-object v2, p1

    .line 35
    move-object v3, p2

    .line 36
    move v6, p3

    .line 37
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->n(Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->o(Lcom/p1/mobile/putong/core/data/Sticker;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v0, v0, Ll/yxz;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/yxz;

    .line 44
    .line 45
    invoke-virtual {p0, p2, p3, p1}, Ll/yxz;->b5(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final l(ZLjava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/pol;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 2

    .line 1
    iget-object v0, p5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->e:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {p4, p3, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Lrx/c;->first()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance p3, Ll/cgq;

    .line 31
    .line 32
    invoke-direct {p3, p0, p5, v0, p1}, Ll/cgq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;Z)V

    .line 33
    .line 34
    .line 35
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p5, :cond_0

    .line 7
    .line 8
    move-object v1, p3

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move-object v1, p4

    .line 11
    :goto_0
    const-string v2, "image1"

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->o(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    move-object p3, p4

    .line 19
    :cond_1
    const-string p4, "image2"

    .line 20
    .line 21
    invoke-virtual {p0, v0, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->o(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-static {p3}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p3, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const/4 p3, -0x1

    .line 37
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 46
    .line 47
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 53
    .line 54
    .line 55
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    iget p2, p2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 58
    .line 59
    int-to-float p2, p2

    .line 60
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 65
    .line 66
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 67
    .line 68
    int-to-float p1, p1

    .line 69
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/16 p3, 0x32

    .line 74
    .line 75
    if-le p2, p3, :cond_2

    .line 76
    .line 77
    if-gt p1, p3, :cond_3

    .line 78
    .line 79
    :cond_2
    const/high16 p1, 0x43160000    # 150.0f

    .line 80
    .line 81
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    move p1, p2

    .line 86
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final o(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p2, Ll/dgq;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/dgq;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p2, Ll/egq;

    .line 17
    .line 18
    invoke-direct {p2}, Ll/egq;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p2, Ll/fgq;

    .line 26
    .line 27
    invoke-direct {p2, p1, p3}, Ll/fgq;-><init>(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/ggq;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/ggq;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->f:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->r4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    return-void
.end method
