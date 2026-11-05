.class Le/e/a/CommentSettings194$Editor$18;
.super Ljava/lang/Object;
.source "CommentSettings194.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings194$Editor;->slider(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/CommentSettings194$Editor;

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Le/e/a/CommentSettings194$Editor;I)V
    .registers 3

    .line 490
    iput-object p1, p0, Le/e/a/CommentSettings194$Editor$18;->this$1:Le/e/a/CommentSettings194$Editor;

    iput p2, p0, Le/e/a/CommentSettings194$Editor$18;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 493
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor$18;->this$1:Le/e/a/CommentSettings194$Editor;

    iget v1, p0, Le/e/a/CommentSettings194$Editor$18;->val$i:I

    invoke-virtual {v0, v1}, Le/e/a/CommentSettings194$Editor;->m39lambda$15$eeaCommentSettings194$Editor(I)V

    .line 494
    return-void
.end method
