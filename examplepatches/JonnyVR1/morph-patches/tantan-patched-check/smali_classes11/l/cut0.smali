.class public final Ll/cut0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/yew0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/dut0;


# direct methods
.method public constructor <init>(Ll/dut0;Ll/yew0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/cut0;->a:Ll/yew0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/cut0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/cut0;->c:Ll/dut0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cut0;->c:Ll/dut0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/dut0;->e(Ll/dut0;)Ll/xvw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/aut0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/cut0;->a:Ll/yew0;

    .line 10
    .line 11
    iget-object v3, p0, Ll/cut0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, v2, v3}, Ll/aut0;-><init>(Ll/cut0;Ljava/lang/Throwable;Ll/yew0;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cut0;->c:Ll/dut0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cut0;->a:Ll/yew0;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/dut0;->e(Ll/dut0;)Ll/xvw0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/but0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/but0;-><init>(Ll/yew0;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 17
    .line 18
    .line 19
    return-void
.end method
