.class public Ll/s410$c;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s410;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Ll/s410;


# direct methods
.method public constructor <init>(Ll/s410;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s410$c;->a:Ll/s410;

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
    .locals 5
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v0, 0xca

    .line 4
    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Ll/s410$c;->a:Ll/s410;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/s410;->i4()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iget-object p1, p0, Ll/s410$c;->a:Ll/s410;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/s410;->b1()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    long-to-int p1, v1

    .line 21
    iget-object v1, p0, Ll/s410$c;->a:Ll/s410;

    .line 22
    .line 23
    invoke-static {v1}, Ll/s410;->O3(Ll/s410;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    sub-int v1, p1, v1

    .line 28
    .line 29
    long-to-int v2, v3

    .line 30
    iget-object v3, p0, Ll/s410$c;->a:Ll/s410;

    .line 31
    .line 32
    invoke-static {v3}, Ll/s410;->Q3(Ll/s410;)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    sub-int v3, v2, v3

    .line 37
    .line 38
    iget-object v4, p0, Ll/s410$c;->a:Ll/s410;

    .line 39
    .line 40
    invoke-static {v4}, Ll/s410;->S3(Ll/s410;)Ll/lob0;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    iget-object v4, p0, Ll/s410$c;->a:Ll/s410;

    .line 47
    .line 48
    invoke-static {v4}, Ll/s410;->S3(Ll/s410;)Ll/lob0;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-virtual {v4, v1, v3}, Ll/lob0;->c(II)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v3, p0, Ll/s410$c;->a:Ll/s410;

    .line 56
    .line 57
    iget-object v3, v3, Ll/s410;->M2:Lcom/immomo/medialog/util/LimitedQueue;

    .line 58
    .line 59
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v3, v1}, Lcom/immomo/medialog/util/LimitedQueue;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/s410$c;->a:Ll/s410;

    .line 67
    .line 68
    invoke-static {v1, p1}, Ll/s410;->P3(Ll/s410;I)I

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/s410$c;->a:Ll/s410;

    .line 72
    .line 73
    invoke-static {p1, v2}, Ll/s410;->R3(Ll/s410;I)I

    .line 74
    .line 75
    .line 76
    const-wide/16 v1, 0x3e8

    .line 77
    .line 78
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 79
    .line 80
    .line 81
    return-void
.end method
