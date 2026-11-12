.class public abstract Lked;
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

    sput-object v0, Lked;->a:Lved;

    const/high16 v0, 0x42340000    # 45.0f

    sput v0, Lked;->b:F

    const/high16 v0, 0x42500000    # 52.0f

    sput v0, Lked;->c:F

    return-void
.end method
