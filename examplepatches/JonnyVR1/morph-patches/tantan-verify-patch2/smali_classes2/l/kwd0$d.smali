.class public Ll/kwd0$d;
.super Ll/kwd0$f;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kwd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kwd0$f<",
        "TK;TV;>;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/kwd0$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/kwd0$c<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field public b:Z

.field public final synthetic c:Ll/kwd0;


# direct methods
.method public constructor <init>(Ll/kwd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kwd0$d;->c:Ll/kwd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kwd0$f;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/kwd0$d;->b:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/kwd0$c;)V
    .locals 1
    .param p1    # Ll/kwd0$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kwd0$c<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, v0, Ll/kwd0$c;->d:Ll/kwd0$c;

    .line 6
    .line 7
    iput-object p1, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    iput-boolean p1, p0, Ll/kwd0$d;->b:Z

    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public b()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/kwd0$d;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/kwd0$d;->b:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/kwd0$d;->c:Ll/kwd0;

    .line 9
    .line 10
    iget-object v0, v0, Ll/kwd0;->a:Ll/kwd0$c;

    .line 11
    .line 12
    iput-object v0, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, v0, Ll/kwd0$c;->c:Ll/kwd0$c;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    :goto_0
    iput-object v0, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 24
    .line 25
    :goto_1
    iget-object p0, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 26
    .line 27
    return-object p0
.end method

.method public hasNext()Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/kwd0$d;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/kwd0$d;->c:Ll/kwd0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/kwd0;->a:Ll/kwd0$c;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return v2

    .line 14
    :cond_0
    return v1

    .line 15
    :cond_1
    iget-object p0, p0, Ll/kwd0$d;->a:Ll/kwd0$c;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    iget-object p0, p0, Ll/kwd0$c;->c:Ll/kwd0$c;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    return v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kwd0$d;->b()Ljava/util/Map$Entry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
