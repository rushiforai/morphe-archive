.class public Ll/rqi$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s6c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rqi$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/s6c<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/rqi$a;


# direct methods
.method public constructor <init>(Ll/rqi$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rqi$a$a;->a:Ll/rqi$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/rqi$a;Ll/sqi;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/rqi$a$a;-><init>(Ll/rqi$a;)V

    return-void
.end method


# virtual methods
.method public a(Ll/i6c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rqi$a$a;->a:Ll/rqi$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/datasource/AbstractDataSource;->c()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/rqi$a$a;->a:Ll/rqi$a;

    .line 8
    .line 9
    invoke-interface {p1}, Ll/i6c;->c()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/facebook/datasource/AbstractDataSource;->r(F)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b(Ll/i6c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/i6c;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/rqi$a$a;->a:Ll/rqi$a;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/rqi$a;->y(Ll/rqi$a;Ll/i6c;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-interface {p1}, Ll/i6c;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/rqi$a$a;->a:Ll/rqi$a;

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/rqi$a;->x(Ll/rqi$a;Ll/i6c;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public c(Ll/i6c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public d(Ll/i6c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rqi$a$a;->a:Ll/rqi$a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/rqi$a;->x(Ll/rqi$a;Ll/i6c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
