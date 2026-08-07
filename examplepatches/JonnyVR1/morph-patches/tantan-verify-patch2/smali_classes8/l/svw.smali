.class public final synthetic Ll/svw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/map/MapAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/map/MapAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/svw;->a:Lcom/p1/mobile/putong/core/ui/map/MapAct;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/svw;->a:Lcom/p1/mobile/putong/core/ui/map/MapAct;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/map/MapAct;->Z1(Lcom/p1/mobile/putong/core/ui/map/MapAct;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
