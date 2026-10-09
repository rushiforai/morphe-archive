.class Le/e/a/AccountPage$1;
.super Ljava/lang/Object;
.source "AccountPage.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/AccountPage;->load(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$task:Le/e/a/NetworkTask;


# direct methods
.method constructor <init>(Le/e/a/NetworkTask;)V
    .registers 2

    .line 11
    iput-object p1, p0, Le/e/a/AccountPage$1;->val$task:Le/e/a/NetworkTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 11
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 11
    iget-object p1, p0, Le/e/a/AccountPage$1;->val$task:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    return-void
.end method
