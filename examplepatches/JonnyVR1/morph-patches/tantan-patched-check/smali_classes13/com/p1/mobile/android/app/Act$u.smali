.class public Lcom/p1/mobile/android/app/Act$u;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/Act;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "u"
.end annotation


# instance fields
.field public a:Landroid/hardware/Sensor;

.field public b:Landroid/hardware/SensorEventListener;

.field public c:[[F

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x3

    .line 9
    aput v2, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/16 v2, 0xa

    .line 13
    .line 14
    aput v2, v0, v1

    .line 15
    .line 16
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 17
    .line 18
    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, [[F

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act$u;->c:[[F

    .line 25
    .line 26
    iput v1, p0, Lcom/p1/mobile/android/app/Act$u;->d:I

    .line 27
    .line 28
    return-void
.end method

.method public synthetic constructor <init>(Ll/p20;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$u;-><init>()V

    return-void
.end method
