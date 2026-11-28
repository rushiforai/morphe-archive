.class public interface abstract Lnicoid/network238/okhttp3/Call;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Call$Factory;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u001a\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008f\u0018\u00002\u00020\u0001:\u0001 J\u0008\u0010\u0002\u001a\u00020\u0003H&J\u0008\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH&J\u0008\u0010\n\u001a\u00020\u0007H&J\u0008\u0010\u000b\u001a\u00020\u000cH&J\u0008\u0010\r\u001a\u00020\u000cH&J\u0008\u0010\u000e\u001a\u00020\u000fH&J\u0010\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0012H&J\'\u0010\u0013\u001a\u0004\u0018\u0001H\u0014\"\u0008\u0008\u0000\u0010\u0014*\u00020\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u0017H&\u00a2\u0006\u0002\u0010\u0018J%\u0010\u0013\u001a\u0004\u0018\u0001H\u0014\"\u0004\u0008\u0000\u0010\u00142\u000e\u0010\u0016\u001a\n\u0012\u0006\u0008\u0001\u0012\u0002H\u00140\u0019H&\u00a2\u0006\u0002\u0010\u001aJ3\u0010\u0013\u001a\u0002H\u0014\"\u0008\u0008\u0000\u0010\u0014*\u00020\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u00172\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u001cH&\u00a2\u0006\u0002\u0010\u001dJ3\u0010\u0013\u001a\u0002H\u0014\"\u0008\u0008\u0000\u0010\u0014*\u00020\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u00192\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u001cH&\u00a2\u0006\u0002\u0010\u001eJ\u0008\u0010\u001f\u001a\u00020\u0000H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006!\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Call;",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "execute",
        "Lnicoid/network238/okhttp3/Response;",
        "enqueue",
        "",
        "responseCallback",
        "Lnicoid/network238/okhttp3/Callback;",
        "cancel",
        "isExecuted",
        "",
        "isCanceled",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "addEventListener",
        "eventListener",
        "Lnicoid/network238/okhttp3/EventListener;",
        "tag",
        "T",
        "",
        "type",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;",
        "Ljava/lang/Class;",
        "(Ljava/lang/Class;)Ljava/lang/Object;",
        "computeIfAbsent",
        "Lnicoid/network238/kotlin/Function0;",
        "(Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "(Ljava/lang/Class;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "clone",
        "Factory",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract addEventListener(Lnicoid/network238/okhttp3/EventListener;)V
.end method

.method public abstract cancel()V
.end method

.method public abstract clone()Lnicoid/network238/okhttp3/Call;
.end method

.method public abstract enqueue(Lnicoid/network238/okhttp3/Callback;)V
.end method

.method public abstract execute()Lnicoid/network238/okhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isCanceled()Z
.end method

.method public abstract isExecuted()Z
.end method

.method public abstract request()Lnicoid/network238/okhttp3/Request;
.end method

.method public abstract tag(Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract tag(Ljava/lang/Class;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract tag(Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract timeout()Lnicoid/network238/okio/Timeout;
.end method
