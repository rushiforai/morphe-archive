.class public final Ll/fxv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fxv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fxv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/fxv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/fxv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/fxv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Ljava/lang/String;Ll/cbs0;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;)Ll/dxv0;
    .locals 6

    .line 1
    new-instance v0, Ll/dxv0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/dxv0;-><init>(Ljava/lang/String;Ll/cbs0;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fxv0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/szv0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/szv0;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Ll/cbs0;

    .line 10
    .line 11
    invoke-direct {v3}, Ll/cbs0;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fxv0;->c:Ll/kqx0;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    move-object v4, v0

    .line 21
    check-cast v4, Ll/ebt0;

    .line 22
    .line 23
    iget-object p0, p0, Ll/fxv0;->d:Ll/kqx0;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    move-object v5, p0

    .line 30
    check-cast v5, Ljava/util/concurrent/ScheduledExecutorService;

    .line 31
    .line 32
    sget-object v6, Ll/oct0;->a:Ll/xvw0;

    .line 33
    .line 34
    invoke-static {v6}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/dxv0;

    .line 38
    .line 39
    invoke-direct/range {v1 .. v6}, Ll/dxv0;-><init>(Ljava/lang/String;Ll/cbs0;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;)V

    .line 40
    .line 41
    .line 42
    return-object v1
.end method
