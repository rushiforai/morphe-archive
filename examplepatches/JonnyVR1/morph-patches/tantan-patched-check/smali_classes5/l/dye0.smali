.class public final synthetic Ll/dye0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dye0;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dye0;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->t1(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    return-void
.end method
