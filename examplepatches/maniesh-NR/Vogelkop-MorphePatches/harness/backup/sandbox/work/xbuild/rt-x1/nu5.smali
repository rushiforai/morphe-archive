.class public final Lnu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final e:[F


# instance fields
.field public final a:Lcom/opera/android/custom_views/OperaIntroView;

.field public final b:Landroid/os/Handler;

.field public c:I

.field public d:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x6

    new-array v0, v0, [F

    fill-array-data v0, :array_a

    sput-object v0, Lnu5;->e:[F

    return-void

    nop

    :array_a
    .array-data 4
        0x3ecccccd    # 0.4f
        0x3e19999a    # 0.15f
        0x3dcccccd    # 0.1f
        0x3d4ccccd    # 0.05f
        0x3d4ccccd    # 0.05f
        0x3c23d70a    # 0.01f
    .end array-data
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/OperaIntroView;Landroid/os/Handler;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnu5;->a:Lcom/opera/android/custom_views/OperaIntroView;

    iput-object p2, p0, Lnu5;->b:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-object v0, p0, Lnu5;->a:Lcom/opera/android/custom_views/OperaIntroView;

    invoke-virtual {v0}, Lcom/opera/android/custom_views/OperaIntroView;->B()F

    move-result v1

    iget v2, p0, Lnu5;->d:F

    cmpl-float v3, v1, v2

    if-ltz v3, :cond_d

    return-void

    :cond_d
    iget v3, p0, Lnu5;->c:I

    const/4 v4, 0x6

    sget-object v5, Lnu5;->e:[F

    if-ge v3, v4, :cond_17

    aget v4, v5, v3

    goto :goto_1a

    :cond_17
    const/4 v4, 0x5

    aget v4, v5, v4

    :goto_1a
    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lnu5;->c:I

    add-float/2addr v1, v4

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/custom_views/OperaIntroView;->E(FI)V

    iget-object v0, p0, Lnu5;->b:Landroid/os/Handler;

    const-wide/16 v1, 0x7d0

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
