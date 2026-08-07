.class public final synthetic Ll/aut0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cut0;

.field public final synthetic b:Ljava/lang/Throwable;

.field public final synthetic c:Ll/yew0;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/cut0;Ljava/lang/Throwable;Ll/yew0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aut0;->a:Ll/cut0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/aut0;->b:Ljava/lang/Throwable;

    .line 7
    .line 8
    iput-object p3, p0, Ll/aut0;->c:Ll/yew0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/aut0;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->T9:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/aut0;->a:Ll/cut0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/aut0;->b:Ljava/lang/Throwable;

    .line 20
    .line 21
    const-string v3, "AttributionReporting.registerSourceAndPingClickUrl"

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, v1, Ll/cut0;->c:Ll/dut0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/dut0;->a(Ll/dut0;)Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-static {v4}, Ll/w2t0;->e(Landroid/content/Context;)Ll/y2t0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    iput-object v4, v0, Ll/dut0;->i:Ll/y2t0;

    .line 36
    .line 37
    iget-object v0, v1, Ll/cut0;->c:Ll/dut0;

    .line 38
    .line 39
    iget-object v0, v0, Ll/dut0;->i:Ll/y2t0;

    .line 40
    .line 41
    invoke-interface {v0, v2, v3}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v0, v1, Ll/cut0;->c:Ll/dut0;

    .line 46
    .line 47
    invoke-static {v0}, Ll/dut0;->a(Ll/dut0;)Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {v4}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iput-object v4, v0, Ll/dut0;->h:Ll/y2t0;

    .line 56
    .line 57
    iget-object v0, v1, Ll/cut0;->c:Ll/dut0;

    .line 58
    .line 59
    iget-object v0, v0, Ll/dut0;->h:Ll/y2t0;

    .line 60
    .line 61
    invoke-interface {v0, v2, v3}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object v0, p0, Ll/aut0;->d:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p0, p0, Ll/aut0;->c:Ll/yew0;

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {p0, v0, v1}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
