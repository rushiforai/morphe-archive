.class public final synthetic Ll/f080;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j080;


# direct methods
.method public synthetic constructor <init>(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f080;->a:Ll/j080;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f080;->a:Ll/j080;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;

    invoke-static {p0, p1}, Ll/j080;->O3(Ll/j080;Lcom/p1/mobile/putong/live/base/data/BLivePk;)V

    return-void
.end method
