.class public abstract Ll/jlb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/jlb0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/x20;

.field public b:Ll/x20;

.field public c:I


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
.method public b(Ll/jlb0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jlb0;->c:I

    .line 2
    .line 3
    iget p1, p1, Ll/jlb0;->c:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/jlb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jlb0;->b(Ll/jlb0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract j()I
.end method

.method public abstract o()Ljava/lang/String;
.end method

.method public abstract p()Ljava/lang/String;
.end method

.method public q(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jlb0;->b:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jlb0;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public s(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jlb0;->a:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
