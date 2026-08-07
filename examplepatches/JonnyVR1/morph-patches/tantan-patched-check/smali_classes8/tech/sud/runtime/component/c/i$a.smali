.class Ltech/sud/runtime/component/c/i$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Landroid/hardware/Sensor;

.field private b:Landroid/hardware/SensorEventListener;

.field private c:I


# direct methods
.method private constructor <init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2, p3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ltech/sud/runtime/component/c/i$a;->a:Landroid/hardware/Sensor;

    .line 9
    .line 10
    new-instance p2, Ltech/sud/runtime/component/c/i$b;

    .line 11
    .line 12
    invoke-direct {p2, p1}, Ltech/sud/runtime/component/c/i$b;-><init>(Ltech/sud/runtime/core/b;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Ltech/sud/runtime/component/c/i$a;->b:Landroid/hardware/SensorEventListener;

    .line 16
    .line 17
    iput p4, p0, Ltech/sud/runtime/component/c/i$a;->c:I

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;III)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p2, p3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p2

    iput-object p2, p0, Ltech/sud/runtime/component/c/i$a;->a:Landroid/hardware/Sensor;

    .line 24
    new-instance p2, Ltech/sud/runtime/component/c/i$b;

    invoke-direct {p2, p1, p5}, Ltech/sud/runtime/component/c/i$b;-><init>(Ltech/sud/runtime/core/b;I)V

    iput-object p2, p0, Ltech/sud/runtime/component/c/i$a;->b:Landroid/hardware/SensorEventListener;

    .line 25
    iput p4, p0, Ltech/sud/runtime/component/c/i$a;->c:I

    return-void
.end method

.method public synthetic constructor <init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;IIILtech/sud/runtime/component/c/i$1;)V
    .locals 0

    .line 21
    invoke-direct/range {p0 .. p5}, Ltech/sud/runtime/component/c/i$a;-><init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;III)V

    return-void
.end method

.method public synthetic constructor <init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;IILtech/sud/runtime/component/c/i$1;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Ltech/sud/runtime/component/c/i$a;-><init>(Ltech/sud/runtime/core/b;Landroid/hardware/SensorManager;II)V

    return-void
.end method

.method private a(Landroid/hardware/SensorManager;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/i$a;->b:Landroid/hardware/SensorEventListener;

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/runtime/component/c/i$a;->a:Landroid/hardware/Sensor;

    .line 4
    .line 5
    iget p0, p0, Ltech/sud/runtime/component/c/i$a;->c:I

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, p0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/c/i$a;->b(Landroid/hardware/SensorManager;)V

    return-void
.end method

.method private b(Landroid/hardware/SensorManager;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/i$a;->b:Landroid/hardware/SensorEventListener;

    .line 2
    .line 3
    iget-object p0, p0, Ltech/sud/runtime/component/c/i$a;->a:Landroid/hardware/Sensor;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ltech/sud/runtime/component/c/i$a;Landroid/hardware/SensorManager;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/c/i$a;->a(Landroid/hardware/SensorManager;)V

    return-void
.end method
