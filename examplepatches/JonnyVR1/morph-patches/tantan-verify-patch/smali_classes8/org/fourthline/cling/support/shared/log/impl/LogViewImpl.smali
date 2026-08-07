.class public Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;
.super Ljavax/swing/JPanel;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/shared/log/LogView;


# instance fields
.field protected centerWindowEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/support/shared/CenterWindow;",
            ">;"
        }
    .end annotation
.end field

.field protected final clearButton:Ljavax/swing/JButton;

.field protected final configureButton:Ljavax/swing/JButton;

.field protected final copyButton:Ljavax/swing/JButton;

.field protected final expandButton:Ljavax/swing/JButton;

.field protected final expirationComboBox:Ljavax/swing/JComboBox;

.field protected logCategories:Lorg/fourthline/cling/support/shared/log/LogView$LogCategories;

.field protected logCategorySelector:Lorg/seamless/swing/logging/LogCategorySelector;

.field protected logTable:Ljavax/swing/JTable;

.field protected logTableModel:Lorg/seamless/swing/logging/LogTableModel;

.field protected final pauseButton:Ljavax/swing/JButton;

.field protected final pauseLabel:Ljavax/swing/JLabel;

.field protected presenter:Lorg/fourthline/cling/support/shared/log/LogView$Presenter;

