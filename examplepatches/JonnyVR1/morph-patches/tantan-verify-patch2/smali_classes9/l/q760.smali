.class public Ll/q760;
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
    if-nez p3, :cond_0

    .line 3
    .line 4
    new-array p0, p0, [Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p2, p3, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    if-eqz p2, :cond_2

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p2}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_2

    .line 22
    .line 23
    iget-object p2, p3, Ll/hzc0;->k:Ljava/lang/String;

    .line 24
    .line 25
    const-string p3, "owner"

    .line 26
    .line 27
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->url:Ljava/lang/String;

    .line 34
    .line 35
    filled-new-array {p0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    new-array p0, p0, [Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    invoke-virtual {p3}, Ll/hzc0;->a()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_3

    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->url:Ljava/lang/String;

    .line 58
    .line 59
    filled-new-array {p0}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_3
    new-array p0, p0, [Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
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
    const/4 p4, 0x0

    .line 2
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p3

    .line 6
    check-cast p3, Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ll/yr2;->d(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ownerMedal"

    .line 2
    .line 3
    return-object p0
.end method
