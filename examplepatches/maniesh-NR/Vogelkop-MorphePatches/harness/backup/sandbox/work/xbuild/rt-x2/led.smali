.class public abstract Lled;
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

    sput-object v0, Lled;->a:Lved;

    const/high16 v0, 0x42100000    # 36.0f

    sput v0, Lled;->b:F

    const/high16 v0, 0x42300000    # 44.0f

    sput v0, Lled;->c:F

    return-void
.end method
