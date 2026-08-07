.class public final synthetic Ll/kf80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ig80;


# direct methods
.method public synthetic constructor <init>(Ll/ig80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kf80;->a:Ll/ig80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf80;->a:Ll/ig80;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    invoke-virtual {p0, p1}, Ll/ig80;->O4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    return-void
.end method
