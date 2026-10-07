.class Le/e/a/ThemeChoice$ThemedSpinner$1;
.super Landroid/database/DataSetObserver;
.source "ThemeChoice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ThemeChoice$ThemedSpinner;-><init>(Landroid/widget/SpinnerAdapter;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/ThemeChoice$ThemedSpinner;


# direct methods
.method constructor <init>(Le/e/a/ThemeChoice$ThemedSpinner;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 118
    iput-object p1, p0, Le/e/a/ThemeChoice$ThemedSpinner$1;->this$0:Le/e/a/ThemeChoice$ThemedSpinner;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .line 118
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner$1;->this$0:Le/e/a/ThemeChoice$ThemedSpinner;

    invoke-virtual {v0}, Le/e/a/ThemeChoice$ThemedSpinner;->notifyDataSetChanged()V

    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .line 118
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner$1;->this$0:Le/e/a/ThemeChoice$ThemedSpinner;

    invoke-virtual {v0}, Le/e/a/ThemeChoice$ThemedSpinner;->notifyDataSetInvalidated()V

    return-void
.end method
