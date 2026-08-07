.class public final synthetic Ll/v74;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z74;


# direct methods
.method public synthetic constructor <init>(Ll/z74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v74;->a:Ll/z74;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v74;->a:Ll/z74;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-virtual {p0, p1}, Ll/z74;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
