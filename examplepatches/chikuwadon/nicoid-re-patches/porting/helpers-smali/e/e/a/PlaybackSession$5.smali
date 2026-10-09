.class public final synthetic Le/e/a/PlaybackSession$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaybackSession;"
    method = "lambda$styleDialog$0"
    proto = "(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/ListView;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/widget/AbsListView$OnScrollListener;

.field public final synthetic f$1:Landroid/widget/ListView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/ListView;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaybackSession$5;->f$0:Landroid/widget/AbsListView$OnScrollListener;

    iput-object p2, p0, Le/e/a/PlaybackSession$5;->f$1:Landroid/widget/ListView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/PlaybackSession$5;->f$0:Landroid/widget/AbsListView$OnScrollListener;

    iget-object v1, p0, Le/e/a/PlaybackSession$5;->f$1:Landroid/widget/ListView;

    invoke-static {v0, v1}, Le/e/a/PlaybackSession;->lambda$styleDialog$0(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/ListView;)V

    return-void
.end method
