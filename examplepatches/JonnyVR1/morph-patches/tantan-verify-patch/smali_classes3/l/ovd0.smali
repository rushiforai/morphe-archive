.class public abstract Ll/ovd0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/bn5;->getAuthData()Ll/gxd0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/ixd0;->c()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ovd0$a;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ovd0$a;-><init>(Ll/ovd0;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/ovd0$b;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/ovd0$b;-><init>(Ll/ovd0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public abstract a(Ljava/lang/String;)V
.end method
