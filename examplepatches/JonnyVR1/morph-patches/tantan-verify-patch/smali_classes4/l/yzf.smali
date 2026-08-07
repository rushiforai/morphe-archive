.class public final synthetic Ll/yzf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/FakeGuideData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzf;->a:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yzf;->a:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1}, Ll/a0g;->p(Lcom/p1/mobile/putong/core/data/FakeGuideData;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
