.class public Ll/rg4$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qol$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rg4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rg4;


# direct methods
.method public constructor <init>(Ll/rg4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rg4$a;->a:Ll/rg4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rg4$a;->a:Ll/rg4;

    .line 2
    .line 3
    iget-object v0, v0, Ll/rg4;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/rg4$a;->a:Ll/rg4;

    .line 15
    .line 16
    iget-object v0, v0, Ll/rg4;->b:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/rg4$a;->a:Ll/rg4;

    .line 22
    .line 23
    invoke-static {p0}, Ll/rg4;->f0(Ll/rg4;)Ll/iam;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/bh4;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/bh4;->Q()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg4$a;->a:Ll/rg4;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rg4;->g0(Ll/rg4;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bh4;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bh4;->G()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
