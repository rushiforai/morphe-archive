.class public final synthetic Ll/ph8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;

    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/CoreData;->U(Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;)Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;

    move-result-object p0

    return-object p0
.end method
