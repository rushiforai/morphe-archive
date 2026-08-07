.class public final synthetic Ll/pet;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bft;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/bft;ZLjava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pet;->a:Ll/bft;

    iput-boolean p2, p0, Ll/pet;->b:Z

    iput-object p3, p0, Ll/pet;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/pet;->d:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pet;->a:Ll/bft;

    iget-boolean v1, p0, Ll/pet;->b:Z

    iget-object v2, p0, Ll/pet;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/pet;->d:Ll/pf60;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    invoke-static {v0, v1, v2, p0, p1}, Ll/bft;->V3(Ll/bft;ZLjava/lang/String;Ll/pf60;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V

    return-void
.end method
