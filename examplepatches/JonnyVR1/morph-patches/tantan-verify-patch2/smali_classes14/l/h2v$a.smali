.class public Ll/h2v$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h2v;->w(IILl/y20;Ll/y20;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:I

.field public final synthetic c:Ll/y20;

.field public final synthetic d:Ll/h2v;


# direct methods
.method public constructor <init>(Ll/h2v;Ll/y20;ILl/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h2v$a;->d:Ll/h2v;

    .line 2
    .line 3
    iput-object p2, p0, Ll/h2v$a;->a:Ll/y20;

    .line 4
    .line 5
    iput p3, p0, Ll/h2v$a;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Ll/h2v$a;->c:Ll/y20;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/h2v$a;->a:Ll/y20;

    .line 2
    .line 3
    iget v0, p0, Ll/h2v$a;->b:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/h2v$a;->c:Ll/y20;

    .line 13
    .line 14
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
