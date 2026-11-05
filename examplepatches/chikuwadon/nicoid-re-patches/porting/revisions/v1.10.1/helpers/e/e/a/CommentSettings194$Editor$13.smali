.class Le/e/a/CommentSettings194$Editor$13;
.super Ljava/lang/Object;
.source "CommentSettings194.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/CommentSettings194$Editor;

.field private final synthetic val$runnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Le/e/a/CommentSettings194$Editor;Ljava/lang/Runnable;)V
    .registers 3

    .line 309
    iput-object p1, p0, Le/e/a/CommentSettings194$Editor$13;->this$1:Le/e/a/CommentSettings194$Editor;

    iput-object p2, p0, Le/e/a/CommentSettings194$Editor$13;->val$runnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    .line 312
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor$13;->val$runnable:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 313
    return-void
.end method
