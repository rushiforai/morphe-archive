.class Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->initializeToolBar(Lorg/seamless/swing/logging/LogController$Expiration;)V
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
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    iget-object p1, p1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 4
    .line 5
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogTableModel;->isPaused()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    xor-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/seamless/swing/logging/LogTableModel;->setPaused(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 15
    .line 16
    iget-object p1, p1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 17
    .line 18
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogTableModel;->isPaused()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$7;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseLabel:Ljavax/swing/JLabel;

    .line 27
    .line 28
    const-string p1, " (Paused)"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->pauseLabel:Ljavax/swing/JLabel;

    .line 35
    .line 36
    const-string p1, " (Active)"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
