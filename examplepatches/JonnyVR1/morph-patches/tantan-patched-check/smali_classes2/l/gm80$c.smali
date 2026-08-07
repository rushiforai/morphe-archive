.class public Ll/gm80$c;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gm80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic c:Ll/gm80;


# direct methods
.method public constructor <init>(Ll/gm80;Ll/gm80$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gm80$c;->c:Ll/gm80;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/gm80;Ll/gm80$a;Ll/hm80;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2}, Ll/gm80$c;-><init>(Ll/gm80;Ll/gm80$a;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/gm80$c;->p(Ll/fb5;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/fb5;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
