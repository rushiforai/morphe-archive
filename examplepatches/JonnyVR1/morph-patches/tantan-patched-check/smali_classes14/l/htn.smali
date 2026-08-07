.class public final synthetic Ll/htn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mvn;


# direct methods
.method public synthetic constructor <init>(Ll/mvn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htn;->a:Ll/mvn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/htn;->a:Ll/mvn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-virtual {p0, p1}, Ll/mvn;->s(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/mvn;

    move-result-object p0

    return-object p0
.end method
