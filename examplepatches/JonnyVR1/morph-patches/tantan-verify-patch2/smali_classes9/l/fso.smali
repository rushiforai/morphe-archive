.class public final synthetic Ll/fso;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hso$a;


# direct methods
.method public synthetic constructor <init>(Ll/hso$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fso;->a:Ll/hso$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fso;->a:Ll/hso$a;

    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    invoke-static {p0, p1}, Ll/hso$a;->g(Ll/hso$a;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    return-void
.end method
