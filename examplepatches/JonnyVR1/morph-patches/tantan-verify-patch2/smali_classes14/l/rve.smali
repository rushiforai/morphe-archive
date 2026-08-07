.class public final synthetic Ll/rve;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b30;


# instance fields
.field public final synthetic a:Ll/sve;


# direct methods
.method public synthetic constructor <init>(Ll/sve;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rve;->a:Ll/sve;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rve;->a:Ll/sve;

    check-cast p1, Ljava/lang/Throwable;

    check-cast p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    check-cast p3, Ljava/lang/Runnable;

    check-cast p4, Lcom/p1/mobile/putong/data/SignInGrantType;

    invoke-static {p0, p1, p2, p3, p4}, Ll/sve;->V0(Ll/sve;Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V

    return-void
.end method
