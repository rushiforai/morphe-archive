.class public final synthetic Ll/bnp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gnp;


# direct methods
.method public synthetic constructor <init>(Ll/gnp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bnp;->a:Ll/gnp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnp;->a:Ll/gnp;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    invoke-static {p0, p1}, Ll/gnp;->n0(Ll/gnp;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method
