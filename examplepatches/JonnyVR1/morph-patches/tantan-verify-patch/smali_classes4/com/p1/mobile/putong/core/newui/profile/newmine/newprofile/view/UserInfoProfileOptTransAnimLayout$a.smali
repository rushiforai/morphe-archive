.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->g(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->d(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$c;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    :goto_0
    invoke-interface {v1, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$c;->b(FZ)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-lez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-lez v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 63
    .line 64
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    sub-int/2addr v2, p0

    .line 69
    int-to-float p0, v2

    .line 70
    mul-float/2addr p0, p1

    .line 71
    float-to-int p0, p0

    .line 72
    add-int/2addr v1, p0

    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method
