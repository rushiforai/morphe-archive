.class public Ll/e31;
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
    .locals 0
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
    if-nez p2, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    filled-new-array {p0}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 15
    .line 16
    add-int/lit8 p0, p0, -0x1

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 4
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
    iget-object p3, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 18
    .line 19
    new-instance v0, Ll/a5s;

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {v0, v1, v2}, Ll/a5s;-><init>(Ljava/lang/String;Ll/brl;)V

    .line 25
    .line 26
    .line 27
    iget v1, p1, Ll/suf0;->b:I

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    add-int/2addr v2, v1

    .line 34
    const/16 v3, 0x21

    .line 35
    .line 36
    invoke-virtual {p3, v0, v1, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iget-object p3, p4, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 46
    .line 47
    if-eqz p3, :cond_0

    .line 48
    .line 49
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getTypeValue()I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    const/4 v0, 0x3

    .line 54
    if-ne p3, v0, :cond_0

    .line 55
    .line 56
    sget-object p3, Ll/zrv;->a:Ll/wrv;

    .line 57
    .line 58
    invoke-virtual {p3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    iget-object p4, p4, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 63
    .line 64
    invoke-virtual {p4}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    if-eqz p3, :cond_0

    .line 73
    .line 74
    const/4 p2, -0x1

    .line 75
    :cond_0
    iget-object p3, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 76
    .line 77
    new-instance p4, Landroid/text/style/ForegroundColorSpan;

    .line 78
    .line 79
    invoke-direct {p4, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 80
    .line 81
    .line 82
    iget p2, p1, Ll/suf0;->b:I

    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr v0, p2

    .line 89
    invoke-virtual {p3, p4, p2, v0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 90
    .line 91
    .line 92
    iget p2, p1, Ll/suf0;->b:I

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    add-int/2addr p2, p0

    .line 99
    iput p2, p1, Ll/suf0;->b:I

    .line 100
    .line 101
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "at"

    .line 2
    .line 3
    return-object p0
.end method
