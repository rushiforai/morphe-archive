.class public abstract Ll/af2;
.super Ll/ir2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/ze2;",
        ">",
        "Ll/ir2<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ir2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/af2$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/af2$a;-><init>(Ll/af2;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ir2;->r(Ll/rt0;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/ir2;->b:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/ir2;->f:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    if-eqz p3, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/ir2;->g:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p0, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method


# virtual methods
.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir2;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
