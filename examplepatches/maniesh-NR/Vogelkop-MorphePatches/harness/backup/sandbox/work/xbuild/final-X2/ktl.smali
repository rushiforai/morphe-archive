.class public final Lktl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Ljtl;

.field public b:La5n;


# direct methods
.method public constructor <init>(Ljtl;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lktl;->a:Ljtl;

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lktl;->b:La5n;

    return-void
.end method
