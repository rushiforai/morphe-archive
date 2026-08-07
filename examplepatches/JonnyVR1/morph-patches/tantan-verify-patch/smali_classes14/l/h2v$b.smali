.class public Ll/h2v$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h2v;->l(IILl/y20;Ll/y20;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/h2v;


# direct methods
.method public constructor <init>(Ll/h2v;Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h2v$b;->b:Ll/h2v;

    .line 2
    .line 3
    iput-object p2, p0, Ll/h2v$b;->a:Ll/y20;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h2v$b;->a:Ll/y20;

    .line 2
    .line 3
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
