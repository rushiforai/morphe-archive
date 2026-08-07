.class public Landroidx/fragment/app/d$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/d$b;->onAnimationEnd(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/fragment/app/d$b;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/d$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/d$b$a;->a:Landroidx/fragment/app/d$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/d$b$a;->a:Landroidx/fragment/app/d$b;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/fragment/app/d$b;->b:Landroidx/fragment/app/Fragment;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getAnimatingAway()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/fragment/app/d$b$a;->a:Landroidx/fragment/app/d$b;

    .line 12
    .line 13
    iget-object v0, v0, Landroidx/fragment/app/d$b;->b:Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setAnimatingAway(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Landroidx/fragment/app/d$b$a;->a:Landroidx/fragment/app/d$b;

    .line 20
    .line 21
    iget-object v0, p0, Landroidx/fragment/app/d$b;->c:Landroidx/fragment/app/l$g;

    .line 22
    .line 23
    iget-object v1, p0, Landroidx/fragment/app/d$b;->b:Landroidx/fragment/app/Fragment;

    .line 24
    .line 25
    iget-object p0, p0, Landroidx/fragment/app/d$b;->d:Ll/fg4;

    .line 26
    .line 27
    invoke-interface {v0, v1, p0}, Landroidx/fragment/app/l$g;->a(Landroidx/fragment/app/Fragment;Ll/fg4;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
