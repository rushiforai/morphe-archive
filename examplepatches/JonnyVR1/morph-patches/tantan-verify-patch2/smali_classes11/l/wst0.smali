.class public final Ll/wst0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fst0;


# instance fields
.field public final a:Ll/ncv0;


# direct methods
.method public constructor <init>(Ll/ncv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wst0;->a:Ll/ncv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/Map;)V
    .locals 2

    .line 1
    sget-object p1, Ll/sgs0;->U9:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/wst0;->a:Ll/ncv0;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Ll/ncv0;->a(Z)Ll/hpr;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object p1, Ll/vst0;->a:Ll/vst0;

    .line 32
    .line 33
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 34
    .line 35
    const-class v1, Ljava/lang/Throwable;

    .line 36
    .line 37
    invoke-static {p0, v1, p1, v0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 38
    .line 39
    .line 40
    return-void
.end method
