.class public Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreInnovationModule"
    path = "/innovation_module/module"
.end annotation


# static fields
.field public static a:Ll/k49;

.field public static b:Ll/wr2;

.field public static c:Ll/l49;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/l49;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l49;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;->c:Ll/l49;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;->b:Ll/wr2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 6
    .line 7
    sput-object p0, Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;->b:Ll/wr2;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;->c:Ll/l49;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/wr2;->a(Ll/wr2$a;)V

    .line 12
    .line 13
    .line 14
    :cond_0
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

.method public Qh()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;->F()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/k49;

    .line 5
    .line 6
    invoke-direct {p0}, Ll/k49;-><init>()V

    .line 7
    .line 8
    .line 9
    sput-object p0, Lcom/p1/mobile/putong/core/innovation/module/CoreInnovationModule;->a:Ll/k49;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k49;->a()V

    .line 12
    .line 13
    .line 14
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
    return-void
.end method

.method public tr(Z)V
    .locals 0

    .line 1
    return-void
.end method
