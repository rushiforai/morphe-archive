.class public final Lnll;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li7f;

.field public final b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

.field public c:B


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lnll;->a:Li7f;

    const/4 v0, 0x0

    iput-byte v0, p0, Lnll;->c:B

    iput-object p1, p0, Lnll;->b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lnll;->b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v0, v0, Ln2d;->k:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x2

    iput-byte v0, p0, Lnll;->c:B

    new-instance v0, Lg7f;

    iget-object p0, p0, Lnll;->a:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_11
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loll;

    invoke-interface {v1}, Loll;->a()V

    goto :goto_11

    :cond_21
    invoke-virtual {p0}, Li7f;->clear()V

    return-void
.end method
