.class public final synthetic Ll/f4q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ll/v3q0$e;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f4q0;->a:Ll/v3q0$e;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f4q0;->a:Ll/v3q0$e;

    check-cast p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    check-cast p2, Lcom/p1/mobile/putong/data/ThirdPartyValidation;

    check-cast p3, Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {p0, p1, p2, p3}, Ll/v3q0$e;->n(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method
