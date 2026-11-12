.class public abstract Lqed;
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

    sget-object v0, Lved;->b:Lved;

    sput-object v0, Lqed;->a:Lved;

    const/high16 v0, 0x41400000    # 12.0f

    sput v0, Lqed;->b:F

    const/high16 v0, 0x41800000    # 16.0f

    sput v0, Lqed;->c:F

    const v0, 0x3d2aab04    # 0.041667f

    sput v0, Lqed;->d:F

    return-void
.end method
