.class public final synthetic Ll/akn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gkn;


# direct methods
.method public synthetic constructor <init>(Ll/gkn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/akn;->a:Ll/gkn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/akn;->a:Ll/gkn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    invoke-static {p0, p1}, Ll/gkn;->f(Ll/gkn;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)V

    return-void
.end method
