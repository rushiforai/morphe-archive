.class public Ll/bbh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bbh0;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bbh0;


# direct methods
.method public constructor <init>(Ll/bbh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/bbh0;->c(Ll/bbh0;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 10
    .line 11
    invoke-static {p2}, Ll/bbh0;->b(Ll/bbh0;)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-le p4, p2, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 18
    .line 19
    invoke-static {p2}, Ll/bbh0;->e(Ll/bbh0;)Ll/xvx;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Ll/xvx;->q()V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 27
    .line 28
    invoke-static {p2}, Ll/bbh0;->e(Ll/bbh0;)Ll/xvx;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object v0, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 33
    .line 34
    invoke-static {v0}, Ll/bbh0;->a(Ll/bbh0;)Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p2, v0}, Ll/xvx;->k(Lcom/p1/mobile/android/app/Act;)Z

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 42
    .line 43
    invoke-static {p2}, Ll/bbh0;->e(Ll/bbh0;)Ll/xvx;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p2, p1, p3, p4}, Ll/xvx;->m(Landroid/view/SurfaceHolder;II)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-static {p2, v0}, Ll/bbh0;->g(Ll/bbh0;Z)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 57
    .line 58
    invoke-static {p2, p4}, Ll/bbh0;->f(Ll/bbh0;I)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 62
    .line 63
    invoke-static {p2}, Ll/bbh0;->d(Ll/bbh0;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_1

    .line 68
    .line 69
    iget-object p2, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 70
    .line 71
    invoke-static {p2}, Ll/bbh0;->e(Ll/bbh0;)Ll/xvx;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p2, p1, p3, p4}, Ll/xvx;->m(Landroid/view/SurfaceHolder;II)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/bbh0$a;->a:Ll/bbh0;

    .line 79
    .line 80
    const/4 p1, 0x1

    .line 81
    invoke-static {p0, p1}, Ll/bbh0;->h(Ll/bbh0;Z)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method
