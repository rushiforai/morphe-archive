.class public final synthetic Ll/i34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w34;


# direct methods
.method public synthetic constructor <init>(Ll/w34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i34;->a:Ll/w34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i34;->a:Ll/w34;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    invoke-virtual {p0, p1}, Ll/w34;->L4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    return-void
.end method
