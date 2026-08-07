.class public Ll/rfq0$c$a$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rfq0$c$a;->onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rfq0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/rfq0$c$a;


# direct methods
.method public constructor <init>(Ll/rfq0$c$a;Ll/rfq0;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rfq0$c$a$b;->c:Ll/rfq0$c$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rfq0$c$a$b;->a:Ll/rfq0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/rfq0$c$a$b;->b:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/rfq0$c$a$b;->a:Ll/rfq0;

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/rfq0;->d(F)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/rfq0$c$a$b;->b:Landroid/view/View;

    .line 9
    .line 10
    iget-object p0, p0, Ll/rfq0$c$a$b;->a:Ll/rfq0;

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/rfq0$c;->h(Landroid/view/View;Ll/rfq0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
