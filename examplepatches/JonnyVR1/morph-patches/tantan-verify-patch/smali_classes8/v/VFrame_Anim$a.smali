.class public Lv/VFrame_Anim$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VFrame_Anim;->E(Landroid/view/View;Ll/qcj;Ll/qcj;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Z

.field public final synthetic c:Lv/VFrame_Anim;


# direct methods
.method public constructor <init>(Lv/VFrame_Anim;Landroid/view/View;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VFrame_Anim$a;->c:Lv/VFrame_Anim;

    .line 2
    .line 3
    iput-object p2, p0, Lv/VFrame_Anim$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-boolean p3, p0, Lv/VFrame_Anim$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lv/VFrame_Anim$a;->a:Landroid/view/View;

    .line 2
    .line 3
    iget-object v0, p0, Lv/VFrame_Anim$a;->c:Lv/VFrame_Anim;

    .line 4
    .line 5
    iget-object v0, v0, Lv/VFrame_Anim;->a:Landroid/view/View;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-boolean p0, p0, Lv/VFrame_Anim$a;->b:Z

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/16 p0, 0x8

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, 0x4

    .line 19
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
