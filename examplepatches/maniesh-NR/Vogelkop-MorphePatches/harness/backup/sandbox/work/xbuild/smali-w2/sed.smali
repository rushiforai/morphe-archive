.class public abstract Lsed;
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

    sput-object v0, Lsed;->a:Lved;

    const/high16 v0, 0x41b00000    # 22.0f

    sput v0, Lsed;->b:F

    const/high16 v0, 0x41e00000    # 28.0f

    sput v0, Lsed;->c:F

    return-void
.end method
