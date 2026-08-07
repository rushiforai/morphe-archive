.class public final synthetic Ll/y7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b8o;


# direct methods
.method public synthetic constructor <init>(Ll/b8o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y7o;->a:Ll/b8o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7o;->a:Ll/b8o;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    invoke-static {p0, p1}, Ll/b8o;->g(Ll/b8o;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method
