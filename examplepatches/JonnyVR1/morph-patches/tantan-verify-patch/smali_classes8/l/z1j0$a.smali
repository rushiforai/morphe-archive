.class Ll/z1j0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z1j0;->R1([Landroid/graphics/Point;)[F
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/graphics/Point;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ll/z1j0;


# direct methods
.method public constructor <init>(Ll/z1j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z1j0$a;->a:Ll/z1j0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Point;Landroid/graphics/Point;)I
    .locals 0

    .line 1
    iget p0, p1, Landroid/graphics/Point;->x:I

    .line 2
    .line 3
    iget p1, p2, Landroid/graphics/Point;->x:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Point;

    .line 2
    .line 3
    check-cast p2, Landroid/graphics/Point;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/z1j0$a;->a(Landroid/graphics/Point;Landroid/graphics/Point;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
