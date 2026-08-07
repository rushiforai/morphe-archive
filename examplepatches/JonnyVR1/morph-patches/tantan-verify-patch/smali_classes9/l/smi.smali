.class public final synthetic Ll/smi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tmi;


# direct methods
.method public synthetic constructor <init>(Ll/tmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/smi;->a:Ll/tmi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smi;->a:Ll/tmi;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    invoke-static {p0, p1}, Ll/tmi;->N3(Ll/tmi;Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    return-void
.end method
