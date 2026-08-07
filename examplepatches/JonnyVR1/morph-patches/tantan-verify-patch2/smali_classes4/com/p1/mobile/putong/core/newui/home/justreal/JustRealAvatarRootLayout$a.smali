.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:I

.field public g:I

.field public h:F

.field public i:F

.field public j:F

.field public k:J

.field public l:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->b:F

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->c:F

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->d:F

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->e:F

    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->i:F

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->j:F

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarItem;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->i:F

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->b:F

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->d:F

    .line 8
    .line 9
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->b:F

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->c:F

    .line 9
    .line 10
    return-void
.end method

.method public c()V
    .locals 6

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->j:F

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 6
    .line 7
    const/high16 v1, 0x41800000    # 16.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    mul-int/2addr v0, v1

    .line 14
    int-to-float v0, v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->e:F

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->a()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->g:I

    .line 25
    .line 26
    int-to-long v2, v2

    .line 27
    const-wide/16 v4, 0x14

    .line 28
    .line 29
    mul-long/2addr v2, v4

    .line 30
    add-long/2addr v0, v2

    .line 31
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->k:J

    .line 32
    .line 33
    const-wide/16 v2, 0x12c

    .line 34
    .line 35
    add-long/2addr v0, v2

    .line 36
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->l:J

    .line 37
    .line 38
    return-void
.end method

.method public d(FF)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->i:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->j:F

    .line 4
    .line 5
    sub-float/2addr v1, v0

    .line 6
    mul-float/2addr v1, p2

    .line 7
    const/high16 v2, 0x3fc00000    # 1.5f

    .line 8
    .line 9
    mul-float/2addr v1, v2

    .line 10
    add-float/2addr v0, v1

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->h:F

    .line 23
    .line 24
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->d:F

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->e:F

    .line 27
    .line 28
    sub-float v2, v1, v0

    .line 29
    .line 30
    mul-float/2addr v2, p1

    .line 31
    add-float/2addr v2, v0

    .line 32
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->b:F

    .line 33
    .line 34
    sub-float/2addr v1, v0

    .line 35
    mul-float/2addr v1, p2

    .line 36
    add-float/2addr v0, v1

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout$a;->c:F

    .line 38
    .line 39
    return-void
.end method
