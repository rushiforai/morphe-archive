.class Lcom/tencent/liteav/d$14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->j(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/d$14;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->e(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget v1, v1, Lcom/tencent/liteav/g;->h:I

    .line 17
    .line 18
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->f(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget v1, v1, Lcom/tencent/liteav/g;->l:I

    .line 28
    .line 29
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->e(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Lcom/tencent/liteav/g;->k:Lcom/tencent/liteav/basic/a/c;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/basic/a/c;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget v1, v1, Lcom/tencent/liteav/g;->a:I

    .line 50
    .line 51
    iget-object v2, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget v2, v2, Lcom/tencent/liteav/g;->b:I

    .line 58
    .line 59
    invoke-interface {v0, v1, v2}, Lcom/tencent/liteav/k;->b(II)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/tencent/liteav/d$14;->b:Lcom/tencent/liteav/d;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-boolean v1, v1, Lcom/tencent/liteav/g;->U:Z

    .line 69
    .line 70
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->e(Z)V

    .line 71
    .line 72
    .line 73
    iget-boolean p0, p0, Lcom/tencent/liteav/d$14;->a:Z

    .line 74
    .line 75
    if-eqz p0, :cond_1

    .line 76
    .line 77
    invoke-interface {v0}, Lcom/tencent/liteav/k;->d()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    invoke-interface {v0, p0}, Lcom/tencent/liteav/k;->b(Z)V

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    return-void
.end method
