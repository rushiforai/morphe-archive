.class Lorg/fourthline/cling/support/shared/Main$2;
.super Ljava/awt/event/WindowAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/Main;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/Main;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/Main;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/Main$2;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public windowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main$2;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljavax/swing/JFrame;->dispose()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
