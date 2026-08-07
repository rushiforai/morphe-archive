.class public Lorg/fourthline/cling/controlpoint/event/ExecuteAction;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected callback:Lorg/fourthline/cling/controlpoint/ActionCallback;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/controlpoint/ActionCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/controlpoint/event/ExecuteAction;->callback:Lorg/fourthline/cling/controlpoint/ActionCallback;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCallback()Lorg/fourthline/cling/controlpoint/ActionCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/controlpoint/event/ExecuteAction;->callback:Lorg/fourthline/cling/controlpoint/ActionCallback;

    .line 2
    .line 3
    return-object p0
.end method
