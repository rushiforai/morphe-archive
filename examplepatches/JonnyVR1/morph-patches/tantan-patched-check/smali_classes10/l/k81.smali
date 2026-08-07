.class public final synthetic Ll/k81;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o81;


# direct methods
.method public synthetic constructor <init>(Ll/o81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k81;->a:Ll/o81;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k81;->a:Ll/o81;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    invoke-static {p0, p1}, Ll/o81;->T3(Ll/o81;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V

    return-void
.end method
