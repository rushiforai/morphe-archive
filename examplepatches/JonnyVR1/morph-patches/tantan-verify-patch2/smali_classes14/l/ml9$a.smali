.class public Ll/ml9$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ml9;->c3()Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/putong/core/data/UserLiveHierarchyEnvelope;",
        "Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/ml9;


# direct methods
.method public constructor <init>(Ll/ml9;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ml9$a;->a:Ll/ml9;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/UserLiveHierarchyEnvelope;)Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/UserLiveHierarchyEnvelope;->data:Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserLiveHierarchyEnvelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ml9$a;->a(Lcom/p1/mobile/putong/core/data/UserLiveHierarchyEnvelope;)Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
