.class public final synthetic Ll/klp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ll/olp;

.field public final synthetic b:Ll/rfh0$a;


# direct methods
.method public synthetic constructor <init>(Ll/olp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/klp;->a:Ll/olp;

    iput-object p2, p0, Ll/klp;->b:Ll/rfh0$a;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/klp;->a:Ll/olp;

    iget-object p0, p0, Ll/klp;->b:Ll/rfh0$a;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p2, Lcom/p1/mobile/android/app/Act;

    check-cast p3, Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Ll/olp;->i(Ll/olp;Ll/rfh0$a;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
