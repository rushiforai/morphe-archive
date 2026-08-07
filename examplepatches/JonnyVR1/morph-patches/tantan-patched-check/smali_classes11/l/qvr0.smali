.class public final Ll/qvr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ll/jwr0;

.field public final b:Ll/pwr0;

.field public final c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qvr0;->a:Ll/jwr0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qvr0;->b:Ll/pwr0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qvr0;->c:Ljava/lang/Runnable;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qvr0;->a:Ll/jwr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jwr0;->A()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qvr0;->b:Ll/pwr0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/pwr0;->c()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Ll/qvr0;->a:Ll/jwr0;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Ll/pwr0;->a:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Ll/jwr0;->s(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, v0, Ll/pwr0;->c:Lcom/google/android/gms/internal/ads/zzaqj;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ll/jwr0;->r(Lcom/google/android/gms/internal/ads/zzaqj;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object v0, p0, Ll/qvr0;->b:Ll/pwr0;

    .line 28
    .line 29
    iget-boolean v0, v0, Ll/pwr0;->d:Z

    .line 30
    .line 31
    iget-object v1, p0, Ll/qvr0;->a:Ll/jwr0;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string v0, "intermediate-response"

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const-string v0, "done"

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/jwr0;->t(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :goto_1
    iget-object p0, p0, Ll/qvr0;->c:Ljava/lang/Runnable;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method