.field protected final toolBar:Ljavax/swing/JToolBar;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljavax/swing/JPanel;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljavax/swing/JToolBar;

    .line 5
    .line 6
    invoke-direct {v0}, Ljavax/swing/JToolBar;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 10
    .line 11
    new-instance v0, Ljavax/swing/JButton;

    .line 12
    .line 13
    const-class v1, Lorg/seamless/swing/logging/LogController;

    .line 14
    .line 15
    const-string v2, "img/configure.png"

    .line 16
    .line 17
    invoke-static {v1, v2}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "Options..."

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;Ljavax/swing/Icon;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->configureButton:Ljavax/swing/JButton;

    .line 27
    .line 28
    new-instance v0, Ljavax/swing/JButton;

    .line 29
    .line 30
    const-class v1, Lorg/seamless/swing/logging/LogController;

    .line 31
    .line 32
    const-string v2, "img/removetext.png"

    .line 33
    .line 34
    invoke-static {v1, v2}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "Clear Log"

    .line 39
    .line 40
    invoke-direct {v0, v2, v1}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;Ljavax/swing/Icon;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->clearButton:Ljavax/swing/JButton;

    .line 44
    .line 45
    new-instance v0, Ljavax/swing/JButton;

    .line 46
    .line 47
    const-class v1, Lorg/seamless/swing/logging/LogController;

    .line 48
    .line 49
    const-string v2, "img/copyclipboard.png"

    .line 50
    .line 51
    invoke-static {v1, v2}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "Copy"

    .line 56
    .line 57
    invoke-direct {v0, v2, v1}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;Ljavax/swing/Icon;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 61
    .line 62
    new-instance v0, Ljavax/swing/JButton;

    .line 63
    .line 64
    const-class v1, Lorg/seamless/swing/logging/LogController;

    .line 65
    .line 66
    const-string v2, "img/viewtext.png"

    .line 67
    .line 68
    invoke-static {v1, v2}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v2, "Expand"

    .line 73
    .line 74
    invoke-direct {v0, v2, v1}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;Ljavax/swing/Icon;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 78
    .line 79
    new-instance v0, Ljavax/swing/JButton;

    .line 80
    .line 81
    const-class v1, Lorg/seamless/swing/logging/LogController;

    .line 82
    .line 83
    const-string v2, "img/pause.png"

    .line 84
    .line 85
    invoke-static {v1, v2}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v2, "Pause/Continue Log"

    .line 90
    .line 91
    invoke-direct {v0, v2, v1}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;Ljavax/swing/Icon;)V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseButton:Ljavax/swing/JButton;

    .line 95
    .line 96
    new-instance v0, Ljavax/swing/JLabel;

    .line 97
    .line 98
    const-string v1, " (Active)"

    .line 99
    .line 100
    invoke-direct {v0, v1}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseLabel:Ljavax/swing/JLabel;

    .line 104
    .line 105
    new-instance v0, Ljavax/swing/JComboBox;

    .line 106
    .line 107
    invoke-static {}, Lorg/seamless/swing/logging/LogController$Expiration;->values()[Lorg/seamless/swing/logging/LogController$Expiration;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-direct {v0, v1}, Ljavax/swing/JComboBox;-><init>([Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expirationComboBox:Ljavax/swing/JComboBox;

    .line 115
    .line 116
    return-void
.end method


# virtual methods
.method public adjustTableUI()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljavax/swing/JTable;->setFocusable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 8
    .line 9
    const/16 v2, 0x12

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljavax/swing/JTable;->setRowHeight(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljavax/swing/JTable;->getTableHeader()Ljavax/swing/table/JTableHeader;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Ljavax/swing/table/JTableHeader;->setReorderingAllowed(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 24
    .line 25
    invoke-static {}, Ljavax/swing/BorderFactory;->createEmptyBorder()Ljavax/swing/border/Border;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Ljavax/swing/JTable;->setBorder(Ljavax/swing/border/Border;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/16 v2, 0x1e

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljavax/swing/table/TableColumn;->setMinWidth(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, v2}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v1}, Ljavax/swing/table/TableColumn;->setResizable(Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/4 v2, 0x1

    .line 80
    invoke-interface {v0, v2}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const/16 v3, 0x5a

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Ljavax/swing/table/TableColumn;->setMinWidth(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0, v2}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, v3}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0, v2}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0, v1}, Ljavax/swing/table/TableColumn;->setResizable(Z)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 116
    .line 117
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const/4 v1, 0x2

    .line 122
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/16 v2, 0x6e

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Ljavax/swing/table/TableColumn;->setMinWidth(I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    const/16 v1, 0xfa

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 147
    .line 148
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    const/4 v1, 0x3

    .line 153
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const/16 v2, 0x96

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 163
    .line 164
    invoke-virtual {v0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {v0, v1}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const/16 v1, 0x190

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 178
    .line 179
    invoke-virtual {p0}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const/4 v0, 0x4

    .line 184
    invoke-interface {p0, v0}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    const/16 v0, 0x258

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public asUIComponent()Ljava/awt/Component;
    .locals 0

    return-object p0
.end method

.method public dispose()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logCategorySelector:Lorg/seamless/swing/logging/LogCategorySelector;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/seamless/swing/logging/LogCategorySelector;->dispose()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getDebugIcon()Ljavax/swing/ImageIcon;
    .locals 1

    .line 1
    const-class p0, Lorg/seamless/swing/logging/LogController;

    .line 2
    .line 3
    const-string v0, "img/debug.png"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDefaultExpiration()Lorg/seamless/swing/logging/LogController$Expiration;
    .locals 0

    .line 1
    sget-object p0, Lorg/seamless/swing/logging/LogController$Expiration;->SIXTY_SECONDS:Lorg/seamless/swing/logging/LogController$Expiration;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExpandMessageCharacterLimit()I
    .locals 0

    const/16 p0, 0x64

    return p0
.end method

.method public getInfoIcon()Ljavax/swing/ImageIcon;
    .locals 1

    .line 1
    const-class p0, Lorg/seamless/swing/logging/LogController;

    .line 2
    .line 3
    const-string v0, "img/info.png"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSelectedMessages()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/seamless/swing/logging/LogMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljavax/swing/JTable;->getSelectedRows()[I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    array-length v2, v1

    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    if-ge v4, v2, :cond_0

    .line 16
    .line 17
    aget v5, v1, v4

    .line 18
    .line 19
    iget-object v6, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 20
    .line 21
    invoke-virtual {v6, v5, v3}, Lorg/seamless/swing/logging/LogTableModel;->getValueAt(II)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    check-cast v5, Lorg/seamless/swing/logging/LogMessage;

    .line 26
    .line 27
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-object v0
.end method

.method public getTraceIcon()Ljavax/swing/ImageIcon;
    .locals 1

    .line 1
    const-class p0, Lorg/seamless/swing/logging/LogController;

    .line 2
    .line 3
    const-string v0, "img/trace.png"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWarnErrorIcon()Ljavax/swing/ImageIcon;
    .locals 1

    .line 1
    const-class p0, Lorg/seamless/swing/logging/LogController;

    .line 2
    .line 3
    const-string v0, "img/warn.png"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lorg/seamless/swing/Application;->createImageIcon(Ljava/lang/Class;Ljava/lang/String;)Ljavax/swing/ImageIcon;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public init()V
    .locals 4
    .annotation runtime Ljavax/annotation/PostConstruct;
    .end annotation

    .line 1
    new-instance v0, Ljava/awt/BorderLayout;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/awt/BorderLayout;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->setLayout(Ljava/awt/LayoutManager;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getDefaultExpiration()Lorg/seamless/swing/logging/LogController$Expiration;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lorg/seamless/swing/logging/LogCategorySelector;

    .line 14
    .line 15
    iget-object v2, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logCategories:Lorg/fourthline/cling/support/shared/log/LogView$LogCategories;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Lorg/seamless/swing/logging/LogCategorySelector;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logCategorySelector:Lorg/seamless/swing/logging/LogCategorySelector;

    .line 21
    .line 22
    new-instance v1, Lorg/seamless/swing/logging/LogTableModel;

    .line 23
    .line 24
    invoke-virtual {v0}, Lorg/seamless/swing/logging/LogController$Expiration;->getSeconds()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-direct {v1, v2}, Lorg/seamless/swing/logging/LogTableModel;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 32
    .line 33
    new-instance v1, Ljavax/swing/JTable;

    .line 34
    .line 35
    iget-object v2, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljavax/swing/JTable;-><init>(Ljavax/swing/table/TableModel;)V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 41
    .line 42
    const-class v2, Lorg/seamless/swing/logging/LogMessage;

    .line 43
    .line 44
    new-instance v3, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;

    .line 45
    .line 46
    invoke-direct {v3, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2, v3}, Ljavax/swing/JTable;->setDefaultRenderer(Ljava/lang/Class;Ljavax/swing/table/TableCellRenderer;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v1, v2}, Ljavax/swing/JTable;->setCellSelectionEnabled(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {v1, v2}, Ljavax/swing/JTable;->setRowSelectionAllowed(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljavax/swing/JTable;->getSelectionModel()Ljavax/swing/ListSelectionModel;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;

    .line 71
    .line 72
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$2;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v1, v2}, Ljavax/swing/ListSelectionModel;->addListSelectionListener(Ljavax/swing/event/ListSelectionListener;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->adjustTableUI()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->initializeToolBar(Lorg/seamless/swing/logging/LogController$Expiration;)V

    .line 82
    .line 83
    .line 84
    new-instance v0, Ljava/awt/Dimension;

    .line 85
    .line 86
    const/16 v1, 0x64

    .line 87
    .line 88
    const/16 v2, 0xfa

    .line 89
    .line 90
    invoke-direct {v0, v2, v1}, Ljava/awt/Dimension;-><init>(II)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/awt/Dimension;

    .line 97
    .line 98
    const/16 v1, 0x32

    .line 99
    .line 100
    invoke-direct {v0, v2, v1}, Ljava/awt/Dimension;-><init>(II)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 104
    .line 105
    .line 106
    new-instance v0, Ljavax/swing/JScrollPane;

    .line 107
    .line 108
    iget-object v1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 109
    .line 110
    invoke-direct {v0, v1}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 111
    .line 112
    .line 113
    const-string v1, "Center"

    .line 114
    .line 115
    invoke-virtual {p0, v0, v1}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 119
    .line 120
    const-string v1, "South"

    .line 121
    .line 122
    invoke-virtual {p0, v0, v1}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public initializeToolBar(Lorg/seamless/swing/logging/LogController$Expiration;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->configureButton:Ljavax/swing/JButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setFocusable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->configureButton:Ljavax/swing/JButton;

    .line 8
    .line 9
    new-instance v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$3;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$3;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->clearButton:Ljavax/swing/JButton;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setFocusable(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->clearButton:Ljavax/swing/JButton;

    .line 23
    .line 24
    new-instance v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$4;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$4;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setFocusable(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 43
    .line 44
    new-instance v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$5;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$5;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setFocusable(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 63
    .line 64
    new-instance v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$6;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$6;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseButton:Ljavax/swing/JButton;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljavax/swing/JButton;->setFocusable(Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseButton:Ljavax/swing/JButton;

    .line 78
    .line 79
    new-instance v2, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expirationComboBox:Ljavax/swing/JComboBox;

    .line 88
    .line 89
    invoke-virtual {v0, p1}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expirationComboBox:Ljavax/swing/JComboBox;

    .line 93
    .line 94
    new-instance v0, Ljava/awt/Dimension;

    .line 95
    .line 96
    const/16 v2, 0x64

    .line 97
    .line 98
    const/16 v3, 0x20

    .line 99
    .line 100
    invoke-direct {v0, v2, v3}, Ljava/awt/Dimension;-><init>(II)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ljavax/swing/JComboBox;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expirationComboBox:Ljavax/swing/JComboBox;

    .line 107
    .line 108
    new-instance v0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$8;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$8;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 117
    .line 118
    invoke-virtual {p1, v1}, Ljavax/swing/JToolBar;->setFloatable(Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 122
    .line 123
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->copyButton:Ljavax/swing/JButton;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 129
    .line 130
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expandButton:Ljavax/swing/JButton;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 136
    .line 137
    invoke-static {}, Ljavax/swing/Box;->createHorizontalGlue()Ljava/awt/Component;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 145
    .line 146
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->configureButton:Ljavax/swing/JButton;

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 152
    .line 153
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->clearButton:Ljavax/swing/JButton;

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 159
    .line 160
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseButton:Ljavax/swing/JButton;

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 166
    .line 167
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseLabel:Ljavax/swing/JLabel;

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 173
    .line 174
    invoke-static {}, Ljavax/swing/Box;->createHorizontalGlue()Ljava/awt/Component;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 182
    .line 183
    new-instance v0, Ljavax/swing/JLabel;

    .line 184
    .line 185
    const-string v1, "Clear after:"

    .line 186
    .line 187
    invoke-direct {v0, v1}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->toolBar:Ljavax/swing/JToolBar;

    .line 194
    .line 195
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->expirationComboBox:Ljavax/swing/JComboBox;

    .line 196
    .line 197
    invoke-virtual {p1, p0}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public pushMessage(Lorg/seamless/swing/logging/LogMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/seamless/swing/logging/LogTableModel;->pushMessage(Lorg/seamless/swing/logging/LogMessage;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 7
    .line 8
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogTableModel;->isPaused()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTable:Ljavax/swing/JTable;

    .line 15
    .line 16
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/seamless/swing/logging/LogTableModel;->getRowCount()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 v0, 0x1

    .line 23
    sub-int/2addr p0, v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, p0, v1, v0}, Ljavax/swing/JTable;->getCellRect(IIZ)Ljava/awt/Rectangle;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Ljavax/swing/JTable;->scrollRectToVisible(Ljava/awt/Rectangle;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public bridge synthetic setPresenter(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lorg/fourthline/cling/support/shared/log/LogView$Presenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->setPresenter(Lorg/fourthline/cling/support/shared/log/LogView$Presenter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPresenter(Lorg/fourthline/cling/support/shared/log/LogView$Presenter;)V
    .locals 0

    .line 7
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->presenter:Lorg/fourthline/cling/support/shared/log/LogView$Presenter;

    return-void
.end method
