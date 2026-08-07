.class public Lcom/p1/mobile/android/app/Act$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Act;->lmdCreate(Ljava/lang/String;Landroid/hardware/Sensor;)Lcom/p1/mobile/android/app/Act$u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act$u;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act$u;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$h;->a:Lcom/p1/mobile/android/app/Act$u;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$h;->a:Lcom/p1/mobile/android/app/Act$u;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/android/app/Act$u;->d:I

    .line 4
    .line 5
    const/16 v2, 0xa

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    iget-object p0, v0, Lcom/p1/mobile/android/app/Act$u;->c:[[F

    .line 11
    .line 12
    aget-object p0, p0, v1

    .line 13
    .line 14
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 15
    .line 16
    aget v2, p1, v3

    .line 17
    .line 18
    aput v2, p0, v3

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    aget v3, p1, v2

    .line 22
    .line 23
    aput v3, p0, v2

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    aget p1, p1, v3

    .line 27
    .line 28
    aput p1, p0, v3

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    iput v1, v0, Lcom/p1/mobile/android/app/Act$u;->d:I

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->C1()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->lmdEnd()Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$h;->a:Lcom/p1/mobile/android/app/Act$u;

    .line 45
    .line 46
    iput v3, p0, Lcom/p1/mobile/android/app/Act$u;->d:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    new-instance p1, Ljava/lang/Exception;

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v1, "Act lmdCreate exception:"

    .line 55
    .line 56
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
