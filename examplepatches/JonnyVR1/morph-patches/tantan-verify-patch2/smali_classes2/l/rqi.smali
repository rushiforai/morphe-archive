.class public Ll/rqi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a7h0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rqi$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/a7h0<",
        "Ll/i6c<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a7h0<",
            "Ll/i6c<",
            "TT;>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a7h0<",
            "Ll/i6c<",
            "TT;>;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    xor-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    const-string v1, "List of suppliers is empty!"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/wn80;->c(ZLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/rqi;->a:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic a(Ll/rqi;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rqi;->a:Ljava/util/List;

    return-object p0
.end method

.method public static b(Ljava/util/List;)Ll/rqi;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Ll/a7h0<",
            "Ll/i6c<",
            "TT;>;>;>;)",
            "Ll/rqi<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rqi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rqi;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public c()Ll/i6c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/i6c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rqi$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rqi$a;-><init>(Ll/rqi;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Ll/rqi;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Ll/rqi;

    .line 12
    .line 13
    iget-object p0, p0, Ll/rqi;->a:Ljava/util/List;

    .line 14
    .line 15
    iget-object p1, p1, Ll/rqi;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/i950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rqi;->c()Ll/i6c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rqi;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/i950;->b(Ljava/lang/Object;)Ll/i950$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "list"

    .line 6
    .line 7
    iget-object p0, p0, Ll/rqi;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/i950$a;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
