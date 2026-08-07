.class public final Ll/vat0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;I)Ll/hpr;
    .locals 2

    .line 1
    new-instance p2, Ll/tct0;

    .line 2
    .line 3
    invoke-direct {p2}, Ll/tct0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/obt0;->v(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 16
    .line 17
    new-instance v1, Ll/uat0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1, p2}, Ll/uat0;-><init>(Ll/vat0;Landroid/content/Context;Ll/tct0;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object p2
.end method
