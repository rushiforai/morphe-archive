.class public abstract Lned;
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

    sput-object v0, Lned;->a:Lved;

    const/high16 v0, 0x41e00000    # 28.0f

    sput v0, Lned;->b:F

    const/high16 v0, 0x42100000    # 36.0f

    sput v0, Lned;->c:F

    return-void
.end method
