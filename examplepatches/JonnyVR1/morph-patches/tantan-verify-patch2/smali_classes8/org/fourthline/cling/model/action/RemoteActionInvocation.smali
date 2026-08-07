.class public Lorg/fourthline/cling/model/action/RemoteActionInvocation;
.super Lorg/fourthline/cling/model/action/ActionInvocation;
.source "SourceFile"


# instance fields
.field protected final remoteClientInfo:Lorg/fourthline/cling/model/profile/RemoteClientInfo;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/action/ActionException;Lorg/fourthline/cling/model/profile/RemoteClientInfo;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lorg/fourthline/cling/model/action/ActionInvocation;-><init>(Lorg/fourthline/cling/model/action/ActionException;)V

    .line 11
    iput-object p2, p0, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->remoteClientInfo:Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/Action;Lorg/fourthline/cling/model/profile/RemoteClientInfo;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Lorg/fourthline/cling/model/action/ActionInvocation;-><init>(Lorg/fourthline/cling/model/meta/Action;)V

    .line 9
    iput-object p2, p0, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->remoteClientInfo:Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/Action;[Lorg/fourthline/cling/model/action/ActionArgumentValue;[Lorg/fourthline/cling/model/action/ActionArgumentValue;Lorg/fourthline/cling/model/profile/RemoteClientInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;-><init>(Lorg/fourthline/cling/model/meta/Action;[Lorg/fourthline/cling/model/action/ActionArgumentValue;[Lorg/fourthline/cling/model/action/ActionArgumentValue;Lorg/fourthline/cling/model/profile/ClientInfo;)V

    .line 3
    .line 4
    .line 5
    iput-object p4, p0, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->remoteClientInfo:Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getRemoteClientInfo()Lorg/fourthline/cling/model/profile/RemoteClientInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->remoteClientInfo:Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    .line 2
    .line 3
    return-object p0
.end method
