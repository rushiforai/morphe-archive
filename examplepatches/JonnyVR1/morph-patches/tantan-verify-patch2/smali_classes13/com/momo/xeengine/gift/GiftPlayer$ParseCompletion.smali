.class Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/GiftPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ParseCompletion"
.end annotation


# instance fields
.field private final svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

.field final synthetic this$0:Lcom/momo/xeengine/gift/GiftPlayer;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/SVGAGiftDescriptor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 7
    .line 8
    return-void
.end method

.method private getSvgaDynamicEntity(Lcom/momo/xeengine/gift/SVGAGiftDescriptor;)Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;
    .locals 7

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->getItemsList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_4

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_4

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->getKey()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 37
    .line 38
    invoke-static {v3}, Lcom/momo/xeengine/gift/GiftPlayer;->access$400(Lcom/momo/xeengine/gift/GiftPlayer;)Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->getType()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    const/4 v5, 0x1

    .line 53
    if-ne v4, v5, :cond_2

    .line 54
    .line 55
    new-instance v4, Landroid/text/TextPaint;

    .line 56
    .line 57
    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->getTextColor()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->getTextSize()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    int-to-float v1, v1

    .line 72
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;

    .line 76
    .line 77
    if-nez v3, :cond_1

    .line 78
    .line 79
    const-string v3, ""

    .line 80
    .line 81
    :cond_1
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 82
    .line 83
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 84
    .line 85
    invoke-direct {v1, v3, v4, v5, v6}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;Landroid/text/Layout$Alignment;Landroid/text/TextUtils$TruncateAt;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v2, v1}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->getType()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    const/4 v5, 0x2

    .line 97
    if-ne v4, v5, :cond_0

    .line 98
    .line 99
    invoke-static {v3}, Lcom/momo/xeengine/gift/GiftUtils;->loadBitmapFromFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    if-eqz v3, :cond_0

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isCircle()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    invoke-virtual {v0, v2, v3}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->setDynamicCircleImage(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    invoke-virtual {v0, v2, v3}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_4
    return-object v0
.end method

.method private getVideoSize(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)Landroid/util/SizeF;
    .locals 3

    .line 1
    new-instance p0, Landroid/util/SizeF;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getVideoSize()Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGARect;->getWidth()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    double-to-float v0, v0

    .line 12
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getVideoSize()Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGARect;->getHeight()D

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    double-to-float p1, v1

    .line 21
    invoke-direct {p0, v0, p1}, Landroid/util/SizeF;-><init>(FF)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method


# virtual methods
.method public onComplete(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 5
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftView;->getSVGAView()Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$2000(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setCallback(Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->getVideoSize(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)Landroid/util/SizeF;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->getScaleType()Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v3, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->getPositionType()Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v4, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 45
    .line 46
    invoke-static {v4}, Lcom/momo/xeengine/gift/GiftPlayer;->access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4, v1, v3, v2}, Lcom/momo/xeengine/gift/GiftView;->setupSVGAViewLayout(Landroid/util/SizeF;Lcom/momo/xeengine/gift/SVGAPositionType;Lcom/momo/xeengine/gift/SVGAScaleType;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 54
    .line 55
    invoke-direct {p0, v1}, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->getSvgaDynamicEntity(Lcom/momo/xeengine/gift/SVGAGiftDescriptor;)Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 60
    .line 61
    invoke-direct {v2, p1, v1}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getLoops()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setLoops(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->startAnimation()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getVideo()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "SVGA parse failed: "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/16 v0, 0x6d

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1100(Lcom/momo/xeengine/gift/GiftPlayer;ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
