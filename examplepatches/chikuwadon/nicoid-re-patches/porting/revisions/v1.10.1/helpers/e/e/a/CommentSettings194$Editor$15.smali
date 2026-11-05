.class Le/e/a/CommentSettings194$Editor$15;
.super Ljava/lang/Object;
.source "CommentSettings194.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings194$Editor;->select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/CommentSettings194$Editor;

.field private final synthetic val$choice:Le/e/a/CommentSettings194$Editor$Choice;


# direct methods
.method constructor <init>(Le/e/a/CommentSettings194$Editor;Le/e/a/CommentSettings194$Editor$Choice;)V
    .registers 3

    .line 361
    iput-object p1, p0, Le/e/a/CommentSettings194$Editor$15;->this$1:Le/e/a/CommentSettings194$Editor;

    iput-object p2, p0, Le/e/a/CommentSettings194$Editor$15;->val$choice:Le/e/a/CommentSettings194$Editor$Choice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 364
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor$15;->val$choice:Le/e/a/CommentSettings194$Editor$Choice;

    invoke-interface {p1, p3}, Le/e/a/CommentSettings194$Editor$Choice;->choose(I)V

    .line 365
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 369
    return-void
.end method
