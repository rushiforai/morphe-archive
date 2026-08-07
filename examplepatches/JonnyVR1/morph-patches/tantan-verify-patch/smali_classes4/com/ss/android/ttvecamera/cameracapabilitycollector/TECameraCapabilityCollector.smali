.class public Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;,
        Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;,
        Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;,
        Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;
    }
.end annotation


# static fields
.field public static final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;",
            ">;"
        }
    .end annotation
.end field

.field private b:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;

.field private c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->d:Ljava/util/Map;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->DEPTH_OUTPUT:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->MANUAL_3A:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    const/16 v1, 0xb

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->LOGICAL_MULTI_CAMERA:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 36
    .line 37
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->c:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;)Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->b:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;->a(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;)Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a:Ljava/util/List;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a:Ljava/util/List;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->b:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iput-object p1, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->b:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;

    .line 21
    .line 22
    :cond_1
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->c:Z

    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->b:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;->b(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
