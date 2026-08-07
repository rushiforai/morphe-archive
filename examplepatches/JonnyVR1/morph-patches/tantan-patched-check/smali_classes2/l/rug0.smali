.class public final Ll/rug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/csg0;
.implements Ll/vkg0;


# instance fields
.field public final a:Ll/rg50;

.field public final b:Ll/x1d0$a;

.field public c:Ll/x1d0;

.field public d:Ll/i5d0;


# direct methods
.method public constructor <init>(Ll/rg50;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/rug0;->a:Ll/rg50;

    .line 14
    .line 15
    iput-object p2, p0, Ll/rug0;->b:Ll/x1d0$a;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rug0;->d:Ll/i5d0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final b(Ljava/util/Map;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Class;

    .line 28
    .line 29
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object v3, p0, Ll/rug0;->b:Ll/x1d0$a;

    .line 34
    .line 35
    invoke-virtual {v3, v1, v2}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method
