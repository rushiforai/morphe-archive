.class public interface abstract Lcom/google/firebase/sessions/api/SessionSubscriber;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/sessions/api/SessionSubscriber$Name;,
        Lcom/google/firebase/sessions/api/SessionSubscriber$SessionDetails;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001:\u0002\r\u000eJ\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0004R\u0012\u0010\u0005\u001a\u00020\u0006X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/google/firebase/sessions/api/SessionSubscriber;",
        "",
        "isDataCollectionEnabled",
        "",
        "()Z",
        "sessionSubscriberName",
        "Lcom/google/firebase/sessions/api/SessionSubscriber$Name;",
        "getSessionSubscriberName",
        "()Lcom/google/firebase/sessions/api/SessionSubscriber$Name;",
        "onSessionChanged",
        "",
        "sessionDetails",
        "Lcom/google/firebase/sessions/api/SessionSubscriber$SessionDetails;",
        "Name",
        "SessionDetails",
        "com.google.firebase-firebase-sessions"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract getSessionSubscriberName()Lcom/google/firebase/sessions/api/SessionSubscriber$Name;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public abstract isDataCollectionEnabled()Z
.end method

.method public abstract onSessionChanged(Lcom/google/firebase/sessions/api/SessionSubscriber$SessionDetails;)V
    .param p1    # Lcom/google/firebase/sessions/api/SessionSubscriber$SessionDetails;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
