.class public final Le/e/a/CommentSettings193;
.super Ljava/lang/Object;
.source "CommentSettings193.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentSettings193$Editor;,
        Le/e/a/CommentSettings193$Preview;,
        Le/e/a/CommentSettings193$SnapSeek;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .registers 2

    .line 5
    new-instance v0, Le/e/a/CommentSettings193$Editor;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings193$Editor;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0}, Le/e/a/CommentSettings193$Editor;->show()V

    return-void
.end method
