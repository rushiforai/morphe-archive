.class public Ll/l230;
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
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ll/hzc0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ll/hzc0;",
            ")Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 0
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
    const-string p0, "lineFeed"

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    sget-object p2, Ll/e810;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p1, Ll/suf0;->b:I

    .line 19
    .line 20
    sget-object p2, Ll/e810;->c:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    add-int/2addr p0, p2

    .line 27
    iput p0, p1, Ll/suf0;->b:I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    iput p0, p1, Ll/suf0;->b:I

    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 35
    .line 36
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 37
    .line 38
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 42
    .line 43
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "newline"

    .line 2
    .line 3
    return-object p0
.end method
