.class public final synthetic Ll/q850;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q850;->a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q850;->a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    invoke-static {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->a(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;)V

    return-void
.end method
