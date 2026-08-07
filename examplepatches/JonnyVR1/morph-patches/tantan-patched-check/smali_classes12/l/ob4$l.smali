.class Ll/ob4$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4;->K1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ob4;->R0(Ll/ob4;)Ll/p3m;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 15
    .line 16
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 21
    .line 22
    invoke-static {v1}, Ll/ob4;->T0(Ll/ob4;)Ll/qow;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v2, v1}, Ll/ia4;->h(ILl/qow;)Z

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 31
    .line 32
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, v2}, Ll/v5c;->O0(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 40
    .line 41
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/v5c;->c1()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 49
    .line 50
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {v0, v1}, Ll/ia4;->q(Landroid/graphics/SurfaceTexture;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 60
    .line 61
    invoke-static {v1}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Ll/ia4;->d()Ll/ypl;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    if-eqz v1, :cond_0

    .line 72
    .line 73
    invoke-interface {v1}, Ll/ypl;->getTextureSize()Ll/crf0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    iget-object p0, p0, Ll/ob4$l;->a:Ll/ob4;

    .line 80
    .line 81
    invoke-static {p0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    new-instance v1, Ll/crf0;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/crf0;->a()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-direct {v1, v2, v0}, Ll/crf0;-><init>(II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v1}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    return-void
.end method
