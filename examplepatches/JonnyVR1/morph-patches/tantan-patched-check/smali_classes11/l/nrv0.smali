.class public final Ll/nrv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/j0v0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/j0v0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nrv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nrv0;->b:Ll/j0v0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/urv0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nrv0;->b:Ll/j0v0;

    .line 2
    .line 3
    new-instance v1, Ll/urv0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/j0v0;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0}, Ll/j0v0;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-static {}, Ll/bxy0;->u()Ll/d6s0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/d6s0;->l()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    iget-object p0, p0, Ll/nrv0;->b:Ll/j0v0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/j0v0;->o()Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    invoke-virtual {p0}, Ll/j0v0;->r()Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-direct/range {v1 .. v6}, Ll/urv0;-><init>(Ljava/lang/String;ZZZZ)V

    .line 32
    .line 33
    .line 34
    return-object v1
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x17

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/mrv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mrv0;-><init>(Ll/nrv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/nrv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
