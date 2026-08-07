.class public final synthetic Ll/sai0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/uai0;


# direct methods
.method public synthetic constructor <init>(Ll/uai0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sai0;->a:Ll/uai0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sai0;->a:Ll/uai0;

    invoke-static {p0}, Ll/uai0;->d(Ll/uai0;)Lcom/p1/mobile/account_core/network/ApiCallBack;

    move-result-object p0

    return-object p0
.end method
