.class Ll/yn0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yn0;->d(Landroid/view/SurfaceHolder;FII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/yn0;


# direct methods
.method public constructor <init>(Ll/yn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 10

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p2, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 4
    .line 5
    invoke-static {p2}, Ll/yn0;->t(Ll/yn0;)Ll/zpl;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ll/p94;

    .line 13
    .line 14
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p2, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 19
    .line 20
    invoke-static {p2}, Ll/yn0;->u(Ll/yn0;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iget-object p2, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 25
    .line 26
    invoke-static {p2}, Ll/yn0;->v(Ll/yn0;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget-object p2, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 31
    .line 32
    invoke-static {p2}, Ll/yn0;->w(Ll/yn0;)I

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    iget-object p2, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 37
    .line 38
    invoke-static {p2}, Ll/yn0;->x(Ll/yn0;)I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    const/4 v4, 0x0

    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x0

    .line 45
    const/4 v7, 0x0

    .line 46
    invoke-direct/range {v0 .. v9}, Ll/p94;-><init>(Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;IIII)V

    .line 47
    .line 48
    .line 49
    iput-object p1, v0, Ll/p94;->q:[B

    .line 50
    .line 51
    iget-object p1, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 52
    .line 53
    invoke-static {p1}, Ll/yn0;->y(Ll/yn0;)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {v0, p1}, Ll/p94;->h(I)Ll/p94;

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 61
    .line 62
    invoke-static {p1}, Ll/yn0;->t(Ll/yn0;)Ll/zpl;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Ll/yn0$a;->a:Ll/yn0;

    .line 69
    .line 70
    invoke-static {p0}, Ll/yn0;->t(Ll/yn0;)Ll/zpl;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-interface {p0, v0}, Ll/zpl;->p0(Ll/p94;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    sget p0, Ll/t0g0$a;->b:I

    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-static {p0, p1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_0
    return-void
.end method
