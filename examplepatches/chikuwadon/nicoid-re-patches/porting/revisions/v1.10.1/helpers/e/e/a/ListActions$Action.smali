.class final Le/e/a/ListActions$Action;
.super Ljava/lang/Object;
.source "ListActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ListActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Action"
.end annotation


# instance fields
.field final enabled:Z

.field final id:I

.field final order119:I

.field final run:Ljava/lang/Runnable;

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V
    .registers 4

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Landroid/view/MenuItem;->getOrder()I

    move-result v0

    iput v0, p0, Le/e/a/ListActions$Action;->order119:I

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-interface {p1}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v0

    iput-boolean v0, p0, Le/e/a/ListActions$Action;->enabled:Z

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iput p1, p0, Le/e/a/ListActions$Action;->id:I

    iput-object p2, p0, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    return-void
.end method
