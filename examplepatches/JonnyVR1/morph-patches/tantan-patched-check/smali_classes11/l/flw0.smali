.class public abstract Ll/flw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field public final a:Ll/vkw0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/alw0;->a()Ll/alw0;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/xkw0;->a()Ll/xkw0;

    .line 8
    .line 9
    .line 10
    sget-object p1, Ll/xkw0;->a:Ll/vkw0;

    .line 11
    .line 12
    iput-object p1, p0, Ll/flw0;->a:Ll/vkw0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/hardware/SensorEvent;)V
.end method

.method public final onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/flw0;->a(Landroid/hardware/SensorEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
