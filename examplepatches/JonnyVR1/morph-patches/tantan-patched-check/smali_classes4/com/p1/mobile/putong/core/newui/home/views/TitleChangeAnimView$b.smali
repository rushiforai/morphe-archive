.class public Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:F

.field public h:F

.field public i:F

.field public j:I

.field public k:I

.field public l:I

.field public m:Z

.field public final synthetic n:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->n:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 p1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->g:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->h:F

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->i:F

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->m:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->b:I

    .line 4
    .line 5
    mul-int/2addr v1, p1

    .line 6
    div-int/lit8 v1, v1, 0x64

    .line 7
    .line 8
    add-int/2addr v0, v1

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->c:I

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d:I

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->e:I

    .line 14
    .line 15
    mul-int/2addr v1, p1

    .line 16
    div-int/lit8 v1, v1, 0x64

    .line 17
    .line 18
    add-int/2addr v0, v1

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->f:I

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->m:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->n:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->j:I

    .line 28
    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->k:I

    .line 30
    .line 31
    add-int/2addr v2, v1

    .line 32
    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a(Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;III)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->l:I

    .line 37
    .line 38
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->g:F

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->h:F

    .line 41
    .line 42
    int-to-float p1, p1

    .line 43
    mul-float/2addr v1, p1

    .line 44
    const/high16 p1, 0x42c80000    # 100.0f

    .line 45
    .line 46
    div-float/2addr v1, p1

    .line 47
    add-float/2addr v0, v1

    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->i:F

    .line 49
    .line 50
    return-void
.end method

.method public b(FF)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->g:F

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->h:F

    .line 4
    .line 5
    return-object p0
.end method

.method public c(IIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->m:Z

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d:I

    .line 9
    .line 10
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->e:I

    .line 11
    .line 12
    return-object p0
.end method

.method public d(IIIIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->m:Z

    .line 3
    .line 4
    iput p5, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->j:I

    .line 5
    .line 6
    iput p6, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->k:I

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a:I

    .line 9
    .line 10
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->b:I

    .line 11
    .line 12
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d:I

    .line 13
    .line 14
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->e:I

    .line 15
    .line 16
    return-object p0
.end method
