.class public Lv/fresco/subscaleview/SubsamplingScaleImageView$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/fresco/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:Landroid/graphics/PointF;

.field public d:Landroid/graphics/PointF;

.field public e:Landroid/graphics/PointF;

.field public f:Landroid/graphics/PointF;

.field public g:Landroid/graphics/PointF;

.field public h:J

.field public i:Z

.field public j:I

.field public k:I

.field public l:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1f4

    .line 5
    .line 6
    iput-wide v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->h:J

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->i:Z

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    iput v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->j:I

    .line 13
    .line 14
    iput v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->k:I

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->l:J

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Ll/acg0;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->h:J

    return-wide v0
.end method

.method public static bridge synthetic b(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->j:I

    return p0
.end method

.method public static bridge synthetic c(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->i:Z

    return p0
.end method

.method public static bridge synthetic d(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Lv/fresco/subscaleview/SubsamplingScaleImageView$g;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic e(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->k:I

    return p0
.end method

.method public static bridge synthetic f(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->d:Landroid/graphics/PointF;

    return-object p0
.end method

.method public static bridge synthetic g(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->e:Landroid/graphics/PointF;

    return-object p0
.end method

.method public static bridge synthetic h(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->c:Landroid/graphics/PointF;

    return-object p0
.end method

.method public static bridge synthetic i(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)F
    .locals 0

    .line 1
    iget p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->b:F

    return p0
.end method

.method public static bridge synthetic j(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)F
    .locals 0

    .line 1
    iget p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->a:F

    return p0
.end method

.method public static bridge synthetic k(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->l:J

    return-wide v0
.end method

.method public static bridge synthetic l(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->g:Landroid/graphics/PointF;

    return-object p0
.end method

.method public static bridge synthetic m(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->f:Landroid/graphics/PointF;

    return-object p0
.end method

.method public static bridge synthetic n(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->h:J

    return-void
.end method

.method public static bridge synthetic o(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->j:I

    return-void
.end method

.method public static bridge synthetic p(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->i:Z

    return-void
.end method

.method public static bridge synthetic q(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Lv/fresco/subscaleview/SubsamplingScaleImageView$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public static bridge synthetic r(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->k:I

    return-void
.end method

.method public static bridge synthetic s(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->d:Landroid/graphics/PointF;

    return-void
.end method

.method public static bridge synthetic t(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->e:Landroid/graphics/PointF;

    return-void
.end method

.method public static bridge synthetic u(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->c:Landroid/graphics/PointF;

    return-void
.end method

.method public static bridge synthetic v(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->b:F

    return-void
.end method

.method public static bridge synthetic w(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->a:F

    return-void
.end method

.method public static bridge synthetic x(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->l:J

    return-void
.end method

.method public static bridge synthetic y(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->g:Landroid/graphics/PointF;

    return-void
.end method

.method public static bridge synthetic z(Lv/fresco/subscaleview/SubsamplingScaleImageView$c;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$c;->f:Landroid/graphics/PointF;

    return-void
.end method
