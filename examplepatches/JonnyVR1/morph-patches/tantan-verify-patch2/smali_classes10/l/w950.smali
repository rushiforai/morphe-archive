.class public final synthetic Ll/w950;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ea50;


# direct methods
.method public synthetic constructor <init>(Ll/ea50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w950;->a:Ll/ea50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w950;->a:Ll/ea50;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {p0, p1}, Ll/ea50;->U3(Ll/ea50;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method
