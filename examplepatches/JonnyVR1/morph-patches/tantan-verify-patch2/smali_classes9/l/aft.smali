.class public final synthetic Ll/aft;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bft;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/bft;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aft;->a:Ll/bft;

    iput-object p2, p0, Ll/aft;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aft;->a:Ll/bft;

    iget-object p0, p0, Ll/aft;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    invoke-static {v0, p0, p1}, Ll/bft;->N3(Ll/bft;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
