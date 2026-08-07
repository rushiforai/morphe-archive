.class public Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljavax/swing/event/TreeWillExpandListener;


# instance fields
.field protected final actionCreator:Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;

.field protected final controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

.field protected final service:Lorg/fourthline/cling/model/meta/Service;

.field protected final treeModel:Ljavax/swing/tree/DefaultTreeModel;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->service:Lorg/fourthline/cling/model/meta/Service;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->treeModel:Ljavax/swing/tree/DefaultTreeModel;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->actionCreator:Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public treeWillCollapse(Ljavax/swing/event/TreeExpansionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/swing/tree/ExpandVetoException;
        }
    .end annotation

    return-void
.end method

.method public treeWillExpand(Ljavax/swing/event/TreeExpansionEvent;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/swing/tree/ExpandVetoException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljavax/swing/event/TreeExpansionEvent;->getPath()Ljavax/swing/tree/TreePath;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljavax/swing/tree/TreePath;->getLastPathComponent()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljavax/swing/tree/DefaultMutableTreeNode;->removeAllChildren()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->treeModel:Ljavax/swing/tree/DefaultTreeModel;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljavax/swing/tree/DefaultTreeModel;->nodeStructureChanged(Ljavax/swing/tree/TreeNode;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->actionCreator:Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;

    .line 20
    .line 21
    iget-object v1, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->service:Lorg/fourthline/cling/model/meta/Service;

    .line 22
    .line 23
    iget-object v2, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->treeModel:Ljavax/swing/tree/DefaultTreeModel;

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, p1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;->createContentBrowseActionCallback(Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)Lorg/fourthline/cling/controlpoint/ActionCallback;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;->controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Lorg/fourthline/cling/controlpoint/ControlPoint;->execute(Lorg/fourthline/cling/controlpoint/ActionCallback;)Ljava/util/concurrent/Future;

    .line 32
    .line 33
    .line 34
    return-void
.end method
