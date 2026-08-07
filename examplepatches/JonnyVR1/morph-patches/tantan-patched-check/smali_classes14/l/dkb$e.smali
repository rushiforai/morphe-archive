.class public Ll/dkb$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dkb;->t7()Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;",
        "Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/dkb;


# direct methods
.method public constructor <init>(Ll/dkb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dkb$e;->a:Ll/dkb;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;)Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iput-object p1, p0, Ll/dkb;->W6:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 6
    .line 7
    return-object p1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dkb$e;->a(Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;)Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
