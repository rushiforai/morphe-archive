.class public final synthetic Ll/izn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pzn;


# direct methods
.method public synthetic constructor <init>(Ll/pzn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/izn;->a:Ll/pzn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/izn;->a:Ll/pzn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    invoke-static {p0, p1}, Ll/pzn;->S2(Ll/pzn;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    return-void
.end method
