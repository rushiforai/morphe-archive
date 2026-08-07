.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:J

.field public d:J

.field public e:F

.field public f:F

.field public final synthetic g:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->g:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->a:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->b:Z

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->c:J

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d:J

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->e:F

    .line 19
    .line 20
    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->f:F

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Ll/xy;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->e:F

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->f:F

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->e:F

    return-void
.end method


# virtual methods
.method public d()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->c:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public e()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-float v0, v0

    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->f:F

    .line 7
    .line 8
    mul-float/2addr v0, p0

    .line 9
    return v0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public i(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d:J

    .line 2
    .line 3
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public k(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public l(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->c:J

    .line 2
    .line 3
    return-void
.end method
