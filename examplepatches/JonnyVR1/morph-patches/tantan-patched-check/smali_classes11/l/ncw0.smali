.class public final Ll/ncw0;
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
    iput-object p1, p0, Ll/ncw0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ncw0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ncw0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ncw0;->b:Ll/kqx0;

    .line 7
    .line 8
    invoke-interface {v1}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ncw0;->c:Ll/kqx0;

    .line 15
    .line 16
    check-cast p0, Ll/ocw0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ocw0;->a()Ll/kcw0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v2, Ll/lcw0;

    .line 23
    .line 24
    invoke-direct {v2, v0, v1, p0}, Ll/lcw0;-><init>(Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ll/kcw0;)V

    .line 25
    .line 26
    .line 27
    return-object v2
.end method
