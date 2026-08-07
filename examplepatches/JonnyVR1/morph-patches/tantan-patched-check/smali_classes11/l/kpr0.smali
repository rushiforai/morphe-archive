.class public final Ll/kpr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;

.field public final b:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;Ll/bou0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kpr0;->a:Ll/bou0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kpr0;->b:Ll/bou0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/cor0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kpr0;->a:Ll/bou0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/app/Application;

    .line 8
    .line 9
    iget-object p0, p0, Ll/kpr0;->b:Ll/bou0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/tqr0;

    .line 16
    .line 17
    invoke-static {}, Ll/nxr0;->a()Ljava/util/concurrent/Executor;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/concurrent/Executor;

    .line 22
    .line 23
    new-instance v2, Ll/cor0;

    .line 24
    .line 25
    invoke-direct {v2, v0, p0, v1}, Ll/cor0;-><init>(Landroid/app/Application;Ll/tqr0;Ljava/util/concurrent/Executor;)V

    .line 26
    .line 27
    .line 28
    return-object v2
.end method

.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kpr0;->a()Ll/cor0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
