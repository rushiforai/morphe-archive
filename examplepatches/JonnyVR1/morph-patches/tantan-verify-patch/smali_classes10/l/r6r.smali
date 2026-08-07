.class public final synthetic Ll/r6r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x6r;


# direct methods
.method public synthetic constructor <init>(Ll/x6r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r6r;->a:Ll/x6r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r6r;->a:Ll/x6r;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    invoke-static {p0, p1}, Ll/x6r;->J3(Ll/x6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    return-void
.end method
