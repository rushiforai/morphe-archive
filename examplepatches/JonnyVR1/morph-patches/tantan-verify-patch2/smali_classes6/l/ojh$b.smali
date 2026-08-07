.class public Ll/ojh$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ojh;->r(ILl/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:I

.field public final synthetic c:Ll/ojh;


# direct methods
.method public constructor <init>(Ll/ojh;Ll/y20;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ojh$b;->c:Ll/ojh;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ojh$b;->a:Ll/y20;

    .line 4
    .line 5
    iput p3, p0, Ll/ojh$b;->b:I

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
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ojh$b;->a:Ll/y20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ojh$b;->a:Ll/y20;

    .line 10
    .line 11
    iget p0, p0, Ll/ojh$b;->b:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
