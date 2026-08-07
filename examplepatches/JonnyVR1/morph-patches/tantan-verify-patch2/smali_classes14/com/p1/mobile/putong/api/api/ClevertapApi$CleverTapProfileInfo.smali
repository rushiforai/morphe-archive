.class public final Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/ClevertapApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CleverTapProfileInfo"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u001b\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfo;",
        "Ljava/io/Serializable;",
        "meta",
        "Lcom/p1/mobile/putong/data/Meta;",
        "data",
        "Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;",
        "<init>",
        "(Lcom/p1/mobile/putong/data/Meta;Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;)V",
        "getMeta",
        "()Lcom/p1/mobile/putong/data/Meta;",
        "getData",
        "()Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final data:Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final meta:Lcom/p1/mobile/putong/data/Meta;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/Meta;Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Meta;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfo;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfo;->data:Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final getData()Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfo;->data:Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfoBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMeta()Lcom/p1/mobile/putong/data/Meta;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/ClevertapApi$CleverTapProfileInfo;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    return-object p0
.end method
