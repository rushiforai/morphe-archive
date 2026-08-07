.class public final Ll/s7x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Map;

.field public final b:Ljava/util/Map;

.field public final c:Ljava/util/Map;

.field public final d:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ll/m7x0;Ll/r7x0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {p1}, Ll/m7x0;->f(Ll/m7x0;)Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/s7x0;->a:Ljava/util/Map;

    .line 14
    .line 15
    new-instance p2, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-static {p1}, Ll/m7x0;->e(Ll/m7x0;)Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Ll/s7x0;->b:Ljava/util/Map;

    .line 25
    .line 26
    new-instance p2, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-static {p1}, Ll/m7x0;->h(Ll/m7x0;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Ll/s7x0;->c:Ljava/util/Map;

    .line 36
    .line 37
    new-instance p2, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-static {p1}, Ll/m7x0;->g(Ll/m7x0;)Ljava/util/Map;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {p2, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 44
    .line 45
    .line 46
    iput-object p2, p0, Ll/s7x0;->d:Ljava/util/Map;

    .line 47
    .line 48
    return-void
.end method

.method public static bridge synthetic e(Ll/s7x0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s7x0;->b:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/s7x0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s7x0;->a:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/s7x0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s7x0;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic h(Ll/s7x0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s7x0;->c:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Ll/l7x0;Ll/ayw0;)Ll/xww0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/o7x0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {p1}, Ll/l7x0;->zzd()Ll/wfx0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/o7x0;-><init>(Ljava/lang/Class;Ll/wfx0;Ll/n7x0;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/s7x0;->b:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/s7x0;->b:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/j5x0;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Ll/j5x0;->a(Ll/l7x0;Ll/ayw0;)Ll/xww0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    const-string p0, "No Key Parser for requested key type "

    .line 37
    .line 38
    const-string p1, " available"

    .line 39
    .line 40
    invoke-static {v0, p0, p1}, Ll/l1x0;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-object v3
.end method

.method public final b(Ll/l7x0;)Ll/lxw0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/o7x0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {p1}, Ll/l7x0;->zzd()Ll/wfx0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/o7x0;-><init>(Ljava/lang/Class;Ll/wfx0;Ll/n7x0;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/s7x0;->d:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/s7x0;->d:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/n6x0;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/n6x0;->a(Ll/l7x0;)Ll/lxw0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    const-string p0, "No Parameters Parser for requested key type "

    .line 37
    .line 38
    const-string p1, " available"

    .line 39
    .line 40
    invoke-static {v0, p0, p1}, Ll/l1x0;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-object v3
.end method

.method public final c(Ll/xww0;Ljava/lang/Class;Ll/ayw0;)Ll/l7x0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q7x0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p2, v2}, Ll/q7x0;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ll/p7x0;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/s7x0;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/s7x0;->a:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/n5x0;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p3}, Ll/n5x0;->a(Ll/xww0;Ll/ayw0;)Ll/l7x0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string p0, "No Key serializer for "

    .line 33
    .line 34
    const-string p1, " available"

    .line 35
    .line 36
    invoke-static {v0, p0, p1}, Ll/l1x0;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-object v2
.end method

.method public final d(Ll/lxw0;Ljava/lang/Class;)Ll/l7x0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q7x0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p2, v2}, Ll/q7x0;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ll/p7x0;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/s7x0;->c:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/s7x0;->c:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/r6x0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/r6x0;->a(Ll/lxw0;)Ll/l7x0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string p0, "No Key Format serializer for "

    .line 33
    .line 34
    const-string p1, " available"

    .line 35
    .line 36
    invoke-static {v0, p0, p1}, Ll/l1x0;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-object v2
.end method

.method public final i(Ll/l7x0;)Z
    .locals 3

    .line 1
    new-instance v0, Ll/o7x0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {p1}, Ll/l7x0;->zzd()Ll/wfx0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v1, p1, v2}, Ll/o7x0;-><init>(Ljava/lang/Class;Ll/wfx0;Ll/n7x0;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/s7x0;->b:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final j(Ll/l7x0;)Z
    .locals 3

    .line 1
    new-instance v0, Ll/o7x0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {p1}, Ll/l7x0;->zzd()Ll/wfx0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v1, p1, v2}, Ll/o7x0;-><init>(Ljava/lang/Class;Ll/wfx0;Ll/n7x0;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/s7x0;->d:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method
