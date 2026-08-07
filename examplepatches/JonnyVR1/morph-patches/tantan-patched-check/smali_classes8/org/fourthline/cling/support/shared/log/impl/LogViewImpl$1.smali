.class Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;
.super Lorg/seamless/swing/logging/LogTableCellRenderer;
.source "SourceFile"


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
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/seamless/swing/logging/LogTableCellRenderer;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getDebugIcon()Ljavax/swing/ImageIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getDebugIcon()Ljavax/swing/ImageIcon;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInfoIcon()Ljavax/swing/ImageIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getInfoIcon()Ljavax/swing/ImageIcon;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTraceIcon()Ljavax/swing/ImageIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getTraceIcon()Ljavax/swing/ImageIcon;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getWarnErrorIcon()Ljavax/swing/ImageIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getWarnErrorIcon()Ljavax/swing/ImageIcon;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
