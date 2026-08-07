.class Ll/un0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/un0;->d(Ljava/util/List;FI)Landroid/hardware/Camera$Size;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/hardware/Camera$Size;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:Ll/un0;


# direct methods
.method public constructor <init>(Ll/un0;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/un0$a;->b:Ll/un0;

    .line 2
    .line 3
    iput p2, p0, Ll/un0$a;->a:F

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I
    .locals 6

    .line 1
    iget v0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p1, Landroid/hardware/Camera$Size;->height:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Ll/un0$a;->a:F

    .line 9
    .line 10
    sub-float/2addr v0, v1

    .line 11
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p2, Landroid/hardware/Camera$Size;->width:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    iget v2, p2, Landroid/hardware/Camera$Size;->height:I

    .line 19
    .line 20
    int-to-float v2, v2

    .line 21
    div-float/2addr v1, v2

    .line 22
    iget p0, p0, Ll/un0$a;->a:F

    .line 23
    .line 24
    sub-float/2addr v1, p0

    .line 25
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-float/2addr v0, p0

    .line 30
    iget p0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 31
    .line 32
    iget p1, p2, Landroid/hardware/Camera$Size;->width:I

    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    const/4 v1, -0x1

    .line 36
    if-le p0, p1, :cond_0

    .line 37
    .line 38
    move p0, v1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move p0, p2

    .line 41
    :goto_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    float-to-double v2, p1

    .line 46
    const-wide v4, 0x3f847ae147ae147bL    # 0.01

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    cmpg-double p1, v2, v4

    .line 52
    .line 53
    if-gez p1, :cond_1

    .line 54
    .line 55
    return p0

    .line 56
    :cond_1
    const/4 p0, 0x0

    .line 57
    cmpg-float p1, v0, p0

    .line 58
    .line 59
    if-gez p1, :cond_2

    .line 60
    .line 61
    return v1

    .line 62
    :cond_2
    cmpl-float p0, v0, p0

    .line 63
    .line 64
    if-lez p0, :cond_3

    .line 65
    .line 66
    return p2

    .line 67
    :cond_3
    const/4 p0, 0x0

    .line 68
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroid/hardware/Camera$Size;

    .line 2
    .line 3
    check-cast p2, Landroid/hardware/Camera$Size;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/un0$a;->a(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
