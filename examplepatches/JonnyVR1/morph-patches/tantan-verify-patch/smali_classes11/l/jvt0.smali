.class public final Ll/jvt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jvt0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jvt0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jvt0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jvt0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/v6s0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/jvt0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/fws0;

    .line 16
    .line 17
    invoke-static {}, Ll/paw0;->a()Ll/xvw0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/vut0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/v6s0;->c()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-direct {v2, v0, p0, v1}, Ll/vut0;-><init>(Ljava/lang/String;Ll/fws0;Ljava/util/concurrent/Executor;)V

    .line 31
    .line 32
    .line 33
    return-object v2
.end method
