.class public final synthetic Ll/jzd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/login/DeviceAuthDialog;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/login/DeviceAuthDialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jzd;->a:Lcom/facebook/login/DeviceAuthDialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jzd;->a:Lcom/facebook/login/DeviceAuthDialog;

    invoke-static {p0}, Lcom/facebook/login/DeviceAuthDialog;->V3(Lcom/facebook/login/DeviceAuthDialog;)V

    return-void
.end method
