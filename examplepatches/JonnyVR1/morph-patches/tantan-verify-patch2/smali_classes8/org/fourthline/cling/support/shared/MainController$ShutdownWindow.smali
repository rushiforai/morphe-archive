.class public Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;
.super Ljavax/swing/JWindow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/shared/MainController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShutdownWindow"
.end annotation


# static fields
.field public static final INSTANCE:Ljavax/swing/JWindow;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;->INSTANCE:Ljavax/swing/JWindow;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljavax/swing/JWindow;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljavax/swing/JLabel;

    .line 5
    .line 6
    const-string v1, "Shutting down, please wait..."

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljavax/swing/JLabel;->setHorizontalAlignment(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;->getContentPane()Ljava/awt/Container;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 20
    .line 21
    .line 22
    new-instance v0, Ljava/awt/Dimension;

    .line 23
    .line 24
    const/16 v1, 0x12c

    .line 25
    .line 26
    const/16 v2, 0x1e

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ljava/awt/Dimension;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/MainController$ShutdownWindow;->pack()V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Lorg/seamless/swing/Application;->center(Ljava/awt/Window;)Ljava/awt/Window;

    .line 38
    .line 39
    .line 40
    return-void
.end method
