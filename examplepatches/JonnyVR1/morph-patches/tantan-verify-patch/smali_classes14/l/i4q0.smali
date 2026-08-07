.class public final synthetic Ll/i4q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0$e;

.field public final synthetic b:Lcom/p1/mobile/putong/data/ThirdPartyValidation;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignUpData;

.field public final synthetic d:Lcom/p1/mobile/putong/account/data/ThirdPartyData;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0$e;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i4q0;->a:Ll/v3q0$e;

    iput-object p2, p0, Ll/i4q0;->b:Lcom/p1/mobile/putong/data/ThirdPartyValidation;

    iput-object p3, p0, Ll/i4q0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    iput-object p4, p0, Ll/i4q0;->d:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i4q0;->a:Ll/v3q0$e;

    iget-object v1, p0, Ll/i4q0;->b:Lcom/p1/mobile/putong/data/ThirdPartyValidation;

    iget-object v2, p0, Ll/i4q0;->c:Lcom/p1/mobile/putong/data/SignUpData;

    iget-object p0, p0, Ll/i4q0;->d:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, v2, p0, p1}, Ll/v3q0$e;->i(Ll/v3q0$e;Lcom/p1/mobile/putong/data/ThirdPartyValidation;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
