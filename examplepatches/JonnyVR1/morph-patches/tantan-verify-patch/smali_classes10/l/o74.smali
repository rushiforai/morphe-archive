.class public final synthetic Ll/o74;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z74;

.field public final synthetic b:Ll/qop0;


# direct methods
.method public synthetic constructor <init>(Ll/z74;Ll/qop0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o74;->a:Ll/z74;

    iput-object p2, p0, Ll/o74;->b:Ll/qop0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o74;->a:Ll/z74;

    iget-object p0, p0, Ll/o74;->b:Ll/qop0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {v0, p0, p1}, Ll/z74;->V3(Ll/z74;Ll/qop0;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
