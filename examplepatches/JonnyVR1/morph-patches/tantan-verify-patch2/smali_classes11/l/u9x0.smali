.class public final Ll/u9x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kxw0;


# instance fields
.field public final a:Ll/sxw0;

.field public final b:Ll/oax0;

.field public final c:Ll/oax0;


# direct methods
.method public synthetic constructor <init>(Ll/sxw0;Ll/t9x0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u9x0;->a:Ll/sxw0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/sxw0;->f()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/b6x0;->a()Ll/b6x0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Ll/b6x0;->b()Ll/pax0;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p1}, Ll/u5x0;->a(Ll/sxw0;)Ll/yax0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "compute"

    .line 25
    .line 26
    const-string v1, "mac"

    .line 27
    .line 28
    invoke-interface {p2, p1, v1, v0}, Ll/pax0;->a(Ll/yax0;Ljava/lang/String;Ljava/lang/String;)Ll/oax0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/u9x0;->b:Ll/oax0;

    .line 33
    .line 34
    const-string v0, "verify"

    .line 35
    .line 36
    invoke-interface {p2, p1, v1, v0}, Ll/pax0;->a(Ll/yax0;Ljava/lang/String;Ljava/lang/String;)Ll/oax0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :goto_0
    iput-object p1, p0, Ll/u9x0;->c:Ll/oax0;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget-object p1, Ll/u5x0;->a:Ll/oax0;

    .line 44
    .line 45
    iput-object p1, p0, Ll/u9x0;->b:Ll/oax0;

    .line 46
    .line 47
    goto :goto_0
.end method
