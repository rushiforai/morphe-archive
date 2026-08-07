.class public final synthetic Ll/jas;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/las;


# direct methods
.method public synthetic constructor <init>(Ll/las;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jas;->a:Ll/las;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jas;->a:Ll/las;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

    invoke-static {p0, p1}, Ll/las;->N3(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;)V

    return-void
.end method
