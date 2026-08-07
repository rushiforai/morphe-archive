.class public final Ll/vpu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vpu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vpu0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/upu0;
    .locals 2

    .line 1
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vpu0;->b:Ll/kqx0;

    .line 7
    .line 8
    check-cast p0, Ll/qpu0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/qpu0;->a()Ll/ppu0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v1, Ll/upu0;

    .line 15
    .line 16
    invoke-direct {v1, v0, p0}, Ll/upu0;-><init>(Ljava/util/concurrent/Executor;Ll/ppu0;)V

    .line 17
    .line 18
    .line 19
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vpu0;->a()Ll/upu0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
