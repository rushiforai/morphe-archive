.class public Ll/m500;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/b7m;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/m500;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/m500;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/m500;Ll/suf0;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/m500;->i(Ll/suf0;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)V

    return-void
.end method

.method public static synthetic b(Ll/m500;Ll/b7m;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m500;->h(Ll/b7m;)V

    return-void
.end method


# virtual methods
.method public c(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/b7m;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k500;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k500;-><init>(Ll/m500;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ljava/util/List;Ll/hzc0;)Landroid/text/SpannableStringBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            ">;",
            "Ll/hzc0;",
            ")",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m500;->e(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ljava/util/List;Ll/hzc0;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/text/SpannableStringBuilder;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 20
    .line 21
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public e(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ljava/util/List;Ll/hzc0;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            ">;",
            "Ll/hzc0;",
            ")",
            "Ljava/util/List<",
            "Landroid/text/SpannableStringBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v5, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/suf0;->a()Ll/suf0;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    new-instance v0, Ll/l500;

    .line 11
    .line 12
    move-object v1, p0

    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p3

    .line 15
    invoke-direct/range {v0 .. v5}, Ll/l500;-><init>(Ll/m500;Ll/suf0;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-object v5
.end method

.method public f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m500;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 12
    .line 13
    return-object p0
.end method

.method public g()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m500;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic h(Ll/b7m;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m500;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/b7m;->getType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic i(Ll/suf0;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m500;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p5, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/b7m;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1, p5, p2, p3}, Ll/b7m;->a(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 17
    .line 18
    invoke-interface {p4, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    iget-object p0, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-interface {p4, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method
