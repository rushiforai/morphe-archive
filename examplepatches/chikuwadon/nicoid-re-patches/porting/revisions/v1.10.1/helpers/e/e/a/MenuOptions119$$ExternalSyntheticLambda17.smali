.class public final synthetic Le/e/a/MenuOptions119$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/ListActions$Action;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ListActions$Action;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MenuOptions119$$ExternalSyntheticLambda17;->f$0:Le/e/a/ListActions$Action;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/MenuOptions119$$ExternalSyntheticLambda17;->f$0:Le/e/a/ListActions$Action;

    invoke-static {v0, p1}, Le/e/a/MenuOptions119;->lambda$2(Le/e/a/ListActions$Action;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
