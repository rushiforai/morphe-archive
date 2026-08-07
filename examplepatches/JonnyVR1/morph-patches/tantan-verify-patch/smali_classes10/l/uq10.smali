.class public final synthetic Ll/uq10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ar10;


# direct methods
.method public synthetic constructor <init>(Ll/ar10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uq10;->a:Ll/ar10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uq10;->a:Ll/ar10;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;

    invoke-virtual {p0, p1}, Ll/ar10;->z4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;)V

    return-void
.end method
