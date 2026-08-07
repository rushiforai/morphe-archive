.class public final synthetic Ll/l7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/x7g;


# direct methods
.method public synthetic constructor <init>(Ll/x7g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l7g;->a:Ll/x7g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7g;->a:Ll/x7g;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/x7g;->o(Ll/x7g;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
