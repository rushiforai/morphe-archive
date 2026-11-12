.class public final synthetic Li3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcll;


# instance fields
.field public final synthetic a:Lj3b;

.field public final synthetic b:Ll2b;


# direct methods
.method public synthetic constructor <init>(Lj3b;Ll2b;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li3b;->a:Lj3b;

    iput-object p2, p0, Li3b;->b:Ll2b;

    return-void
.end method


# virtual methods
.method public final K()V
    .registers 5

    iget-object v0, p0, Li3b;->a:Lj3b;

    iget-object v1, v0, Lj3b;->b:Lor2;

    iget-object v1, v1, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v2, v1, Ln2d;->d:Lf3d;

    iget-object v2, v2, Lf3d;->b:Lp3d;

    invoke-virtual {v2}, Lp3d;->b()F

    move-result v2

    iget v0, v0, Lj3b;->c:I

    const/4 v3, 0x0

    iget-object p0, p0, Li3b;->b:Ll2b;

    invoke-static {v0, p0, v3}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v1, p0}, Ln2d;->j(I)V

    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    const/4 p0, 0x1

    invoke-virtual {v1, v2, p0}, Ln2d;->o(FZ)V

    return-void
.end method
