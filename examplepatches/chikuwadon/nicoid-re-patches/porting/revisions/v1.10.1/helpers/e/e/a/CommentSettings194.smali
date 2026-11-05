.class public final Le/e/a/CommentSettings194;
.super Ljava/lang/Object;
.source "CommentSettings194.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentSettings194$Editor;,
        Le/e/a/CommentSettings194$Preview;,
        Le/e/a/CommentSettings194$SnapSeek;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .registers 2

    .line 38
    new-instance v0, Le/e/a/CommentSettings194$Editor;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings194$Editor;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0}, Le/e/a/CommentSettings194$Editor;->show()V

    .line 39
    return-void
.end method

.method static tr(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 42
    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
