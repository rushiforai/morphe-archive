.class public final synthetic Ll/f2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j2s;


# direct methods
.method public synthetic constructor <init>(Ll/j2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2s;->a:Ll/j2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f2s;->a:Ll/j2s;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {p0, p1}, Ll/j2s;->d(Ll/j2s;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
