.class public Lcom/p1/mobile/putong/core/ui/view/a$a;
.super Ll/wpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/view/a;->m()Ll/syf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/view/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/a$a;->a:Lcom/p1/mobile/putong/core/ui/view/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wpf0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(Ll/syf0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/a$a;->a:Lcom/p1/mobile/putong/core/ui/view/a;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/view/a;->c:F

    .line 4
    .line 5
    const/high16 v2, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float v3, v1, v2

    .line 8
    .line 9
    float-to-double v3, v3

    .line 10
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/view/a;->d:F

    .line 11
    .line 12
    sub-float/2addr v5, v1

    .line 13
    div-float/2addr v5, v2

    .line 14
    float-to-double v1, v5

    .line 15
    invoke-virtual {p1}, Ll/syf0;->d()D

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    mul-double/2addr v1, v5

    .line 20
    add-double/2addr v3, v1

    .line 21
    double-to-float p1, v3

    .line 22
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/view/a;->d(Lcom/p1/mobile/putong/core/ui/view/a;F)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/a$a;->a:Lcom/p1/mobile/putong/core/ui/view/a;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/view/a;->c(Lcom/p1/mobile/putong/core/ui/view/a;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 32
    .line 33
    .line 34
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
