.class public abstract Ll/c46;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h46;


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/c46;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/c46;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/c46;->a:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Ll/c46;->a:I

    .line 5
    .line 6
    iget v0, p0, Ll/c46;->b:I

    .line 7
    .line 8
    add-int/2addr v0, p1

    .line 9
    iput v0, p0, Ll/c46;->b:I

    .line 10
    .line 11
    return-void
.end method

.method public final getIndex(Ljava/lang/String;)Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/pf60;

    .line 2
    .line 3
    iget v0, p0, Ll/c46;->a:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget p0, p0, Ll/c46;->b:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {p1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method
