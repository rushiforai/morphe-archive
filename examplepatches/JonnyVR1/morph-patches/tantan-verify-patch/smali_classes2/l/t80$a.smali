.class public Ll/t80$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/n0f;",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/z06;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1}, Ll/pud;-><init>(Ll/z06;)V

    return-void
.end method

.method public synthetic constructor <init>(Ll/z06;Ll/u80;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t80$a;-><init>(Ll/z06;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/t80$a;->p(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/n0f;I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p1}, Ll/n0f;->Z(Ll/n0f;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/n0f;->e0()V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
