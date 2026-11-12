.class public abstract Lped;
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

    sput-object v0, Lped;->a:Lved;

    const/high16 v0, 0x41600000    # 14.0f

    sput v0, Lped;->b:F

    const/high16 v0, 0x41a00000    # 20.0f

    sput v0, Lped;->c:F

    const v0, 0x3bea0fd4    # 0.007143f

    sput v0, Lped;->d:F

    return-void
.end method
