.class public final synthetic Ll/mgg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qgg;


# direct methods
.method public synthetic constructor <init>(Ll/qgg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mgg;->a:Ll/qgg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgg;->a:Ll/qgg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;

    invoke-static {p0, p1}, Ll/qgg;->h0(Ll/qgg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupCountBean;)V

    return-void
.end method
