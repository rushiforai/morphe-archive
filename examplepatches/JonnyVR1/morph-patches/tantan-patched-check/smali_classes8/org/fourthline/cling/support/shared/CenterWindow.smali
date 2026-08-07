.class public Lorg/fourthline/cling/support/shared/CenterWindow;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected window:Ljava/awt/Window;


# direct methods
.method public constructor <init>(Ljava/awt/Window;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/CenterWindow;->window:Ljava/awt/Window;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getWindow()Ljava/awt/Window;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/CenterWindow;->window:Ljava/awt/Window;

    .line 2
    .line 3
    return-object p0
.end method
