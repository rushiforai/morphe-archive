.class public abstract Ll/d8o;
.super Ll/d3q;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/d3q<",
        "TV;>;",
        "Ljava/lang/Comparable<",
        "Ll/d8o<",
        "+",
        "Landroid/view/View;",
        ">;>;"
    }
.end annotation


# instance fields
.field public a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/d8o;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public H(Ll/d8o;)I
    .locals 0
    .param p1    # Ll/d8o;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d8o<",
            "+",
            "Landroid/view/View;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/d8o;->a:I

    .line 2
    .line 3
    iget p1, p1, Ll/d8o;->a:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public I()I
    .locals 0

    .line 1
    iget p0, p0, Ll/d8o;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public J(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/d8o;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/d8o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d8o;->H(Ll/d8o;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
