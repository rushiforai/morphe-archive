.class Ll/g410$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->M(Ll/z5m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/zej;

.field final synthetic b:Ll/bfj;

.field final synthetic c:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Ll/zej;Ll/bfj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$p;->c:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$p;->a:Ll/zej;

    .line 4
    .line 5
    iput-object p3, p0, Ll/g410$p;->b:Ll/bfj;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const-string v0, "prepareRoot addTarget mScreenEndpoint modle:"

    .line 2
    .line 3
    iget-object v1, p0, Ll/g410$p;->c:Ll/g410;

    .line 4
    .line 5
    iget-object v1, v1, Ll/g410;->c:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v2, p0, Ll/g410$p;->c:Ll/g410;

    .line 9
    .line 10
    iget-object v2, v2, Ll/g410;->g:Ll/rsy;

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object v3, p0, Ll/g410$p;->a:Ll/zej;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ll/rsy;->addTarget(Ll/dfj;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Ll/g410$p;->b:Ll/bfj;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/bfj;->a()Ll/gfj;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Ll/g410$p;->c:Ll/g410;

    .line 26
    .line 27
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/g410$p;->b:Ll/bfj;

    .line 33
    .line 34
    invoke-virtual {v2}, Ll/bfj;->a()Ll/gfj;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v3, p0, Ll/g410$p;->c:Ll/g410;

    .line 39
    .line 40
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    new-instance v3, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/g410$p;->b:Ll/bfj;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/bfj;->a()Ll/gfj;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v2, p0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    iget-object v0, p0, Ll/g410$p;->b:Ll/bfj;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object p0, p0, Ll/g410$p;->a:Ll/zej;

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 86
    .line 87
    .line 88
    :goto_0
    monitor-exit v1

    .line 89
    return-void

    .line 90
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    throw p0
.end method
