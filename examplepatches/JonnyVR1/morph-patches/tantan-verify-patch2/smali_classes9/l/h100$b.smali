.class public Ll/h100$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h100;->e0(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/h100;


# direct methods
.method public constructor <init>(Ll/h100;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h100$b;->c:Ll/h100;

    .line 2
    .line 3
    iput-object p2, p0, Ll/h100$b;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p3, p0, Ll/h100$b;->b:Ljava/lang/String;

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

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/h100$b;->c:Ll/h100;

    .line 2
    .line 3
    invoke-static {p1}, Ll/h100;->A(Ll/h100;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/h100$b;->c:Ll/h100;

    .line 7
    .line 8
    invoke-static {p1}, Ll/h100;->s(Ll/h100;)Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/h100$b;->c:Ll/h100;

    .line 13
    .line 14
    iget-object v1, v1, Ll/h100;->g:Lv/VImage;

    .line 15
    .line 16
    iget-object v2, p0, Ll/h100$b;->a:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1, v2}, Ll/h100;->f0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/h100$b;->c:Ll/h100;

    .line 22
    .line 23
    iget-object v0, p0, Ll/h100$b;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/h100;->z(Ll/h100;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/h100$b;->c:Ll/h100;

    .line 29
    .line 30
    invoke-static {p1}, Ll/h100;->x(Ll/h100;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/h100$b;->c:Ll/h100;

    .line 34
    .line 35
    invoke-static {p0}, Ll/h100;->w(Ll/h100;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
