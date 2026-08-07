.class public Ll/i500$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i500;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/i500;


# direct methods
.method public constructor <init>(Ll/i500;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i500$b;->a:Ll/i500;

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/i500$b;->a:Ll/i500;

    .line 2
    .line 3
    invoke-static {v0}, Ll/i500;->f(Ll/i500;)Ll/g500;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/u1z;->E1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iget-object v2, p0, Ll/i500$b;->a:Ll/i500;

    .line 26
    .line 27
    invoke-static {v2}, Ll/i500;->d(Ll/i500;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    sub-long/2addr v0, v2

    .line 32
    const-wide/16 v2, 0x190

    .line 33
    .line 34
    add-long/2addr v0, v2

    .line 35
    const-wide/32 v2, 0xea60

    .line 36
    .line 37
    .line 38
    cmp-long v0, v0, v2

    .line 39
    .line 40
    iget-object v1, p0, Ll/i500$b;->a:Ll/i500;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    if-gtz v0, :cond_0

    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/i500;->j(Ll/i500;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/i500$b;->a:Ll/i500;

    .line 49
    .line 50
    invoke-static {v0}, Ll/i500;->e(Ll/i500;)Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-wide/16 v1, 0x3e8

    .line 55
    .line 56
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    invoke-static {v1, v2}, Ll/i500;->i(Ll/i500;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/i500$b;->a:Ll/i500;

    .line 64
    .line 65
    invoke-static {p0}, Ll/i500;->f(Ll/i500;)Ll/g500;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/g500;->b1()Ll/tnw;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/tnw;->D()V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method
