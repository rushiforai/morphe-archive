.class public final synthetic Ll/edn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/edn;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edn;->a:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {p0, p1}, Ll/fdn$a;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
