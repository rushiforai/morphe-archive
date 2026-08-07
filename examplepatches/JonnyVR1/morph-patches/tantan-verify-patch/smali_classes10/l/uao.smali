.class public Ll/uao;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;Ll/vxj0;)Lrx/c;
    .locals 2

    .line 1
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    iget-object v0, v0, Ll/civ;->u:Ll/ybp;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->version:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->version:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ll/civ;

    .line 35
    .line 36
    iget-object p1, p1, Ll/civ;->v:Ll/xbp;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    invoke-static {p0}, Ll/uao;->h(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    new-instance v0, Landroid/util/Pair;

    .line 52
    .line 53
    invoke-direct {v0, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_2
    :goto_0
    invoke-static {p0}, Ll/uao;->h(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;
    .locals 1

    .line 1
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    iget-object v0, v0, Ll/civ;->v:Ll/xbp;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic e(Landroid/util/Pair;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Ll/uao;->a:I

    .line 3
    .line 4
    invoke-static {p0}, Ll/uao;->g(Landroid/util/Pair;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget v0, Ll/uao;->a:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput v0, Ll/uao;->a:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/lfp;->a()Ll/lfp;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/lfp;->d()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-eqz p0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/template/IntlTemplateCdnException;

    .line 32
    .line 33
    const-string v1, "Message template CDN download error"

    .line 34
    .line 35
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/template/IntlTemplateCdnException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    const-string v1, "\u56fd\u9645\u5316cdn\u6d88\u606f\u6a21\u7248"

    .line 39
    .line 40
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 41
    .line 42
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/CrashHelper;->e(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v1, "intl_template_cdn_error"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v1, p0}, Ll/lej0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    return-void
.end method

.method public static g(Landroid/util/Pair;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/lfp;->a()Ll/lfp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;->templates:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/lfp;->c(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/civ;

    .line 8
    .line 9
    iget-object v0, v0, Ll/civ;->u:Ll/ybp;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 15
    .line 16
    const-string v1, "intl_template_cdn_error"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/qao;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/qao;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/rao;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/rao;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/sao;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/sao;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/tao;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/tao;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)V
    .locals 2

    .line 1
    sget-object v0, Ll/vxj0;->a:Ll/vxj0;

    .line 2
    .line 3
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/nao;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/nao;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/oao;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/oao;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/pao;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/pao;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method
