.class public final Ll/pbw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/util/List;

.field public final synthetic c:Ll/ecw0;


# direct methods
.method public synthetic constructor <init>(Ll/ecw0;Ljava/lang/Object;Ljava/util/List;Ll/obw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pbw0;->c:Ll/ecw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/pbw0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pbw0;->b:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/concurrent/Callable;)Ll/dcw0;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/pbw0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/pvw0;->b(Ljava/lang/Iterable;)Ll/ovw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/nbw0;->a:Ll/nbw0;

    .line 8
    .line 9
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/ovw0;->a(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    iget-object v1, p0, Ll/pbw0;->c:Ll/ecw0;

    .line 16
    .line 17
    new-instance v3, Ll/dcw0;

    .line 18
    .line 19
    invoke-static {v1}, Ll/ecw0;->e(Ll/ecw0;)Ll/xvw0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, p1, v1}, Ll/ovw0;->a(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 24
    .line 25
    .line 26
    move-result-object v9

    .line 27
    iget-object v8, p0, Ll/pbw0;->b:Ljava/util/List;

    .line 28
    .line 29
    iget-object v4, p0, Ll/pbw0;->c:Ll/ecw0;

    .line 30
    .line 31
    iget-object v5, p0, Ll/pbw0;->a:Ljava/lang/Object;

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    const/4 v10, 0x0

    .line 35
    invoke-direct/range {v3 .. v10}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;Ll/ccw0;)V

    .line 36
    .line 37
    .line 38
    return-object v3
.end method
