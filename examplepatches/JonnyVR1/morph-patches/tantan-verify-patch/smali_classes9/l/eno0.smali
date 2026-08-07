.class public final synthetic Ll/eno0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gno0;


# direct methods
.method public synthetic constructor <init>(Ll/gno0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eno0;->a:Ll/gno0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eno0;->a:Ll/gno0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    invoke-static {p0, p1}, Ll/gno0;->u5(Ll/gno0;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method
