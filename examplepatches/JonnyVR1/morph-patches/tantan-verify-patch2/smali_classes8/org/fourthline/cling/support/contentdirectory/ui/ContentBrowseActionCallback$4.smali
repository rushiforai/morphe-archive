.class Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;->updateStatus(Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;

.field final synthetic val$status:Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback$4;->this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback$4;->val$status:Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback$4;->this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback$4;->val$status:Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;

    .line 4
    .line 5
    iget-object v1, v0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;->treeNode:Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 6
    .line 7
    iget-object v2, v0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;->treeModel:Ljavax/swing/tree/DefaultTreeModel;

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1, v2}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;->updateStatusUI(Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;Ljavax/swing/tree/DefaultMutableTreeNode;Ljavax/swing/tree/DefaultTreeModel;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
