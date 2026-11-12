.class public abstract Lged;
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

    sput-object v0, Lged;->a:Lved;

    const/high16 v0, 0x41800000    # 16.0f

    sput v0, Lged;->b:F

    const/high16 v0, 0x41c00000    # 24.0f

    sput v0, Lged;->c:F

    const/high16 v0, 0x3d000000    # 0.03125f

    sput v0, Lged;->d:F

    return-void
.end method
