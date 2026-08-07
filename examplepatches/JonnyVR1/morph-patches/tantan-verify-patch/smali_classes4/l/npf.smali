.class public Ll/npf;
.super Ll/rpf;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rpf;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/spf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/npf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/spf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/npf;->i(Ll/spf$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    const-string p0, "\u6b64\u4e3b\u9898\u5361\u7247\u4eca\u65e5\u6ed1\u52a8\u6b21\u6570\u5df2\u7528\u5c3d\uff0c\u53bb\u63a2\u7d22\u5176\u4ed6\u4e3b\u9898\u5427~"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Ll/spf$a;->k:Ll/btl;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const-string v0, "tantanx_scene_noswipe_num"

    .line 13
    .line 14
    invoke-interface {p0, p1, v0}, Ll/btl;->M3(ZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 18
    .line 19
    return-object p0
.end method

.method public i(Ll/spf$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Ll/spf$a;->e:Z

    .line 2
    .line 3
    return p0
.end method
