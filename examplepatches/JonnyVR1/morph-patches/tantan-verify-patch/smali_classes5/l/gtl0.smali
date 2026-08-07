.class public final synthetic Ll/gtl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ktl0;


# direct methods
.method public synthetic constructor <init>(Ll/ktl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gtl0;->a:Ll/ktl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gtl0;->a:Ll/ktl0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    invoke-static {p0, p1}, Ll/ktl0;->h0(Ll/ktl0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method
