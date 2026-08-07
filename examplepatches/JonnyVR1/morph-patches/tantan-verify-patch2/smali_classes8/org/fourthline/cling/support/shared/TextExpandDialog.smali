.class public Lorg/fourthline/cling/support/shared/TextExpandDialog;
.super Ljavax/swing/JDialog;
.source "SourceFile"


# static fields
.field private static log:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/shared/TextExpandDialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lorg/fourthline/cling/support/shared/TextExpandDialog;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/awt/Frame;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Ljavax/swing/JDialog;-><init>(Ljava/awt/Frame;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/shared/TextExpandDialog;->setResizable(Z)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljavax/swing/JTextArea;

    .line 9
    .line 10
    invoke-direct {v0}, Ljavax/swing/JTextArea;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljavax/swing/JScrollPane;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ljava/awt/Dimension;

    .line 19
    .line 20
    const/16 v3, 0x1f4

    .line 21
    .line 22
    const/16 v4, 0x190

    .line 23
    .line 24
    invoke-direct {v2, v3, v4}, Ljava/awt/Dimension;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljavax/swing/JScrollPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/support/shared/TextExpandDialog;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 31
    .line 32
    .line 33
    const-string v1, "<"

    .line 34
    .line 35
    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x0

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    const-string v1, ">"

    .line 43
    .line 44
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    :try_start_0
    new-instance v1, Lorg/fourthline/cling/support/shared/TextExpandDialog$1;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lorg/fourthline/cling/support/shared/TextExpandDialog$1;-><init>(Lorg/fourthline/cling/support/shared/TextExpandDialog;)V

    .line 53
    .line 54
    .line 55
    const/4 v3, 0x2

    .line 56
    invoke-virtual {v1, p2, v3, v2}, Lorg/seamless/xml/DOMParser;->print(Ljava/lang/String;IZ)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    goto :goto_0

    .line 61
    :catch_0
    move-exception v1

    .line 62
    sget-object v3, Lorg/fourthline/cling/support/shared/TextExpandDialog;->log:Ljava/util/logging/Logger;

    .line 63
    .line 64
    new-instance v4, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v5, "Error pretty printing XML: "

    .line 67
    .line 68
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v3, v1}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    const-string v1, "http-get"

    .line 87
    .line 88
    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_1

    .line 93
    .line 94
    invoke-static {p2}, Lorg/fourthline/cling/model/ModelUtil;->commaToNewline(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    :cond_1
    :goto_0
    invoke-virtual {v0, v2}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p2}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/TextExpandDialog;->pack()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/TextExpandDialog;->getOwner()Ljava/awt/Window;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-static {p0, p2}, Lorg/seamless/swing/Application;->center(Ljava/awt/Window;Ljava/awt/Window;)Ljava/awt/Window;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/shared/TextExpandDialog;->setVisible(Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method
