.class public final synthetic Ll/g270;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l270;


# direct methods
.method public synthetic constructor <init>(Ll/l270;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g270;->a:Ll/l270;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g270;->a:Ll/l270;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;

    invoke-static {p0, p1}, Ll/l270;->U0(Ll/l270;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method
