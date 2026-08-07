.class public final synthetic Ll/wyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ezj;


# direct methods
.method public synthetic constructor <init>(Ll/ezj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wyj;->a:Ll/ezj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wyj;->a:Ll/ezj;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    invoke-static {p0, p1}, Ll/ezj;->Z3(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V

    return-void
.end method
