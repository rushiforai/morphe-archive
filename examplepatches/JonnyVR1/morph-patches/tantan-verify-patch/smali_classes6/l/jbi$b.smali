.class public Ll/jbi$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jbi;->v1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jbi;


# direct methods
.method public constructor <init>(Ll/jbi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbi$b;->a:Ll/jbi;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jbi$b;->a:Ll/jbi;

    .line 5
    .line 6
    iget-object p1, p1, Ll/jbi;->U0:Lv/VImage;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/jbi$b;->a:Ll/jbi;

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    invoke-static {p1, v0}, Ll/jbi;->I0(Ll/jbi;I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/jbi$b;->a:Ll/jbi;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/jbi;->G0(Ll/jbi;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
