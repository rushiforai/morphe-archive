.class public final synthetic Ll/g310;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/s310;


# direct methods
.method public synthetic constructor <init>(Ll/s310;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g310;->a:Ll/s310;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g310;->a:Ll/s310;

    invoke-static {p0}, Ll/s310;->s(Ll/s310;)Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    move-result-object p0

    return-object p0
.end method
