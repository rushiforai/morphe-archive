.class public Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;
.super Ljavax/swing/tree/DefaultTreeCellRenderer;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljavax/swing/tree/DefaultTreeCellRenderer;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getContainerClosedIcon()Ljavax/swing/Icon;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getContainerOpenIcon()Ljavax/swing/Icon;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getInfoIcon()Ljavax/swing/Icon;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getItemIcon(Lorg/fourthline/cling/support/model/item/Item;Ljava/lang/String;)Ljavax/swing/Icon;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getTreeCellRendererComponent(Ljavax/swing/JTree;Ljava/lang/Object;ZZZIZ)Ljava/awt/Component;
    .locals 0

    .line 1
    invoke-super/range {p0 .. p7}, Ljavax/swing/tree/DefaultTreeCellRenderer;->getTreeCellRendererComponent(Ljavax/swing/JTree;Ljava/lang/Object;ZZZIZ)Ljava/awt/Component;

    .line 2
    .line 3
    .line 4
    check-cast p2, Ljavax/swing/tree/DefaultMutableTreeNode;

    .line 5
    .line 6
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getUserObject()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    instance-of p1, p1, Lorg/fourthline/cling/support/model/container/Container;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getUserObject()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lorg/fourthline/cling/support/model/container/Container;

    .line 19
    .line 20
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/DIDLObject;->getTitle()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->setText(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    if-eqz p4, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->getContainerOpenIcon()Ljavax/swing/Icon;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->getContainerClosedIcon()Ljavax/swing/Icon;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->setIcon(Ljavax/swing/Icon;)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_1
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getUserObject()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    instance-of p1, p1, Lorg/fourthline/cling/support/model/item/Item;

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getUserObject()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lorg/fourthline/cling/support/model/item/Item;

    .line 55
    .line 56
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/DIDLObject;->getTitle()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p0, p2}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->setText(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/DIDLObject;->getClazz()Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    invoke-virtual {p2}, Lorg/fourthline/cling/support/model/DIDLObject$Class;->getValue()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    const/4 p2, 0x0

    .line 75
    :goto_1
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->getItemIcon(Lorg/fourthline/cling/support/model/item/Item;Ljava/lang/String;)Ljavax/swing/Icon;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->setIcon(Ljavax/swing/Icon;)V

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    invoke-virtual {p2}, Ljavax/swing/tree/DefaultMutableTreeNode;->getUserObject()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    instance-of p1, p1, Ljava/lang/String;

    .line 88
    .line 89
    if-eqz p1, :cond_4

    .line 90
    .line 91
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->getInfoIcon()Ljavax/swing/Icon;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->setIcon(Ljavax/swing/Icon;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lorg/fourthline/cling/support/contentdirectory/ui/ContentTreeCellRenderer;->onCreate()V

    .line 99
    .line 100
    .line 101
    return-object p0
.end method

.method public onCreate()V
    .locals 0

    return-void
.end method
