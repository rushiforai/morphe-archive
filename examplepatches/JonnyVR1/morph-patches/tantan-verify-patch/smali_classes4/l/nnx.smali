.class public final synthetic Ll/nnx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/xnx;


# direct methods
.method public synthetic constructor <init>(Ll/xnx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nnx;->a:Ll/xnx;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnx;->a:Ll/xnx;

    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    invoke-static {p0, p1}, Ll/xnx;->n(Ll/xnx;Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
