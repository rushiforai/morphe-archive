.class public final Ll/pjg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudCfg;


# instance fields
.field public a:Z

.field public b:Z

.field public final c:Ljava/util/HashMap;

.field public final d:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/pjg0;->a:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/pjg0;->b:Z

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/pjg0;->d:Ljava/util/HashMap;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final addEmbeddedMGPkg(JLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/wog0;->a:Ll/vug0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/vug0;->a:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/plg0;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    iget-boolean p1, p0, Ll/plg0;->b:Z

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Ll/plg0;->a:Z

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final getAdvancedConfigMap()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pjg0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getEmbeddedMGPkgPath(J)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

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
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final getShowCustomLoading()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pjg0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getShowLoadingGameBg()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pjg0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final removeEmbeddedMGPkg(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final setShowCustomLoading(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pjg0;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setShowLoadingGameBg(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pjg0;->a:Z

    .line 2
    .line 3
    return-void
.end method
