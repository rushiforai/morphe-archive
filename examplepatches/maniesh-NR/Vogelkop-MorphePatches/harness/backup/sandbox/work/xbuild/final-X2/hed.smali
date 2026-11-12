.class public abstract Lhed;
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

    sput-object v0, Lhed;->a:Lved;

    const/high16 v0, 0x41600000    # 14.0f

    sput v0, Lhed;->b:F

    const/high16 v0, 0x41a00000    # 20.0f

    sput v0, Lhed;->c:F

    const v0, 0x3c9248d8    # 0.017857f

    sput v0, Lhed;->d:F

    return-void
.end method
