.class public Lcom/ss/android/ttvecamera/TEFocusSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/TEFocusSettings$c;,
        Lcom/ss/android/ttvecamera/TEFocusSettings$b;,
        Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;
    }
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field private final c:I

.field private final d:I

.field private final e:F

.field private f:J

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

.field private l:Lcom/ss/android/ttvecamera/TEFocusSettings$b;


# direct methods
.method public constructor <init>(IIIIF)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->g:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->h:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->i:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->j:Z

    .line 13
    .line 14
    sget-object v0, Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;->VIEW:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->k:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 17
    .line 18
    new-instance v0, Lcom/ss/android/ttvecamera/TEFocusSettings$c;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {v0, v1}, Lcom/ss/android/ttvecamera/TEFocusSettings$c;-><init>(Lcom/ss/android/ttvecamera/TEFocusSettings$a;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->l:Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 25
    .line 26
    iput p1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->a:I

    .line 27
    .line 28
    iput p2, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->b:I

    .line 29
    .line 30
    iput p3, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->c:I

    .line 31
    .line 32
    iput p4, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->d:I

    .line 33
    .line 34
    iput p5, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->e:F

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a(IZ)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public b(IZ)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public c()Ll/m6m;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d()Ll/n6m;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->k:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->l:Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->f:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-int p0, v0

    .line 9
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->f:J

    .line 6
    .line 7
    return-void
.end method

.method public r(Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->k:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 2
    .line 3
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TEFocusSettings{width ="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", height ="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", x ="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->c:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", y ="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->d:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", need focus ="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->g:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", need meter ="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->h:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", lock ="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->i:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", from user="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->j:Z

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", CoordinatesMode"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TEFocusSettings;->k:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const/16 p0, 0x7d

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method
