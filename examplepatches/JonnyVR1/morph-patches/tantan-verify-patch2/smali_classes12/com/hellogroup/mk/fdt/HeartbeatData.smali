.class public final Lcom/hellogroup/mk/fdt/HeartbeatData;
.super Lcom/hellogroup/mk/fdt/BaseData;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002R \u0010\u0003\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R>\u0010\t\u001a\"\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000c\u0018\u00010\nj\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000c\u0018\u0001`\r8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/hellogroup/mk/fdt/HeartbeatData;",
        "Lcom/hellogroup/mk/fdt/BaseData;",
        "()V",
        "device",
        "Lcom/hellogroup/mk/fdt/DeviceData;",
        "getDevice",
        "()Lcom/hellogroup/mk/fdt/DeviceData;",
        "setDevice",
        "(Lcom/hellogroup/mk/fdt/DeviceData;)V",
        "pages",
        "Ljava/util/LinkedHashMap;",
        "",
        "Lcom/hellogroup/mk/fdt/PageData;",
        "Lkotlin/collections/LinkedHashMap;",
        "getPages",
        "()Ljava/util/LinkedHashMap;",
        "setPages",
        "(Ljava/util/LinkedHashMap;)V",
        "MKFDT_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field private device:Lcom/hellogroup/mk/fdt/DeviceData;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "device"
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private pages:Ljava/util/LinkedHashMap;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pages"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/hellogroup/mk/fdt/PageData;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/fdt/BaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final getDevice()Lcom/hellogroup/mk/fdt/DeviceData;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/fdt/HeartbeatData;->device:Lcom/hellogroup/mk/fdt/DeviceData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getPages()Ljava/util/LinkedHashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/hellogroup/mk/fdt/PageData;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/fdt/HeartbeatData;->pages:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setDevice(Lcom/hellogroup/mk/fdt/DeviceData;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/fdt/DeviceData;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/fdt/HeartbeatData;->device:Lcom/hellogroup/mk/fdt/DeviceData;

    .line 2
    .line 3
    return-void
.end method

.method public final setPages(Ljava/util/LinkedHashMap;)V
    .locals 0
    .param p1    # Ljava/util/LinkedHashMap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/hellogroup/mk/fdt/PageData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/fdt/HeartbeatData;->pages:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    return-void
.end method
