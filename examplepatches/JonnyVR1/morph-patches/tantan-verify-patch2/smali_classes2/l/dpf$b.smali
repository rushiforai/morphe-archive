.class public final Ll/dpf$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cwi$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dpf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/cwi$b<",
        "Ll/gvf0<",
        "Ll/bc;",
        ">;",
        "Ll/bc;",
        ">;"
    }
.end annotation


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


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gvf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dpf$b;->c(Ll/gvf0;I)Ll/bc;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/gvf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dpf$b;->d(Ll/gvf0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ll/gvf0;I)Ll/bc;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gvf0<",
            "Ll/bc;",
            ">;I)",
            "Ll/bc;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ll/gvf0;->m(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/bc;

    .line 6
    .line 7
    return-object p0
.end method

.method public d(Ll/gvf0;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gvf0<",
            "Ll/bc;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/gvf0;->l()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
