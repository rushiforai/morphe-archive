.class public final Ll/o9l0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/o9l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:[Ll/o9l0$a;


# direct methods
.method public varargs constructor <init>(I[Ll/o9l0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/o9l0$b;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/o9l0$b;->b:[Ll/o9l0$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()[Ll/o9l0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o9l0$b;->b:[Ll/o9l0$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/o9l0$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 4

    .line 1
    iget-object p0, p0, Ll/o9l0$b;->b:[Ll/o9l0$a;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    aget-object v3, p0, v1

    .line 9
    .line 10
    invoke-virtual {v3}, Ll/o9l0$a;->a()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    add-int/2addr v2, v3

    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return v2
.end method

.method public d()I
    .locals 1

    .line 1
    iget v0, p0, Ll/o9l0$b;->a:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o9l0$b;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-int/2addr v0, p0

    .line 8
    return v0
.end method
