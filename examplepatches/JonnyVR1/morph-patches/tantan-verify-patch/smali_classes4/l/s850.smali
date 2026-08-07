.class public final synthetic Ll/s850;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s850;->a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s850;->a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    invoke-static {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->b(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    return-void
.end method
