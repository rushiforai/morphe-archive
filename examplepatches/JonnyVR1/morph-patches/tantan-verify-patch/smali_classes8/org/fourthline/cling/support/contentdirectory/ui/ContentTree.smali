.class public abstract Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;
.super Ljavax/swing/JTree;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;


# instance fields
.field protected rootContainer:Lorg/fourthline/cling/support/model/container/Container;

.field protected rootNode:Ljavax/swing/tree/DefaultMutableTreeNode;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljavax/swing/JTree;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljavax/swing/JTree;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->init(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public createContainerTreeCellRenderer()Ljavax/swing/tree/DefaultTreeCellRenderer;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createContainerTreeExpandListener(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;)Ljavax/swing/event/TreeWillExpandListener;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeExpandListener;-><init>(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Lorg/fourthline/cling/support/contentdirectory/ui/ContentBrowseActionCallbackCreator;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public createContentBrowseActionCallback(Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)Lorg/fourthline/cling/controlpoint/ActionCallback;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$2;-><init>(Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public createRootContainer(Lorg/fourthline/cling/model/meta/Service;)Lorg/fourthline/cling/support/model/container/Container;
    .locals 2

    .line 1
    new-instance p0, Lorg/fourthline/cling/support/model/container/Container;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/support/model/container/Container;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "0"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->setId(Ljava/lang/String;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "Content Directory on "

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/Service;->getDevice()Lorg/fourthline/cling/model/meta/Device;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/Device;->getDisplayString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/DIDLObject;->setTitle(Ljava/lang/String;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public abstract failure(Ljava/lang/String;)V
.end method

.method public getRootContainer()Lorg/fourthline/cling/support/model/container/Container;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->rootContainer:Lorg/fourthline/cling/support/model/container/Container;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRootNode()Ljavax/swing/tree/DefaultMutableTreeNode;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->rootNode:Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSelectedNode()Ljavax/swing/tree/DefaultMutableTreeNode;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->getLastSelectedPathComponent()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 6
    .line 7
    return-object p0
.end method

.method public init(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->createRootContainer(Lorg/fourthline/cling/model/meta/Service;)Lorg/fourthline/cling/support/model/container/Container;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->rootContainer:Lorg/fourthline/cling/support/model/container/Container;

    .line 6
    .line 7
    new-instance v0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$1;

    .line 8
    .line 9
    iget-object v1, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->rootContainer:Lorg/fourthline/cling/support/model/container/Container;

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$1;-><init>(Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->rootNode:Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 15
    .line 16
    new-instance v0, Ljavax/swing/tree/DefaultTreeModel;

    .line 17
    .line 18
    iget-object v1, p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->rootNode:Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljavax/swing/tree/DefaultTreeModel;-><init>(Ljavax/swing/tree/TreeNode;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->setModel(Ljavax/swing/tree/TreeModel;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->getSelectionModel()Ljavax/swing/tree/TreeSelectionModel;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-interface {v1, v2}, Ljavax/swing/tree/TreeSelectionModel;->setSelectionMode(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1, p2, v0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->createContainerTreeExpandListener(Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;)Ljavax/swing/event/TreeWillExpandListener;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->addTreeWillExpandListener(Ljavax/swing/event/TreeWillExpandListener;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->createContainerTreeCellRenderer()Ljavax/swing/tree/DefaultTreeCellRenderer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->setCellRenderer(Ljavax/swing/tree/TreeCellRenderer;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->getRootNode()Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0, p2, v0, v1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree;->createContentBrowseActionCallback(Lorg/fourthline/cling/model/meta/Service;Ljavax/swing/tree/DefaultTreeModel;Ljavax/swing/tree/DefaultMutableTreeNode;)Lorg/fourthline/cling/controlpoint/ActionCallback;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p1, p0}, Lorg/fourthline/cling/controlpoint/ControlPoint;->execute(Lorg/fourthline/cling/controlpoint/ActionCallback;)Ljava/util/concurrent/Future;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public updateStatus(Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;Ljavax/swing/tree/DefaultMutableTreeNode;Ljavax/swing/tree/DefaultTreeModel;)V
    .locals 1

    .line 1
    sget-object p0, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTree$3;->$SwitchMap$org$fourthline$cling$support$contentdirectory$callback$Browse$Status:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->removeAllChildren()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getChildCount()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-gtz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getChildCount()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    :goto_0
    new-instance v0, Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 32
    .line 33
    invoke-virtual {p1}, Lorg/fourthline/cling/support/contentdirectory/callback/Browse$Status;->getDefaultMessage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {v0, p1}, Ljavax/swing/tree/DefaultMutableTreeNode;-><init>(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p3, v0, p2, p0}, Ljavax/swing/tree/DefaultTreeModel;->insertNodeInto(Ljavax/swing/tree/MutableTreeNode;Ljavax/swing/tree/MutableTreeNode;I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3, p2}, Ljavax/swing/tree/DefaultTreeModel;->nodeStructureChanged(Ljavax/swing/tree/TreeNode;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
