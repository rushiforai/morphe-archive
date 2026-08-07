.class public final synthetic Ll/rci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vci0;


# direct methods
.method public synthetic constructor <init>(Ll/vci0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rci0;->a:Ll/vci0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rci0;->a:Ll/vci0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    invoke-static {p0, p1}, Ll/vci0;->M(Ll/vci0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method
