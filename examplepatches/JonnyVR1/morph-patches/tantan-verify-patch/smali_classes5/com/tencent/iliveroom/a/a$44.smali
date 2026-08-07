.class Lcom/tencent/iliveroom/a/a$44;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->switchRole(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$44;->a:I

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
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/iliveroom/a/a$44;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 7
    .line 8
    iget-boolean v0, v0, Lcom/tencent/iliveroom/a/a;->b:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p0, "TRTCAdapter-ext"

    .line 13
    .line 14
    const-string v0, "switchRole -> ignore, already is broadcaster."

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v2}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;I)I

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 27
    .line 28
    invoke-static {v0, v2}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;I)I

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 32
    .line 33
    invoke-static {v0, v2}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;I)I

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 37
    .line 38
    invoke-static {v0, v2}, Lcom/tencent/iliveroom/a/a;->d(Lcom/tencent/iliveroom/a/a;I)I

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 42
    .line 43
    iget v3, p0, Lcom/tencent/iliveroom/a/a$44;->a:I

    .line 44
    .line 45
    if-ne v3, v1, :cond_1

    .line 46
    .line 47
    move v2, v1

    .line 48
    :cond_1
    iput-boolean v2, v0, Lcom/tencent/iliveroom/a/a;->b:Z

    .line 49
    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->q(Lcom/tencent/iliveroom/a/a;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->r(Lcom/tencent/iliveroom/a/a;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->s(Lcom/tencent/iliveroom/a/a;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->t(Lcom/tencent/iliveroom/a/a;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 78
    .line 79
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 83
    .line 84
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->d(Lcom/tencent/iliveroom/a/a;Z)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$44;->b:Lcom/tencent/iliveroom/a/a;

    .line 88
    .line 89
    iget-boolean v1, v0, Lcom/tencent/iliveroom/a/a;->b:Z

    .line 90
    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    const/16 v1, 0x14

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    const/16 v1, 0x15

    .line 97
    .line 98
    :goto_1
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->e(Lcom/tencent/iliveroom/a/a;I)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget p0, p0, Lcom/tencent/iliveroom/a/a$44;->a:I

    .line 106
    .line 107
    invoke-virtual {v0, p0}, Lcom/tencent/iliveroom/a/b/a;->a(I)V

    .line 108
    .line 109
    .line 110
    return-void
.end method
