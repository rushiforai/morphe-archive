.class Lcom/flipboard/bottomsheet/BottomSheetLayout$b;
.super Lcom/flipboard/bottomsheet/BottomSheetLayout$h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flipboard/bottomsheet/BottomSheetLayout;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic b:Lcom/flipboard/bottomsheet/BottomSheetLayout;


# direct methods
.method public constructor <init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$b;->b:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout$h;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$h;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$b;->b:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
