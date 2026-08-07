.class public final synthetic Ll/fif0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Landroid/animation/Animator;

.field public final synthetic c:Landroid/animation/Animator;

.field public final synthetic d:Landroid/animation/Animator;

.field public final synthetic e:Landroid/animation/Animator;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fif0;->a:Ll/zif0;

    iput-object p2, p0, Ll/fif0;->b:Landroid/animation/Animator;

    iput-object p3, p0, Ll/fif0;->c:Landroid/animation/Animator;

    iput-object p4, p0, Ll/fif0;->d:Landroid/animation/Animator;

    iput-object p5, p0, Ll/fif0;->e:Landroid/animation/Animator;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fif0;->a:Ll/zif0;

    iget-object v1, p0, Ll/fif0;->b:Landroid/animation/Animator;

    iget-object v2, p0, Ll/fif0;->c:Landroid/animation/Animator;

    iget-object v3, p0, Ll/fif0;->d:Landroid/animation/Animator;

    iget-object p0, p0, Ll/fif0;->e:Landroid/animation/Animator;

    invoke-static {v0, v1, v2, v3, p0}, Ll/zif0;->R(Ll/zif0;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/Animator;)V

    return-void
.end method
