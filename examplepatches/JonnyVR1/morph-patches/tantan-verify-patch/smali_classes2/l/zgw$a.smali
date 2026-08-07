.class public Ll/zgw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x0l0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zgw;->A(Ll/x0l0;)Ll/x0l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/x0l0<",
        "Ll/hsb$a<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/x0l0;

.field public final synthetic b:Ll/zgw;


# direct methods
.method public constructor <init>(Ll/zgw;Ll/x0l0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zgw$a;->b:Ll/zgw;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zgw$a;->a:Ll/x0l0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/hsb$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zgw$a;->b(Ll/hsb$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Ll/hsb$a;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hsb$a<",
            "TK;TV;>;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zgw$a;->b:Ll/zgw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zgw;->g(Ll/zgw;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget p0, p1, Ll/hsb$a;->g:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/zgw$a;->a:Ll/x0l0;

    .line 13
    .line 14
    iget-object p1, p1, Ll/hsb$a;->b:Ll/fb5;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1}, Ll/x0l0;->a(Ljava/lang/Object;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method
