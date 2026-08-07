.class public final synthetic Ll/otq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/otq;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otq;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;

    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    invoke-static {p0, p1}, Ll/quq;->o(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    return-void
.end method
