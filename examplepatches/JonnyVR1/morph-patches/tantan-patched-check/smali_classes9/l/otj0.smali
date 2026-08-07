.class public final synthetic Ll/otj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;

.field public final synthetic b:Ll/qtj0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Ll/qtj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/otj0;->a:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Ll/otj0;->b:Ll/qtj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/otj0;->a:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Ll/otj0;->b:Ll/qtj0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, p0, p1}, Ll/qtj0;->K3(Lkotlin/jvm/functions/Function0;Ll/qtj0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
