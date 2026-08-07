.class public final synthetic Ll/p7s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p7s;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/p7s;->b:Lcom/p1/mobile/putong/data/Picture;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p7s;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/p7s;->b:Lcom/p1/mobile/putong/data/Picture;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    invoke-static {v0, p0, p1}, Ll/w7s;->m0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
