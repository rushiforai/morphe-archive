.class public Ll/lfp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lfp$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/mfp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lfp;-><init>()V

    return-void
.end method

.method public static a()Ll/lfp;
    .locals 1

    .line 1
    sget-object v0, Ll/lfp$a;->a:Ll/lfp;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lfp;->a:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/civ;

    .line 12
    .line 13
    iget-object v0, v0, Ll/civ;->v:Ll/xbp;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;->templates:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;->templates:Ljava/util/List;

    .line 32
    .line 33
    iput-object v0, p0, Ll/lfp;->a:Ljava/util/List;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Ll/lfp;->a:Ljava/util/List;

    .line 36
    .line 37
    return-object p0
.end method

.method public c(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lfp;->a:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->z4()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/civ;

    .line 18
    .line 19
    iget-object v0, v0, Ll/civ;->u:Ll/ybp;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dyd0;->clear()Z

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/civ;

    .line 29
    .line 30
    iget-object p0, p0, Ll/civ;->v:Ll/xbp;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/dyd0;->clear()Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-static {p0}, Ll/uao;->i(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
