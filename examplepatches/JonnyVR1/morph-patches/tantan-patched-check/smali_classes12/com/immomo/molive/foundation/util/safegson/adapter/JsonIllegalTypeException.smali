.class public Lcom/immomo/molive/foundation/util/safegson/adapter/JsonIllegalTypeException;
.super Ljava/lang/RuntimeException;
.source "SourceFile"


# instance fields
.field private mExceptType:Lcom/google/gson/stream/JsonToken;

.field private mIllegalType:Lcom/google/gson/stream/JsonToken;


# direct methods
.method public constructor <init>(Lcom/google/gson/stream/JsonToken;Lcom/google/gson/stream/JsonToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/molive/foundation/util/safegson/adapter/JsonIllegalTypeException;->mExceptType:Lcom/google/gson/stream/JsonToken;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/molive/foundation/util/safegson/adapter/JsonIllegalTypeException;->mIllegalType:Lcom/google/gson/stream/JsonToken;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getExceptType()Lcom/google/gson/stream/JsonToken;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/adapter/JsonIllegalTypeException;->mExceptType:Lcom/google/gson/stream/JsonToken;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIllegalType()Lcom/google/gson/stream/JsonToken;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/adapter/JsonIllegalTypeException;->mIllegalType:Lcom/google/gson/stream/JsonToken;

    .line 2
    .line 3
    return-object p0
.end method
