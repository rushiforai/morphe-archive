.class public final Ll/sxw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/ConcurrentMap;

.field public final b:Ljava/util/List;

.field public final c:Ll/oxw0;

.field public final d:Ljava/lang/Class;

.field public final e:Ll/nax0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/ConcurrentMap;Ljava/util/List;Ll/oxw0;Ll/nax0;Ljava/lang/Class;Ll/rxw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sxw0;->a:Ljava/util/concurrent/ConcurrentMap;

    .line 5
    .line 6
    iput-object p2, p0, Ll/sxw0;->b:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Ll/sxw0;->c:Ll/oxw0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/sxw0;->d:Ljava/lang/Class;

    .line 11
    .line 12
    iput-object p4, p0, Ll/sxw0;->e:Ll/nax0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/oxw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxw0;->c:Ll/oxw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/nax0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxw0;->e:Ll/nax0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxw0;->d:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/util/Collection;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxw0;->a:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e([B)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ll/qxw0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, Ll/qxw0;-><init>([BLl/pxw0;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/sxw0;->a:Ljava/util/concurrent/ConcurrentMap;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/util/List;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 19
    .line 20
    return-object p0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxw0;->e:Ll/nax0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nax0;->a()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
