.class public final synthetic Ll/lso;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lso;->a:Ll/vto;

    iput-object p2, p0, Ll/lso;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lso;->a:Ll/vto;

    iget-object p0, p0, Ll/lso;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    invoke-static {v0, p0, p1}, Ll/vto;->t(Ll/vto;Ljava/lang/String;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
