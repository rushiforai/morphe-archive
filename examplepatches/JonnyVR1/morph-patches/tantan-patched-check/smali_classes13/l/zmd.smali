.class public final synthetic Ll/zmd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rg50;


# direct methods
.method public synthetic constructor <init>(Ll/rg50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zmd;->a:Ll/rg50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmd;->a:Ll/rg50;

    check-cast p1, Ll/x1d0;

    invoke-static {p0, p1}, Lcom/p1/mobile/account_core/network/DefaultCall;->a(Ll/rg50;Ll/x1d0;)Ll/rg50;

    move-result-object p0

    return-object p0
.end method
