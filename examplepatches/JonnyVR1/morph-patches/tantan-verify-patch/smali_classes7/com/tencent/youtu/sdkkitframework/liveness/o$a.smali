.class public Lcom/tencent/youtu/sdkkitframework/liveness/o$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/liveness/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F


# direct methods
.method public constructor <init>(I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    const v1, 0x3f333333    # 0.7f

    .line 6
    .line 7
    .line 8
    const v2, 0x3e99999a    # 0.3f

    .line 9
    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-eq p1, v0, :cond_3

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    if-eq p1, v0, :cond_2

    .line 16
    .line 17
    const/4 v0, 0x4

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    const/16 v0, 0xa

    .line 21
    .line 22
    const v1, 0x3f666666    # 0.9f

    .line 23
    .line 24
    .line 25
    if-eq p1, v0, :cond_0

    .line 26
    .line 27
    const p1, 0x3f733333    # 0.95f

    .line 28
    .line 29
    .line 30
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 31
    .line 32
    const v0, 0x3f4ccccd    # 0.8f

    .line 33
    .line 34
    .line 35
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 36
    .line 37
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 38
    .line 39
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 40
    .line 41
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 45
    .line 46
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 47
    .line 48
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 49
    .line 50
    const/high16 p1, 0x3f000000    # 0.5f

    .line 51
    .line 52
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 53
    .line 54
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 58
    .line 59
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 60
    .line 61
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 62
    .line 63
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 64
    .line 65
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 69
    .line 70
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 71
    .line 72
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 73
    .line 74
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 75
    .line 76
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 80
    .line 81
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 82
    .line 83
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 84
    .line 85
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 86
    .line 87
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 88
    .line 89
    return-void
.end method
