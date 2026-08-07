.class public final synthetic Ll/pos0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final synthetic a:Ll/ggu0;

.field public final synthetic b:Ll/dut0;


# direct methods
.method public synthetic constructor <init>(Ll/ggu0;Ll/dut0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pos0;->a:Ll/ggu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pos0;->b:Ll/dut0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pos0;->a:Ll/ggu0;

    .line 2
    .line 3
    check-cast p1, Ll/wit0;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/aqs0;->c(Ljava/util/Map;Ll/ggu0;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "u"

    .line 9
    .line 10
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ljava/lang/String;

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    const-string p0, "URL missing from click GMSG."

    .line 19
    .line 20
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Ll/pos0;->b:Ll/dut0;

    .line 25
    .line 26
    invoke-static {p1, p2}, Ll/aqs0;->a(Ll/wit0;Ljava/lang/String;)Ll/hpr;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ros0;

    .line 35
    .line 36
    invoke-direct {v1, p0, p2}, Ll/ros0;-><init>(Ll/dut0;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/oct0;->a:Ll/xvw0;

    .line 40
    .line 41
    invoke-static {v0, v1, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v0, Ll/fps0;

    .line 46
    .line 47
    invoke-direct {v0, p1}, Ll/fps0;-><init>(Ll/wit0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, v0, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
