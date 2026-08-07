.class public final synthetic Ll/n6o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n6o0;->a:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6o0;->a:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    invoke-static {p0, p1}, Ll/w6o0;->b(Ljava/util/HashMap;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method
