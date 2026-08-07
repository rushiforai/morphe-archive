.class public Lcom/p1/mobile/putong/core/ui/a$c;
.super Ll/wpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/a;->e()Ll/syf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:F

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/a;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/a$c;->b:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/a$c;->a:F

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wpf0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ll/syf0;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/syf0;->d()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    double-to-float p1, v0

    .line 6
    const/high16 v0, 0x3f000000    # 0.5f

    .line 7
    .line 8
    cmpg-float v1, p1, v0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/a$c;->b:Lcom/p1/mobile/putong/core/ui/a;

    .line 11
    .line 12
    const/high16 v3, 0x40000000    # 2.0f

    .line 13
    .line 14
    if-gez v1, :cond_0

    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/a$c;->a:F

    .line 17
    .line 18
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/a;->b(Lcom/p1/mobile/putong/core/ui/a;)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    div-float/2addr v1, v3

    .line 23
    sub-float v1, v0, v1

    .line 24
    .line 25
    mul-float/2addr v1, p1

    .line 26
    mul-float/2addr v1, v3

    .line 27
    sub-float/2addr v0, v1

    .line 28
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/core/ui/a;->d(Lcom/p1/mobile/putong/core/ui/a;F)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/a;->b(Lcom/p1/mobile/putong/core/ui/a;)F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    div-float/2addr v1, v3

    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/a$c;->b:Lcom/p1/mobile/putong/core/ui/a;

    .line 38
    .line 39
    iget v5, v4, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 40
    .line 41
    invoke-static {v4}, Lcom/p1/mobile/putong/core/ui/a;->b(Lcom/p1/mobile/putong/core/ui/a;)F

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    sub-float/2addr v5, v4

    .line 46
    div-float/2addr v5, v3

    .line 47
    sub-float/2addr p1, v0

    .line 48
    mul-float/2addr v5, p1

    .line 49
    mul-float/2addr v5, v3

    .line 50
    add-float/2addr v1, v5

    .line 51
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/core/ui/a;->d(Lcom/p1/mobile/putong/core/ui/a;F)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/a$c;->b:Lcom/p1/mobile/putong/core/ui/a;

    .line 55
    .line 56
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/a;->c(Lcom/p1/mobile/putong/core/ui/a;)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public d(Ll/syf0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/syf0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
