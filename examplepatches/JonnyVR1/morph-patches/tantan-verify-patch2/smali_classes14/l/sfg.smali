.class public Ll/sfg;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/audits/"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/zvr;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x0

    .line 26
    new-array p1, p1, [Ll/st0;

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-nez p2, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "reject"

    .line 39
    .line 40
    const-string p2, "1"

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :cond_0
    const-class p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 51
    .line 52
    invoke-static {p1}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string p2, "agreeApply"

    .line 57
    .line 58
    const-string v0, ""

    .line 59
    .line 60
    invoke-static {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePatch(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/users/"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/zvr;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x0

    .line 26
    new-array p1, p1, [Ll/st0;

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-class p1, Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;

    .line 33
    .line 34
    const-string v0, "fanbaseGroupSummary"

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v0, "applyJoin"

    .line 41
    .line 42
    const-string v1, ""

    .line 43
    .line 44
    invoke-static {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePut(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public static c(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/fanbase-groups"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/zvr;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    new-array v0, v0, [Ll/st0;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-class v0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 30
    .line 31
    invoke-static {v0}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "createFansGroup"

    .line 36
    .line 37
    const-string v2, ""

    .line 38
    .line 39
    invoke-static {p0, v1, v2, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePost(Ll/rnl;Ljava/lang/String;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static d(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/audits-counter"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/zvr;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    new-array v0, v0, [Ll/st0;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-class v0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;

    .line 30
    .line 31
    const-string v1, "fanbaseGroupAuditCounter"

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "getCount"

    .line 38
    .line 39
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveRead(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static e(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/fanbase-groups"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/zvr;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    new-array v0, v0, [Ll/st0;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-class v0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 30
    .line 31
    invoke-static {v0}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "getFansGroupList"

    .line 36
    .line 37
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveRead(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/fanbase-group-audits?"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p0, "next"

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const-string p1, "page=1"

    .line 23
    .line 24
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/zvr;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 p1, 0x0

    .line 36
    new-array p1, p1, [Ll/st0;

    .line 37
    .line 38
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-class p1, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;

    .line 43
    .line 44
    const-string v0, "fanbaseGroupAudits"

    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/h9t;->a(Ljava/lang/Class;Ljava/lang/String;)Ll/c9t;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "getNoticeList"

    .line 51
    .line 52
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveRead(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
