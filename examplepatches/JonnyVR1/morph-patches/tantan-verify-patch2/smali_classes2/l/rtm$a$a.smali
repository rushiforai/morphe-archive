.class public Ll/rtm$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s6c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rtm$a;
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
.field public a:I

.field public final synthetic b:Ll/rtm$a;


# direct methods
.method public constructor <init>(Ll/rtm$a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rtm$a$a;->b:Ll/rtm$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/rtm$a$a;->a:I

    .line 7
    .line 8
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
    iget v0, p0, Ll/rtm$a$a;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/rtm$a$a;->b:Ll/rtm$a;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/i6c;->c()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/facebook/datasource/AbstractDataSource;->r(F)Z

    .line 12
    .line 13
    .line 14
    :cond_0
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
    iget-object v0, p0, Ll/rtm$a$a;->b:Ll/rtm$a;

    .line 8
    .line 9
    iget p0, p0, Ll/rtm$a$a;->a:I

    .line 10
    .line 11
    invoke-static {v0, p0, p1}, Ll/rtm$a;->y(Ll/rtm$a;ILl/i6c;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-interface {p1}, Ll/i6c;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/rtm$a$a;->b:Ll/rtm$a;

    .line 22
    .line 23
    iget p0, p0, Ll/rtm$a$a;->a:I

    .line 24
    .line 25
    invoke-static {v0, p0, p1}, Ll/rtm$a;->x(Ll/rtm$a;ILl/i6c;)V

    .line 26
    .line 27
    .line 28
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
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rtm$a$a;->b:Ll/rtm$a;

    .line 2
    .line 3
    iget p0, p0, Ll/rtm$a$a;->a:I

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/rtm$a;->x(Ll/rtm$a;ILl/i6c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
