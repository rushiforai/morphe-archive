.class public final synthetic Ll/gvk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ivk0;


# direct methods
.method public synthetic constructor <init>(Ll/ivk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gvk0;->a:Ll/ivk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvk0;->a:Ll/ivk0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    invoke-static {p0, p1}, Ll/ivk0;->S2(Ll/ivk0;Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    return-void
.end method
