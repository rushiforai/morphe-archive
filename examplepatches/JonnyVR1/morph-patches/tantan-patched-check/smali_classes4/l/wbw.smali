.class public final synthetic Ll/wbw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fcw;

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Landroid/animation/ValueAnimator;


# direct methods
.method public synthetic constructor <init>(Ll/fcw;Ljava/util/Set;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wbw;->a:Ll/fcw;

    iput-object p2, p0, Ll/wbw;->b:Ljava/util/Set;

    iput-object p3, p0, Ll/wbw;->c:Landroid/animation/ValueAnimator;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wbw;->a:Ll/fcw;

    iget-object v1, p0, Ll/wbw;->b:Ljava/util/Set;

    iget-object p0, p0, Ll/wbw;->c:Landroid/animation/ValueAnimator;

    invoke-static {v0, v1, p0, p1}, Ll/fcw;->G(Ll/fcw;Ljava/util/Set;Landroid/animation/ValueAnimator;Landroid/view/View;)V

    return-void
.end method
