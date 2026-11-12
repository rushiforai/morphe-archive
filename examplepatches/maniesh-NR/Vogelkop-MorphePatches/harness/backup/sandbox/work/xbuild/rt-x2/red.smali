.class public abstract Lred;
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

    sput-object v0, Lred;->a:Lved;

    const/high16 v0, 0x41300000    # 11.0f

    sput v0, Lred;->b:F

    const/high16 v0, 0x41800000    # 16.0f

    sput v0, Lred;->c:F

    const v0, 0x3d3a2f06

    sput v0, Lred;->d:F

    return-void
.end method
