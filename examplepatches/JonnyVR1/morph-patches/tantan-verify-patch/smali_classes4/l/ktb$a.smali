.class public Ll/ktb$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ktb;->e(Landroid/os/Looper;)Landroid/os/Handler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ktb;


# direct methods
.method public constructor <init>(Ll/ktb;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ktb$a;->a:Ll/ktb;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    iget-object p1, p0, Ll/ktb$a;->a:Ll/ktb;

    .line 12
    .line 13
    invoke-static {p1}, Ll/ktb;->c(Ll/ktb;)Ljava/util/LinkedList;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v3, p0, Ll/ktb$a;->a:Ll/ktb;

    .line 18
    .line 19
    invoke-static {v3}, Ll/ktb;->a(Ll/ktb;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    sub-long v3, v1, v3

    .line 24
    .line 25
    sget v5, Ll/ktb;->g:I

    .line 26
    .line 27
    int-to-long v5, v5

    .line 28
    sub-long/2addr v3, v5

    .line 29
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {p1, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/ktb$a;->a:Ll/ktb;

    .line 37
    .line 38
    invoke-static {p1, v1, v2}, Ll/ktb;->b(Ll/ktb;J)J

    .line 39
    .line 40
    .line 41
    sget p1, Ll/ktb;->g:I

    .line 42
    .line 43
    int-to-long v1, p1

    .line 44
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/ktb$a;->a:Ll/ktb;

    .line 48
    .line 49
    invoke-static {p1}, Ll/ktb;->c(Ll/ktb;)Ljava/util/LinkedList;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    const/16 v0, 0x1e

    .line 58
    .line 59
    if-lt p1, v0, :cond_1

    .line 60
    .line 61
    iget-object p0, p0, Ll/ktb$a;->a:Ll/ktb;

    .line 62
    .line 63
    invoke-static {p0}, Ll/ktb;->c(Ll/ktb;)Ljava/util/LinkedList;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method
