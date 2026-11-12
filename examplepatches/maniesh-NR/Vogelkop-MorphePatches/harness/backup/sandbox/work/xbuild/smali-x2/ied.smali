.class public abstract Lied;
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

    sput-object v0, Lied;->a:Lved;

    const/high16 v0, 0x41400000    # 12.0f

    sput v0, Lied;->b:F

    const/high16 v0, 0x41800000    # 16.0f

    sput v0, Lied;->c:F

    const v0, 0x3d08882f    # 0.033333f

    sput v0, Lied;->d:F

    return-void
.end method
