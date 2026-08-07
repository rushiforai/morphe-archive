.class public final synthetic Ll/ymn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ann0;


# direct methods
.method public synthetic constructor <init>(Ll/ann0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ymn0;->a:Ll/ann0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymn0;->a:Ll/ann0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    invoke-static {p0, p1}, Ll/ann0;->L3(Ll/ann0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method
