.class public Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer$TransferMechanism;
    }
.end annotation


# instance fields
.field private size:Ljava/lang/Long;

.field private tranfer:Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer$TransferMechanism;


# direct methods
.method public constructor <init>(Ljava/lang/Long;Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer$TransferMechanism;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer;->size:Ljava/lang/Long;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer;->tranfer:Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer$TransferMechanism;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getSize()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer;->size:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTranfer()Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer$TransferMechanism;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer;->tranfer:Lorg/fourthline/cling/support/model/dlna/types/CodedDataBuffer$TransferMechanism;

    .line 2
    .line 3
    return-object p0
.end method
