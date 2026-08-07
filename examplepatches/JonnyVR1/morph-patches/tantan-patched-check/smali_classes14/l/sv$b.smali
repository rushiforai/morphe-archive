.class public Ll/sv$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sv;->o()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sv;


# direct methods
.method public constructor <init>(Ll/sv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sv$b;->a:Ll/sv;

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
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sv$b;->a:Ll/sv;

    .line 2
    .line 3
    invoke-static {p1}, Ll/sv;->k(Ll/sv;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/sv$b;->a:Ll/sv;

    .line 11
    .line 12
    invoke-static {p0}, Ll/sv;->l(Ll/sv;)F

    .line 13
    .line 14
    .line 15
    return-void
.end method
