.class public Ll/zwd0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zwd0;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/zwd0;


# direct methods
.method public constructor <init>(Ll/zwd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zwd0$a;->a:Ll/zwd0;

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
    iget-object v0, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zwd0;->a(Ll/zwd0;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 8
    .line 9
    invoke-static {v1}, Ll/zwd0;->d(Ll/zwd0;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lt v0, v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/zwd0;->f(Ll/zwd0;)Ll/utl;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/zwd0;->i()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 29
    .line 30
    invoke-static {v2}, Ll/zwd0;->e(Ll/zwd0;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v0, v1, v2}, Ll/utl;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 38
    .line 39
    invoke-static {v0}, Ll/zwd0;->c(Ll/zwd0;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 44
    .line 45
    invoke-static {v1}, Ll/zwd0;->d(Ll/zwd0;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 50
    .line 51
    if-ge v0, v1, :cond_1

    .line 52
    .line 53
    invoke-static {v2}, Ll/zwd0;->h(Ll/zwd0;)Landroid/os/Handler;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 58
    .line 59
    invoke-static {v1}, Ll/zwd0;->g(Ll/zwd0;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-static {v2}, Ll/zwd0;->f(Ll/zwd0;)Ll/utl;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/zwd0$a;->a:Ll/zwd0;

    .line 72
    .line 73
    invoke-static {p0}, Ll/zwd0;->e(Ll/zwd0;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {v0, p0}, Ll/utl;->a(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
