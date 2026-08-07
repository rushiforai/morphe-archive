.class public Lcom/p1/mobile/putong/core/api/inject/module/CoreMemberHolder$$Injecter$$Autowired;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/ISyringe;


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
.method public inject(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/api/inject/module/CoreMemberHolder;

    .line 2
    .line 3
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "/member_module/module"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/tantanapp/putong/module/Module;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/module/CoreMemberHolder;->memberModule:Lcom/tantanapp/putong/module/Module;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-class p0, Lcom/p1/mobile/putong/core/api/inject/module/CoreMemberHolder;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "!"

    .line 31
    .line 32
    const-string v0, "The field \'memberModule\' is null, in class \'"

    .line 33
    .line 34
    invoke-static {v0, p0, p1}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
