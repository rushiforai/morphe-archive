.class public final synthetic Ll/a2t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b2t;


# direct methods
.method public synthetic constructor <init>(Ll/b2t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2t;->a:Ll/b2t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2t;->a:Ll/b2t;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    invoke-static {p0, p1}, Ll/b2t;->J3(Ll/b2t;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    return-void
.end method
