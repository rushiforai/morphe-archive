.class public final synthetic Ll/mys;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/oys;


# direct methods
.method public synthetic constructor <init>(Ll/oys;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mys;->a:Ll/oys;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mys;->a:Ll/oys;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    invoke-static {p0, p1}, Ll/oys;->U2(Ll/oys;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method
