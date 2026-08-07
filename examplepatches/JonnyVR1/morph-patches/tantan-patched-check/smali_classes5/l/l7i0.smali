.class public final synthetic Ll/l7i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w7i0;


# direct methods
.method public synthetic constructor <init>(Ll/w7i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l7i0;->a:Ll/w7i0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7i0;->a:Ll/w7i0;

    check-cast p1, Lcom/p1/mobile/putong/data/PaymentData;

    invoke-static {p0, p1}, Ll/w7i0;->A0(Ll/w7i0;Lcom/p1/mobile/putong/data/PaymentData;)V

    return-void
.end method
