.class public abstract Ljed;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lved;

.field public static final b:F

.field public static final c:F

.field public static final d:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lved;->a:Lved;

    sput-object v0, Ljed;->a:Lved;

    const/high16 v0, 0x42640000    # 57.0f

    sput v0, Ljed;->b:F

    const/high16 v0, 0x42800000    # 64.0f

    sput v0, Ljed;->c:F

    const v0, -0x44704791    # -0.004386f

    sput v0, Ljed;->d:F

    return-void
.end method
