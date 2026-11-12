.class public final Lp92;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:F

.field public final c:I

.field public final d:I

.field public final e:Z


# direct methods
.method public constructor <init>(ZFIIZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lp92;->a:Z

    iput p2, p0, Lp92;->b:F

    iput p3, p0, Lp92;->c:I

    iput p4, p0, Lp92;->d:I

    iput-boolean p5, p0, Lp92;->e:Z

    return-void
.end method

.method public static a(Landroid/content/res/Resources;)Lp92;
    .registers 7

    new-instance v0, Lp92;

    const v1, 0x7f0705cd

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    const v1, 0x7f0705d0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lp92;-><init>(ZFIIZ)V

    return-object v0
.end method
