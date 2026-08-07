.class public abstract Lcom/ss/android/ttvecamera/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/c$c;,
        Lcom/ss/android/ttvecamera/c$f;,
        Lcom/ss/android/ttvecamera/c$e;,
        Lcom/ss/android/ttvecamera/c$d;,
        Lcom/ss/android/ttvecamera/c$b;,
        Lcom/ss/android/ttvecamera/c$a;
    }
.end annotation


# instance fields
.field public a:Z

.field protected b:Lcom/ss/android/ttvecamera/TECameraSettings;

.field protected c:Z

.field protected d:Lcom/ss/android/ttvecamera/c$a;

.field protected e:Landroid/os/Handler;

.field protected f:Landroid/content/Context;

.field protected g:Ll/jrh0;

.field protected h:I

.field protected i:I

.field protected j:I

.field protected k:I

.field protected l:F

.field protected m:I

.field protected n:Lcom/ss/android/ttvecamera/c$d;

.field protected o:Lcom/ss/android/ttvecamera/c$e;

.field protected p:Lcom/ss/android/ttvecamera/c$b;

.field private q:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected r:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field protected s:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field protected t:Lcom/bytedance/bpea/basics/Cert;

.field protected u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

.field public v:Lorg/json/JSONObject;

.field protected w:Z

.field public x:Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 11
    .line 12
    iput v1, p0, Lcom/ss/android/ttvecamera/c;->k:I

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/ss/android/ttvecamera/c;->p:Lcom/ss/android/ttvecamera/c$b;

    .line 20
    .line 21
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    invoke-direct {v2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lcom/ss/android/ttvecamera/c;->q:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 27
    .line 28
    new-instance v2, Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 34
    .line 35
    new-instance v2, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/ss/android/ttvecamera/c;->s:Ljava/util/Map;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 43
    .line 44
    new-instance v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 45
    .line 46
    invoke-direct {v2}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 50
    .line 51
    new-instance v2, Lorg/json/JSONObject;

    .line 52
    .line 53
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->w:Z

    .line 59
    .line 60
    iput-object v1, p0, Lcom/ss/android/ttvecamera/c;->x:Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 63
    .line 64
    iput-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 65
    .line 66
    iput-object p3, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 67
    .line 68
    iput-object p4, p0, Lcom/ss/android/ttvecamera/c;->n:Lcom/ss/android/ttvecamera/c$d;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 71
    .line 72
    new-instance p1, Lcom/ss/android/ttvecamera/cameracapabilitycollector/a;

    .line 73
    .line 74
    invoke-direct {p1}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/a;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->c(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$b;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public A()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract A0(Lcom/ss/android/ttvecamera/TECameraSettings$p;)V
.end method

.method public B()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    return p0
.end method

.method public abstract B0(I)V
.end method

.method public abstract C()I
.end method

.method public abstract C0(I)V
.end method

.method public D()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->q:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->C()I

    .line 11
    .line 12
    .line 13
    :cond_0
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 14
    .line 15
    return p0
.end method

.method public abstract D0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V
.end method

.method public E()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract E0(Lcom/ss/android/ttvecamera/TECameraSettings$l;)V
.end method

.method public F()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    return p0
.end method

.method public abstract F0(Z)V
.end method

.method public G()[I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    filled-new-array {p0, p0}, [I

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public G0(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H()F
    .locals 0

    .line 1
    const/high16 p0, -0x40800000    # -1.0f

    return p0
.end method

.method public abstract H0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
.end method

.method public I()[I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 4
    .line 5
    iget v0, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 8
    .line 9
    filled-new-array {v0, p0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public J()[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public K()Ll/jrh0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public M()[J
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [J

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    return-object p0

    .line 8
    nop

    .line 9
    :array_0
    .array-data 8
        -0x1
        -0x1
    .end array-data
.end method

.method public N()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "TECameraBase"

    .line 2
    .line 3
    const-string v0, "getSupportedPictureSizes error"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public O()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "TECameraBase"

    .line 2
    .line 3
    const-string v0, "getSupportedPreviewSizes error"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public P()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract Q()Z
.end method

.method public R()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public S()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->v0:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/c;->w:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public abstract T()Z
.end method

.method public U()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public abstract V()Z
.end method

.method public W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 0

    .line 1
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->w:I

    .line 2
    .line 3
    iput p1, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string p2, "set start preview retry count: "

    .line 8
    .line 9
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "TECameraBase"

    .line 22
    .line 23
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public X(Lcom/ss/android/ttvecamera/TECameraSettings$j;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Y(Lcom/ss/android/ttvecamera/TECameraFrame;)Lcom/ss/android/ttvecamera/TECameraFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->x:Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;->processAlgorithm(Lcom/ss/android/ttvecamera/TECameraFrame;)Lcom/ss/android/ttvecamera/TECameraFrame;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public abstract Z(Lcom/ss/android/ttvecamera/TECameraSettings$n;)V
.end method

.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract a0(Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)V
.end method

.method public b(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b0(Lcom/ss/android/ttvecamera/c$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->p:Lcom/ss/android/ttvecamera/c$b;

    .line 2
    .line 3
    return-void
.end method

.method public abstract c()V
.end method

.method public c0(Lcom/ss/android/ttvecamera/c$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/hj3;Lcom/ss/android/ttvecamera/TECameraSettings$c;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "unsupport capture burst, camera type:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->v()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p2, p1}, Lcom/ss/android/ttvecamera/TECameraSettings$c;->a(Ljava/lang/Exception;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public d0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public e(ILcom/ss/android/ttvecamera/c$c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public f(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 0

    .line 1
    const-string p0, "TECameraBase"

    .line 2
    .line 3
    const-string p1, "close..."

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f0(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract g0(Z)V
.end method

.method public h(Ljava/lang/Exception;I)Ljava/lang/Exception;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "Exception message"

    .line 8
    .line 9
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, ", errorCode="

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object p1
.end method

.method public h0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->x:Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;->destroy()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/c;->k:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->q:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public abstract j()V
.end method

.method public abstract j0(I)Z
.end method

.method public k(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l()Landroid/os/Bundle;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/os/Bundle;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :goto_0
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 43
    .line 44
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 45
    .line 46
    const-string v1, "facing"

    .line 47
    .line 48
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-object v0
.end method

.method public l0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract m(Lcom/ss/android/ttvecamera/TEFocusSettings;)V
.end method

.method public m0(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n0(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public o()[F
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    return-object p0

    .line 8
    nop

    .line 9
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public o0()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract p(FLcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
.end method

.method public p0(Ll/jrh0;)V
    .locals 0
    .param p1    # Ll/jrh0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 2
    .line 3
    return-void
.end method

.method public q()Lorg/json/JSONObject;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public q0(Lcom/ss/android/ttvecamera/c$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public r()[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public r0(I)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "scene mode: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "TECameraBase"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public s()Lcom/ss/android/ttvecamera/TECameraSettings$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 4
    .line 5
    return-object p0
.end method

.method public s0(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()Lcom/ss/android/ttvecamera/c$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract t0(ZLjava/lang/String;)V
.end method

.method public u()Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract u0()V
.end method

.method public abstract v()I
.end method

.method public v0()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    return p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public abstract w0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
.end method

.method public abstract x()[F
.end method

.method public abstract x0()V
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public y0()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    return p0
.end method

.method public z(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/os/Bundle;

    .line 8
    .line 9
    return-object p0
.end method

.method public z0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 3
    .line 4
    return-void
.end method
