.class public final synthetic Ll/sqf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tqf0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;


# direct methods
.method public synthetic constructor <init>(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sqf0;->a:Ll/tqf0;

    iput-object p2, p0, Ll/sqf0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sqf0;->a:Ll/tqf0;

    iget-object p0, p0, Ll/sqf0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/tqf0;->c(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Boolean;)V

    return-void
.end method
