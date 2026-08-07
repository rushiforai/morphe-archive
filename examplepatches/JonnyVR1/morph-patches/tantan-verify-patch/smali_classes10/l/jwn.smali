.class public final synthetic Ll/jwn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kwn;


# direct methods
.method public synthetic constructor <init>(Ll/kwn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jwn;->a:Ll/kwn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jwn;->a:Ll/kwn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    invoke-static {p0, p1}, Ll/kwn;->j0(Ll/kwn;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method
