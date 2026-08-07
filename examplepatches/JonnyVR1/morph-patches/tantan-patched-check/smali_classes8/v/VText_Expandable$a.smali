.class public Lv/VText_Expandable$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VText_Expandable;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VText_Expandable;


# direct methods
.method public constructor <init>(Lv/VText_Expandable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, v0}, Lv/VText_Expandable;->e(Lv/VText_Expandable;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 13
    .line 14
    invoke-static {p1}, Lv/VText_Expandable;->d(Lv/VText_Expandable;)Lv/VText_Expandable$c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 21
    .line 22
    invoke-static {p1}, Lv/VText_Expandable;->d(Lv/VText_Expandable;)Lv/VText_Expandable$c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 27
    .line 28
    iget-object v0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 29
    .line 30
    invoke-static {p0}, Lv/VText_Expandable;->c(Lv/VText_Expandable;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    xor-int/lit8 p0, p0, 0x1

    .line 35
    .line 36
    invoke-interface {p1, v0, p0}, Lv/VText_Expandable$c;->a(Landroid/widget/TextView;Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VText_Expandable$a;->a:Lv/VText_Expandable;

    .line 2
    .line 3
    iget-object p1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 4
    .line 5
    invoke-static {p0}, Lv/VText_Expandable;->b(Lv/VText_Expandable;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p1, p0}, Lv/VText_Expandable;->g(Landroid/view/View;F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
