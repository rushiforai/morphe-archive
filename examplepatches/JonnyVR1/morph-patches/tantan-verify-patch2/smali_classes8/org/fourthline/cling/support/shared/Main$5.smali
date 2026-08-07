.class Lorg/fourthline/cling/support/shared/Main$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/Main;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/Main;

.field final synthetic val$throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/Main;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/support/shared/Main$5;->val$throwable:Ljava/lang/Throwable;

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
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/awt/Container;->removeAll()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljavax/swing/JTextArea;

    .line 13
    .line 14
    invoke-direct {v0}, Ljavax/swing/JTextArea;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "An exceptional error occurred!\nYou can try to continue or exit the application.\n\nPlease tell us about this here:\nhttp://www.4thline.org/projects/mailinglists-cling.html\n\n-------------------------------------------------------------------------------------------------------------\n\n"

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Ljava/io/StringWriter;

    .line 29
    .line 30
    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v4, p0, Lorg/fourthline/cling/support/shared/Main$5;->val$throwable:Ljava/lang/Throwable;

    .line 34
    .line 35
    new-instance v5, Ljava/io/PrintWriter;

    .line 36
    .line 37
    invoke-direct {v5, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ljavax/swing/JScrollPane;

    .line 58
    .line 59
    invoke-direct {v2, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 63
    .line 64
    iget-object v3, v3, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 65
    .line 66
    invoke-virtual {v3}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    const-string v4, "Center"

    .line 71
    .line 72
    invoke-virtual {v3, v2, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ljavax/swing/JButton;

    .line 76
    .line 77
    const-string v3, "Exit Application"

    .line 78
    .line 79
    invoke-direct {v2, v3}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    new-instance v3, Lorg/fourthline/cling/support/shared/Main$5$1;

    .line 83
    .line 84
    invoke-direct {v3, p0}, Lorg/fourthline/cling/support/shared/Main$5$1;-><init>(Lorg/fourthline/cling/support/shared/Main$5;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2, v3}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 91
    .line 92
    iget-object v3, v3, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 93
    .line 94
    invoke-virtual {v3}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v4, "South"

    .line 99
    .line 100
    invoke-virtual {v3, v2, v4}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 104
    .line 105
    iget-object v2, v2, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 106
    .line 107
    invoke-virtual {v2}, Ljavax/swing/JFrame;->pack()V

    .line 108
    .line 109
    .line 110
    iget-object v2, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 111
    .line 112
    iget-object v2, v2, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 113
    .line 114
    invoke-static {v2}, Lorg/seamless/swing/Application;->center(Ljava/awt/Window;)Ljava/awt/Window;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setCaretPosition(I)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main$5;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 121
    .line 122
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 123
    .line 124
    const/4 v0, 0x1

    .line 125
    invoke-virtual {p0, v0}, Ljavax/swing/JFrame;->setVisible(Z)V

    .line 126
    .line 127
    .line 128
    return-void
.end method
