.class public final synthetic Ll/a49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f49;


# direct methods
.method public synthetic constructor <init>(Ll/f49;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a49;->a:Ll/f49;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a49;->a:Ll/f49;

    check-cast p1, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    invoke-static {p0, p1}, Ll/f49;->q3(Ll/f49;Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V

    return-void
.end method
