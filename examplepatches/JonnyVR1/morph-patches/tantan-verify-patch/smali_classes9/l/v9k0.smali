.class public final synthetic Ll/v9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w9k0;


# direct methods
.method public synthetic constructor <init>(Ll/w9k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v9k0;->a:Ll/w9k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v9k0;->a:Ll/w9k0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {p0, p1}, Ll/w9k0;->j4(Ll/w9k0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
