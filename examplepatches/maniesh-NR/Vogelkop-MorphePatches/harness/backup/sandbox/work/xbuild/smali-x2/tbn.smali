.class public final synthetic Ltbn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lykj;
.implements Lrll;


# instance fields
.field public final synthetic a:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;)V
    .registers 2

    iput-object p1, p0, Ltbn;->a:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getValue()Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Ltbn;->a:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0402dc

    const v1, 0x7f06063b

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    const v2, 0x7f0402e3

    invoke-static {v2, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Ltbn;->a:Lxbf;

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Lwbn;

    iget p0, p0, Lwbn;->b:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method
