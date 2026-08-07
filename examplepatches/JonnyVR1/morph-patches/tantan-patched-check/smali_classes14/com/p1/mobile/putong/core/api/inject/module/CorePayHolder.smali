.class public Lcom/p1/mobile/putong/core/api/inject/module/CorePayHolder;
.super Ll/jq2;
.source "SourceFile"


# instance fields
.field public payModule:Lcom/tantanapp/putong/module/Module;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/pay_module/module"
        required = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jq2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public g()Lcom/tantanapp/putong/module/Module;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/module/CorePayHolder;->payModule:Lcom/tantanapp/putong/module/Module;

    .line 2
    .line 3
    return-object p0
.end method
