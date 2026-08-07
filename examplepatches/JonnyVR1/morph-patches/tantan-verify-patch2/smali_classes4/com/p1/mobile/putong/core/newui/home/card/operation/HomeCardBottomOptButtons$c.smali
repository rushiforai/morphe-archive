.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:F

.field public e:F

.field public f:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    return-void
.end method

.method public constructor <init>(IIFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->b:I

    .line 7
    .line 8
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->d:F

    .line 9
    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->c:F

    .line 11
    .line 12
    iput p5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->e:F

    .line 13
    .line 14
    const/high16 p1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/y5l;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->a:I

    .line 2
    .line 3
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->a:I

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->b:I

    .line 6
    .line 7
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->b:I

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->c:F

    .line 10
    .line 11
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->c:F

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->d:F

    .line 14
    .line 15
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->d:F

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->e:F

    .line 18
    .line 19
    iput v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->e:F

    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    .line 22
    .line 23
    iput p0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    .line 24
    .line 25
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;)Z
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->b:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->b:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->a:I

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->a:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->c:F

    .line 14
    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->c:F

    .line 16
    .line 17
    cmpl-float v0, v0, v1

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->d:F

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->d:F

    .line 24
    .line 25
    cmpl-float v0, v0, v1

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    .line 32
    .line 33
    cmpl-float v0, v0, v1

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->e:F

    .line 38
    .line 39
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->e:F

    .line 40
    .line 41
    cmpl-float p0, p1, p0

    .line 42
    .line 43
    if-nez p0, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public c(IIFFFF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->a:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->b:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->c:F

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->d:F

    .line 8
    .line 9
    iput p5, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->e:F

    .line 10
    .line 11
    iput p6, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$c;->f:F

    .line 12
    .line 13
    return-void
.end method
