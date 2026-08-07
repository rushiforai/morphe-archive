.class public abstract Lorg/fourthline/cling/support/igd/callback/PortMappingEntryGet;
.super Lorg/fourthline/cling/controlpoint/ActionCallback;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/meta/Service;J)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, v0, p2, p3}, Lorg/fourthline/cling/support/igd/callback/PortMappingEntryGet;-><init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;J)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;J)V
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 2
    .line 3
    const-string v1, "GetGenericPortMappingEntry"

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lorg/fourthline/cling/model/meta/Service;->getAction(Ljava/lang/String;)Lorg/fourthline/cling/model/meta/Action;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, p1}, Lorg/fourthline/cling/model/action/ActionInvocation;-><init>(Lorg/fourthline/cling/model/meta/Action;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0, p2}, Lorg/fourthline/cling/controlpoint/ActionCallback;-><init>(Lorg/fourthline/cling/model/action/ActionInvocation;Lorg/fourthline/cling/controlpoint/ControlPoint;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 20
    .line 21
    invoke-direct {p1, p3, p4}, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;-><init>(J)V

    .line 22
    .line 23
    .line 24
    const-string p2, "NewPortMappingIndex"

    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public success(Lorg/fourthline/cling/model/action/ActionInvocation;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/ActionInvocation;->getOutputMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lorg/fourthline/cling/support/model/PortMapping;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/PortMapping;-><init>(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/igd/callback/PortMappingEntryGet;->success(Lorg/fourthline/cling/support/model/PortMapping;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public abstract success(Lorg/fourthline/cling/support/model/PortMapping;)V
.end method
