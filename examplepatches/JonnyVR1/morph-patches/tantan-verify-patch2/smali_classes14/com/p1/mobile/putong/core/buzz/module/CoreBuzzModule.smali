.class public Lcom/p1/mobile/putong/core/buzz/module/CoreBuzzModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreBuzzModule"
    path = "/buzz_module/module"
.end annotation


# static fields
.field public static a:Ll/bb7;


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
.method public Jh()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->Q0()V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public Qh()V
    .locals 0

    .line 1
    new-instance p0, Ll/bb7;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/bb7;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object p0, Lcom/p1/mobile/putong/core/buzz/module/CoreBuzzModule;->a:Ll/bb7;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/bb7;->c()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public ft()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public ms()V
    .locals 0

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->O0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public tr(Z)V
    .locals 0

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->b0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
