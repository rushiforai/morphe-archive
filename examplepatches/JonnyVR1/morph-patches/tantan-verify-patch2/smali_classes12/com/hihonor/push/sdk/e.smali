.class public Lcom/hihonor/push/sdk/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hihonor/push/sdk/v;

.field public final synthetic b:Lcom/hihonor/push/sdk/l;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/l;Lcom/hihonor/push/sdk/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hihonor/push/sdk/e;->a:Lcom/hihonor/push/sdk/v;

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
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/hihonor/push/sdk/l;->b:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Lcom/hihonor/push/sdk/l;->a(Lcom/hihonor/push/sdk/l;Z)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 19
    .line 20
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/hihonor/push/sdk/e;->a:Lcom/hihonor/push/sdk/v;

    .line 23
    .line 24
    iget-object v3, v3, Lcom/hihonor/push/sdk/v;->a:Landroid/content/Context;

    .line 25
    .line 26
    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iput-object v2, v0, Lcom/hihonor/push/sdk/l;->a:Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/hihonor/push/sdk/e;->a:Lcom/hihonor/push/sdk/v;

    .line 34
    .line 35
    iget-boolean v2, v2, Lcom/hihonor/push/sdk/v;->b:Z

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/hihonor/push/sdk/l;->b(Lcom/hihonor/push/sdk/l;Z)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 41
    .line 42
    new-instance v2, Lcom/hihonor/push/sdk/s;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/hihonor/push/sdk/e;->a:Lcom/hihonor/push/sdk/v;

    .line 45
    .line 46
    iget-object v3, v3, Lcom/hihonor/push/sdk/v;->a:Landroid/content/Context;

    .line 47
    .line 48
    invoke-direct {v2, v3}, Lcom/hihonor/push/sdk/s;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iput-object v2, v0, Lcom/hihonor/push/sdk/l;->d:Lcom/hihonor/push/sdk/s;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 54
    .line 55
    iget-boolean v0, v0, Lcom/hihonor/push/sdk/l;->c:Z

    .line 56
    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object p0, p0, Lcom/hihonor/push/sdk/e;->b:Lcom/hihonor/push/sdk/l;

    .line 60
    .line 61
    new-instance v0, Lcom/hihonor/push/sdk/f;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-direct {v0, p0, v2, v1}, Lcom/hihonor/push/sdk/f;-><init>(Lcom/hihonor/push/sdk/l;Lcom/hihonor/push/sdk/HonorPushCallback;Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0, v2}, Lcom/hihonor/push/sdk/l;->a(Ljava/lang/Runnable;Lcom/hihonor/push/sdk/HonorPushCallback;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method
