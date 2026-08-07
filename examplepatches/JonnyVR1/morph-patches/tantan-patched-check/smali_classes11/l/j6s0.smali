.class public final Ll/j6s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hzx0;

.field public final synthetic b:Ll/l2s0;


# direct methods
.method public constructor <init>(Ll/l2s0;Ll/hzx0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/j6s0;->a:Ll/hzx0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/j6s0;->b:Ll/l2s0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j6s0;->a:Ll/hzx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/hzx0;->zzd()Ll/zbr0;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/zbr0;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/j6s0;->a:Ll/hzx0;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/hzx0;->zzl()Ll/qsx0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Ll/j6s0;->b:Ll/l2s0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/l2s0;->e()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Ll/j6s0;->b:Ll/l2s0;

    .line 29
    .line 30
    const-wide/16 v2, 0x0

    .line 31
    .line 32
    invoke-static {v1, v2, v3}, Ll/l2s0;->c(Ll/l2s0;J)V

    .line 33
    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/j6s0;->b:Ll/l2s0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/l2s0;->d()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
