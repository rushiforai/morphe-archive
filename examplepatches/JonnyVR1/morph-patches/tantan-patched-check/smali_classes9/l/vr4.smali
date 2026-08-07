.class public abstract Ll/vr4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/vr4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vr4<",
            "TR;TT;>;"
        }
    .end annotation
.end field

.field public b:Ll/vr4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vr4<",
            "TR;TT;>;"
        }
    .end annotation
.end field


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

.method public static a(Ljava/util/List;)Ll/vr4;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Ll/vr4<",
            "TR;TT;>;>;)",
            "Ll/vr4<",
            "TR;TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    check-cast v1, Ll/vr4;

    .line 7
    .line 8
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    add-int/lit8 v2, v2, -0x1

    .line 13
    .line 14
    if-ge v0, v2, :cond_0

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ll/vr4;

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ll/vr4;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ll/vr4;->d(Ll/vr4;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v1}, Ll/vr4;->c(Ll/vr4;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-object v1
.end method


# virtual methods
.method public abstract b(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TR;"
        }
    .end annotation
.end method

.method public final c(Ll/vr4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vr4<",
            "TR;TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vr4;->b:Ll/vr4;

    .line 2
    .line 3
    return-void
.end method

.method public final d(Ll/vr4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vr4<",
            "TR;TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vr4;->a:Ll/vr4;

    .line 2
    .line 3
    return-void
.end method
