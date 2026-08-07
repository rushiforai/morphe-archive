.class public final synthetic Ll/t7s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w7s;


# direct methods
.method public synthetic constructor <init>(Ll/w7s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t7s;->a:Ll/w7s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7s;->a:Ll/w7s;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    invoke-static {p0, p1}, Ll/w7s;->e0(Ll/w7s;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method
