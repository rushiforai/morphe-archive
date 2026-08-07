.class public Ll/prd$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rae;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/prd;->r()Ll/rae;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/prd;


# direct methods
.method public constructor <init>(Ll/prd;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/prd$b;->b:Ll/prd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/prd$b;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(FF)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ll/prd$b;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/prd$b;->b:Ll/prd;

    .line 6
    .line 7
    iget-object v0, p1, Ll/prd;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    cmpl-float v1, p2, v1

    .line 14
    .line 15
    if-ltz v1, :cond_1

    .line 16
    .line 17
    invoke-static {p1}, Ll/prd;->m(Ll/prd;)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-float/2addr p1, p2

    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/prd$b;->b:Ll/prd;

    .line 26
    .line 27
    iget-object p1, p0, Ll/prd;->b:Landroid/view/View;

    .line 28
    .line 29
    invoke-static {p0}, Ll/prd;->l(Ll/prd;)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    sub-float/2addr p0, p2

    .line 34
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public c(FF)V
    .locals 0

    .line 1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/prd$b;->a:Z

    .line 3
    .line 4
    return-void
.end method
