.class Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$8;
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
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$8;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

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
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getSource()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljavax/swing/JComboBox;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljavax/swing/JComboBox;->getSelectedItem()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lorg/seamless/swing/logging/LogController$Expiration;

    .line 12
    .line 13
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$8;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 14
    .line 15
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logTableModel:Lorg/seamless/swing/logging/LogTableModel;

    .line 16
    .line 17
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogController$Expiration;->getSeconds()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lorg/seamless/swing/logging/LogTableModel;->setMaxAgeSeconds(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
