.class public Lorg/fourthline/cling/model/meta/StateVariableEventDetails;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final eventMaximumRateMilliseconds:I

.field private final eventMinimumDelta:I

.field private final sendEvents:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 12
    invoke-direct {p0, v0, v1, v1}, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;-><init>(ZII)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, v0, v0}, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;-><init>(ZII)V

    return-void
.end method

.method public constructor <init>(ZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;->sendEvents:Z

    .line 5
    .line 6
    iput p2, p0, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;->eventMaximumRateMilliseconds:I

    .line 7
    .line 8
    iput p3, p0, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;->eventMinimumDelta:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getEventMaximumRateMilliseconds()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;->eventMaximumRateMilliseconds:I

    .line 2
    .line 3
    return p0
.end method

.method public getEventMinimumDelta()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;->eventMinimumDelta:I

    .line 2
    .line 3
    return p0
.end method

.method public isSendEvents()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/model/meta/StateVariableEventDetails;->sendEvents:Z

    .line 2
    .line 3
    return p0
.end method
