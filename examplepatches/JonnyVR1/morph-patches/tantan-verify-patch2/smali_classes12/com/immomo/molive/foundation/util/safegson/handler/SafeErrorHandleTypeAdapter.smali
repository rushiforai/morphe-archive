.class public abstract Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;
.super Lcom/google/gson/TypeAdapter;
.source "SourceFile"

# interfaces
.implements Ll/g5m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/gson/TypeAdapter<",
        "TT;>;",
        "Ll/g5m;"
    }
.end annotation


# instance fields
.field private a:Ll/h5m;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/gson/TypeAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/h5m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;->a:Ll/h5m;

    .line 2
    .line 3
    return-void
.end method

.method public b(Lcom/google/gson/stream/JsonReader;Lcom/google/gson/reflect/TypeToken;Ljava/lang/String;Lcom/google/gson/stream/JsonToken;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonReader;",
            "Lcom/google/gson/reflect/TypeToken<",
            "*>;",
            "Ljava/lang/String;",
            "Lcom/google/gson/stream/JsonToken;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;->a:Ll/h5m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Ll/h5m;->b(Lcom/google/gson/stream/JsonReader;Lcom/google/gson/reflect/TypeToken;Ljava/lang/String;Lcom/google/gson/stream/JsonToken;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
