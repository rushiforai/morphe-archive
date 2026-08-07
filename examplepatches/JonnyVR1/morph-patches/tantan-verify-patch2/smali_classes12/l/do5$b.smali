.class public final Ll/do5$b;
.super Ll/do5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/do5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final d:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/do5;-><init>(Ll/do5$a;)V

    .line 3
    .line 4
    .line 5
    iput p1, p0, Ll/do5$b;->d:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public d(II)Ll/do5;
    .locals 0

    .line 1
    return-object p0
.end method

.method public e(JJ)Ll/do5;
    .locals 0

    .line 1
    return-object p0
.end method

.method public f(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ll/do5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "*>;",
            "Ljava/lang/Comparable<",
            "*>;)",
            "Ll/do5;"
        }
    .end annotation

    .line 1
    return-object p0
.end method

.method public g(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/do5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;",
            "Ljava/util/Comparator<",
            "TT;>;)",
            "Ll/do5;"
        }
    .end annotation

    .line 1
    return-object p0
.end method

.method public h(ZZ)Ll/do5;
    .locals 0

    .line 1
    return-object p0
.end method

.method public i(ZZ)Ll/do5;
    .locals 0

    .line 1
    return-object p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/do5$b;->d:I

    .line 2
    .line 3
    return p0
.end method
