.class public Ll/cmi$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cmi;->F(ZZZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z

.field public final synthetic c:Ll/cmi;


# direct methods
.method public constructor <init>(Ll/cmi;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cmi$c;->c:Ll/cmi;

    .line 2
    .line 3
    iput p2, p0, Ll/cmi$c;->a:I

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/cmi$c;->b:Z

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
    .locals 2

    .line 1
    iget-object p1, p0, Ll/cmi$c;->c:Ll/cmi;

    .line 2
    .line 3
    iget v0, p0, Ll/cmi$c;->a:I

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/cmi$c;->b:Z

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Ll/cmi;->l(Ll/cmi;IZ)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cmi$c;->c:Ll/cmi;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/cmi;->j(Ll/cmi;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
