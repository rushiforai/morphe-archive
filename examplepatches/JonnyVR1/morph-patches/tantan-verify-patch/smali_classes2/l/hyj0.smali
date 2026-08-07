.class public Ll/hyj0;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ll/wbr;
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Ljava/lang/String;",
        ">;",
        "Ll/wbr;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field public final a:Ll/wbr;


# direct methods
.method public constructor <init>(Ll/wbr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hyj0;->a:Ll/wbr;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/hyj0;)Ll/wbr;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hyj0;->a:Ll/wbr;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public e0(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hyj0;->a:Ll/wbr;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/wbr;->e0(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 10
    invoke-virtual {p0, p1}, Ll/hyj0;->get(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public get(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hyj0;->a:Ll/wbr;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hyj0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hyj0$b;-><init>(Ll/hyj0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public k()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hyj0;->a:Ll/wbr;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wbr;->k()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hyj0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hyj0$a;-><init>(Ll/hyj0;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public m()Ll/wbr;
    .locals 0

    .line 1
    return-object p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hyj0;->a:Ll/wbr;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public t(Landroidx/datastore/preferences/protobuf/ByteString;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method
