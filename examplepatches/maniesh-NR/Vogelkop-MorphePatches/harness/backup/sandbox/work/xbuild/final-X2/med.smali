.class public abstract Lmed;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lved;

.field public static final b:F

.field public static final c:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lved;->a:Lved;

    sput-object v0, Lmed;->a:Lved;

    const/high16 v0, 0x42000000    # 32.0f

    sput v0, Lmed;->b:F

    const/high16 v0, 0x42200000    # 40.0f

    sput v0, Lmed;->c:F

    return-void
.end method
