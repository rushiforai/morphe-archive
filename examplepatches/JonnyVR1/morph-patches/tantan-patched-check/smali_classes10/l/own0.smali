.class public final synthetic Ll/own0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rwn0;


# direct methods
.method public synthetic constructor <init>(Ll/rwn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/own0;->a:Ll/rwn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/own0;->a:Ll/rwn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    invoke-static {p0, p1}, Ll/rwn0;->z2(Ll/rwn0;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
