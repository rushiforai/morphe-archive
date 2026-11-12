.class public final Lstn;
.super Lrtn;
.source "SourceFile"


# instance fields
.field public c:Z

.field public d:Z

.field public e:Z

.field public final synthetic f:Lkotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lkotlin/jvm/functions/Function1;)V
    .registers 3

    iput-object p2, p0, Lstn;->f:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0, p1}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    return-void
.end method


# virtual methods
.method public final didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lstn;->c:Z

    iget-boolean p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    iput-boolean p1, p0, Lstn;->d:Z

    invoke-virtual {p0}, Lstn;->i()V

    return-void
.end method

.method public final didFirstVisuallyNonEmptyPaint()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lstn;->e:Z

    invoke-virtual {p0}, Lstn;->i()V

    return-void
.end method

.method public final i()V
    .registers 2

    iget-boolean v0, p0, Lstn;->d:Z

    if-nez v0, :cond_d

    iget-boolean v0, p0, Lstn;->c:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lstn;->e:Z

    if-nez v0, :cond_d

    :cond_c
    return-void

    :cond_d
    invoke-virtual {p0}, Lrtn;->g()V

    iget-boolean v0, p0, Lstn;->d:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object p0, p0, Lstn;->f:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
