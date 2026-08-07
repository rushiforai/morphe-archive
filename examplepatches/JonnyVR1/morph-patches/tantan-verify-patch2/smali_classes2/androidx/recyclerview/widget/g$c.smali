.class public Landroidx/recyclerview/widget/g$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:[I

.field public final b:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array p1, p1, [I

    .line 5
    .line 6
    iput-object p1, p0, Landroidx/recyclerview/widget/g$c;->a:[I

    .line 7
    .line 8
    array-length p1, p1

    .line 9
    div-int/lit8 p1, p1, 0x2

    .line 10
    .line 11
    iput p1, p0, Landroidx/recyclerview/widget/g$c;->b:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()[I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/g$c;->a:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public b(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/g$c;->a:[I

    .line 2
    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/g$c;->b:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    aget p0, v0, p1

    .line 7
    .line 8
    return p0
.end method

.method public c(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/g$c;->a:[I

    .line 2
    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/g$c;->b:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    aput p2, v0, p1

    .line 7
    .line 8
    return-void
.end method
