.class public Ll/un0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/un0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
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
.field final synthetic a:Ll/un0;


# direct methods
.method public constructor <init>(Ll/un0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/un0$b;->a:Ll/un0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "compare:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, ","

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p1, Landroid/hardware/Camera$Size;->height:I

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "  "

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p2, Landroid/hardware/Camera$Size;->width:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget v0, p2, Landroid/hardware/Camera$Size;->height:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "PREVIEW_SIZE"

    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/o6r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget p0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 51
    .line 52
    iget p1, p1, Landroid/hardware/Camera$Size;->height:I

    .line 53
    .line 54
    iget v0, p2, Landroid/hardware/Camera$Size;->width:I

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    if-ne p0, p1, :cond_1

    .line 58
    .line 59
    iget p1, p2, Landroid/hardware/Camera$Size;->height:I

    .line 60
    .line 61
    if-eq v0, p1, :cond_0

    .line 62
    .line 63
    return v1

    .line 64
    :cond_0
    sub-int/2addr p0, v0

    .line 65
    return p0

    .line 66
    :cond_1
    iget p2, p2, Landroid/hardware/Camera$Size;->height:I

    .line 67
    .line 68
    const/4 v2, -0x1

    .line 69
    if-ne v0, p2, :cond_2

    .line 70
    .line 71
    return v2

    .line 72
    :cond_2
    if-ne p0, v0, :cond_3

    .line 73
    .line 74
    sub-int/2addr p1, p2

    .line 75
    return p1

    .line 76
    :cond_3
    if-le p0, v0, :cond_4

    .line 77
    .line 78
    return v1

    .line 79
    :cond_4
    return v2
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
    invoke-virtual {p0, p1, p2}, Ll/un0$b;->a(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
