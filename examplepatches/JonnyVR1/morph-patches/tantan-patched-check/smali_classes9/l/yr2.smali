.class public abstract Ll/yr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7m;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2, p3, p4}, Ll/yr2;->b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0, p3, p2, p4}, Ll/yr2;->c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ll/hzc0;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/yr2;->f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public abstract b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;
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
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return p2
.end method

.method public d(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v1, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    iget v3, p1, Ll/suf0;->b:I

    .line 4
    .line 5
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 6
    .line 7
    iget-object v5, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v2, p3

    .line 11
    invoke-virtual/range {v0 .. v5}, Ll/yr2;->e(Landroid/text/SpannableStringBuilder;Ljava/lang/String;IILjava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 16
    .line 17
    iget p0, p1, Ll/suf0;->b:I

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    add-int/2addr p0, p2

    .line 24
    iput p0, p1, Ll/suf0;->b:I

    .line 25
    .line 26
    return-void
.end method

.method public e(Landroid/text/SpannableStringBuilder;Ljava/lang/String;IILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/hi20;

    .line 12
    .line 13
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-direct {p0, v0, p2, p4}, Ll/hi20;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    const/4 p4, 0x4

    .line 21
    invoke-virtual {p0, p4}, Ll/sce;->g(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    add-int/2addr p2, p3

    .line 29
    const/16 p4, 0x21

    .line 30
    .line 31
    invoke-virtual {p1, p0, p3, p2, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public abstract f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
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
.end method
