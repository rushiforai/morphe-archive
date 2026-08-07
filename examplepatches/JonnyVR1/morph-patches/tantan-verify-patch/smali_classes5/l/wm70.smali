.class public final synthetic Ll/wm70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/an70;


# direct methods
.method public synthetic constructor <init>(Ll/an70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wm70;->a:Ll/an70;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wm70;->a:Ll/an70;

    invoke-static {p0}, Ll/an70;->a(Ll/an70;)Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    move-result-object p0

    return-object p0
.end method
