.class public Ll/e4g0;
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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->text:Ljava/lang/String;

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 3
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
    move-result-object p3

    .line 6
    check-cast p3, Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Landroid/text/BidiFormatter;->getInstance()Landroid/text/BidiFormatter;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    invoke-virtual {p4, p3}, Landroid/text/BidiFormatter;->isRtl(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p4

    .line 16
    if-eqz p4, :cond_0

    .line 17
    .line 18
    invoke-static {p0}, Landroid/text/BidiFormatter;->getInstance(Z)Landroid/text/BidiFormatter;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p4, Landroid/text/TextDirectionHeuristics;->RTL:Landroid/text/TextDirectionHeuristic;

    .line 23
    .line 24
    invoke-virtual {p0, p3, p4}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/String;Landroid/text/TextDirectionHeuristic;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    :cond_0
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    invoke-virtual {p0, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 34
    .line 35
    instance-of p4, p0, Ll/zql;

    .line 36
    .line 37
    if-eqz p4, :cond_1

    .line 38
    .line 39
    check-cast p0, Ll/zql;

    .line 40
    .line 41
    const/4 p4, 0x4

    .line 42
    invoke-interface {p0, p4}, Ll/zql;->a(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    sget-object p0, Ll/e810;->b:Ljava/lang/Object;

    .line 46
    .line 47
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 48
    .line 49
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    const/16 p4, 0x22

    .line 56
    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 60
    .line 61
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 62
    .line 63
    const-string v1, "x"

    .line 64
    .line 65
    const-string v2, "#"

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-direct {p0, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 79
    .line 80
    iget v1, p1, Ll/suf0;->b:I

    .line 81
    .line 82
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    add-int/2addr v2, v1

    .line 87
    invoke-virtual {v0, p0, v1, v2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 91
    .line 92
    if-eqz p0, :cond_3

    .line 93
    .line 94
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 95
    .line 96
    new-instance v0, Landroid/text/style/AbsoluteSizeSpan;

    .line 97
    .line 98
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 99
    .line 100
    const/4 v1, 0x1

    .line 101
    invoke-direct {v0, p2, v1}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 102
    .line 103
    .line 104
    iget p2, p1, Ll/suf0;->b:I

    .line 105
    .line 106
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    add-int/2addr v1, p2

    .line 111
    invoke-virtual {p0, v0, p2, v1, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 112
    .line 113
    .line 114
    :cond_3
    iget p0, p1, Ll/suf0;->b:I

    .line 115
    .line 116
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    add-int/2addr p0, p2

    .line 121
    iput p0, p1, Ll/suf0;->b:I

    .line 122
    .line 123
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "static"

    .line 2
    .line 3
    return-object p0
.end method
