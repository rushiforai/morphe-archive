.class public final Ll/agv0;
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
    iput-object p1, p0, Ll/agv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/agv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/agv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/agv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/agv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/agv0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Ll/qju0;

    .line 9
    .line 10
    sget-object v3, Ll/oct0;->a:Ll/xvw0;

    .line 11
    .line 12
    invoke-static {v3}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/agv0;->c:Ll/kqx0;

    .line 16
    .line 17
    check-cast v0, Ll/xou0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/xou0;->a()Ll/wou0;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v0, p0, Ll/agv0;->d:Ll/kqx0;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    move-object v5, v0

    .line 30
    check-cast v5, Ll/s8w0;

    .line 31
    .line 32
    iget-object p0, p0, Ll/agv0;->e:Ll/kqx0;

    .line 33
    .line 34
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    move-object v6, p0

    .line 39
    check-cast v6, Ll/bsu0;

    .line 40
    .line 41
    new-instance v1, Ll/zfv0;

    .line 42
    .line 43
    invoke-direct/range {v1 .. v6}, Ll/zfv0;-><init>(Ll/qju0;Ll/xvw0;Ll/wou0;Ll/s8w0;Ll/bsu0;)V

    .line 44
    .line 45
    .line 46
    return-object v1
.end method
