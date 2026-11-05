.class Le/e/a/LocalPlaylists$Page$1;
.super Ljava/lang/Object;
.source "LocalPlaylists.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/LocalPlaylists$Page;->render()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/LocalPlaylists$Page;


# direct methods
.method constructor <init>(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 41
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$1;->this$1:Le/e/a/LocalPlaylists$Page;

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

    .line 41
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$1;->this$1:Le/e/a/LocalPlaylists$Page;

    iget p1, p1, Le/e/a/LocalPlaylists$Page;->sort:I

    if-eq p1, p3, :cond_f

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$1;->this$1:Le/e/a/LocalPlaylists$Page;

    iput p3, p1, Le/e/a/LocalPlaylists$Page;->sort:I

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$1;->this$1:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {p1}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_f
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

    .line 41
    return-void
.end method
