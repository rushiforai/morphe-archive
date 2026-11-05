.class Le/e/a/DialogActions194$1;
.super Ljava/lang/Object;
.source "DialogActions194.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DialogActions194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 11
    .param p1, "v"    # Landroid/view/View;
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I
    .param p6, "ol"    # I
    .param p7, "ot"    # I
    .param p8, "or"    # I
    .param p9, "ob"    # I

    .line 9
    instance-of v0, p1, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_a

    move-object v0, p1

    check-cast v0, Landroid/widget/LinearLayout;

    # invokes: Le/e/a/DialogActions194;->fit(Landroid/widget/LinearLayout;)V
    invoke-static {v0}, Le/e/a/DialogActions194;->access$000(Landroid/widget/LinearLayout;)V

    :cond_a
    return-void
.end method
