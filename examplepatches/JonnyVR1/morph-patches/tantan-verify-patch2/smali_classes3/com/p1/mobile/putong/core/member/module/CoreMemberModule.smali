.class public Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreMemberModule"
    path = "/member_module/module"
.end annotation


# static fields
.field public static a:Ll/us9;

.field public static b:Ll/ws9;

.field public static c:Ll/ss9;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ws9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ws9;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->b:Ll/ws9;

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

.method public static F()Ll/ss9;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->c:Ll/ss9;

    .line 2
    .line 3
    return-object v0
.end method

.method private H()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->m:Ll/wr2;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->b:Ll/ws9;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/wr2;->a(Ll/wr2$a;)V

    .line 6
    .line 7
    .line 8
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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->H()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/us9;

    .line 5
    .line 6
    invoke-direct {p0}, Ll/us9;-><init>()V

    .line 7
    .line 8
    .line 9
    sput-object p0, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->a:Ll/us9;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/us9;->a()V

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

    .line 1
    invoke-static {}, Ll/ss9;->a()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sput-object p0, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->c:Ll/ss9;

    .line 6
    .line 7
    return-void
.end method

.method public ms()V
    .locals 0

    .line 1
    return-void
.end method

.method public tr(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/r97;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, ""

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    const-string v2, "entry"

    .line 33
    .line 34
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/enb;->a4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
