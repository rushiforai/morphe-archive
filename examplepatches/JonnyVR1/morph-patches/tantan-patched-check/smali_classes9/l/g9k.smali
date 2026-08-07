.class public Ll/g9k;
.super Ll/yr2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;",
            "Ll/hzc0;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    new-array p0, v0, [Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    if-eqz p3, :cond_1

    .line 14
    .line 15
    iget-object p0, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFieldsCount()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 28
    .line 29
    add-int/lit8 p2, p2, -0x1

    .line 30
    .line 31
    if-le p0, p2, :cond_2

    .line 32
    .line 33
    iget-object p0, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 40
    .line 41
    add-int/lit8 p1, p1, -0x1

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    if-eqz p2, :cond_2

    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFieldsCount()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 63
    .line 64
    add-int/lit8 p3, p1, -0x1

    .line 65
    .line 66
    if-le p0, p3, :cond_2

    .line 67
    .line 68
    add-int/lit8 p1, p1, -0x1

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    filled-new-array {p0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_2
    new-array p0, v0, [Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/suf0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/hzc0;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Ljava/lang/String;

    .line 7
    .line 8
    sget-object p3, Ll/e810;->b:Ljava/lang/Object;

    .line 9
    .line 10
    iput-object p3, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 11
    .line 12
    iget-object p3, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 13
    .line 14
    invoke-virtual {p3, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 15
    .line 16
    .line 17
    new-instance p3, Ll/f9k;

    .line 18
    .line 19
    invoke-direct {p3}, Ll/f9k;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->gradientColors:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p3, p2}, Ll/f9k;->b(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    iget p4, p1, Ll/suf0;->b:I

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr v0, p4

    .line 36
    const/16 v1, 0x21

    .line 37
    .line 38
    invoke-virtual {p2, p3, p4, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 39
    .line 40
    .line 41
    iget p2, p1, Ll/suf0;->b:I

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    add-int/2addr p2, p0

    .line 48
    iput p2, p1, Ll/suf0;->b:I

    .line 49
    .line 50
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "gradientFlowText"

    .line 2
    .line 3
    return-object p0
.end method
