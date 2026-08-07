.class Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljavax/swing/event/ListSelectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public valueChanged(Ljavax/swing/event/ListSelectionEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljavax/swing/event/ListSelectionEvent;->getValueIsAdjusting()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljavax/swing/event/ListSelectionEvent;->getSource()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 13
    .line 14
    iget-object v0, v0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljavax/swing/JTable;->getSelectionModel()Ljavax/swing/ListSelectionModel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-ne p1, v0, :cond_5

    .line 21
    .line 22
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 23
    .line 24
    iget-object p1, p1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljavax/swing/JTable;->getSelectedRows()[I

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x0

    .line 31
    if-eqz p1, :cond_4

    .line 32
    .line 33
    array-length v1, p1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    array-length v1, p1

    .line 38
    iget-object v2, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 39
    .line 40
    const/4 v3, 0x1

    .line 41
    if-ne v1, v3, :cond_3

    .line 42
    .line 43
    iget-object v1, v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 49
    .line 50
    iget-object v1, v1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 51
    .line 52
    aget p1, p1, v0

    .line 53
    .line 54
    invoke-virtual {v1, p1, v0}, Lorg/seamless/swing/logging/LogTableModel;->getValueAt(II)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lorg/seamless/swing/logging/LogMessage;

    .line 59
    .line 60
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogMessage;->getMessage()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 69
    .line 70
    invoke-virtual {v1}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getExpandMessageCharacterLimit()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 75
    .line 76
    if-le p1, v1, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 79
    .line 80
    invoke-virtual {p0, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    iget-object p1, v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 91
    .line 92
    invoke-virtual {p1, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 96
    .line 97
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    :goto_0
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 104
    .line 105
    iget-object p1, p1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 111
    .line 112
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 115
    .line 116
    .line 117
    :cond_5
    :goto_1
    return-void
.end method
