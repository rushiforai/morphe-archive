.class public final synthetic Ll/kis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bjs;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kis;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kis;->a:Ll/bjs;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    invoke-static {p0, p1}, Ll/bjs;->s4(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    return-void
.end method
