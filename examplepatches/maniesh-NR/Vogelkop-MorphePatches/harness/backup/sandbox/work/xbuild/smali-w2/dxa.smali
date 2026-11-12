.class public final Ldxa;
.super Lixa;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/PointF;

.field public final b:Z


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/PointF;I)V
    .registers 3

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_5

    const/4 p1, 0x0

    :cond_5
    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Ldxa;-><init>(Landroid/graphics/PointF;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/PointF;Z)V
    .registers 3

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Ldxa;->a:Landroid/graphics/PointF;

    iput-boolean p2, p0, Ldxa;->b:Z

    return-void
.end method
