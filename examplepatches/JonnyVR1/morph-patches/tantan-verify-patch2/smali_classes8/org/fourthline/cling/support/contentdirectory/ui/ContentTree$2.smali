.class Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$2;
.super Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->createContentBrowseActionCallback(Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)Lorg/fourthline/cling/controlpoint/ActionCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$2;->this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallback;-><init>(Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public failureUI(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$2;->this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->failure(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateStatusUI(Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;Ljavax/swing/tree/DefaultMutableTreeNode;Ljavax/swing/tree/DefaultTreeModel;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$2;->this$0:Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->updateStatus(Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;Ljavax/swing/tree/DefaultMutableTreeNode;Ljavax/swing/tree/DefaultTreeModel;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
