.class public final Ll/qxu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/lxu0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/lxu0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qxu0;->a:Ll/lxu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qxu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qxu0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qxu0;->b:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/byu0;

    .line 8
    .line 9
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/lxu0;->e(Ll/byu0;Ljava/util/concurrent/Executor;)Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-object p0
.end method
