.class public final synthetic Ll/t850;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t850;->a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;

    return-void
.end method


# virtual methods
.method public final onResult(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t850;->a:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;

    invoke-static {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->a(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;I)V

    return-void
.end method
