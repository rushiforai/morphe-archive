.class public Ll/vsl0;
.super Ll/nul0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nul0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/br2;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget-object p0, p0, Ll/br2;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-static {p1, v0, p0, v1, v2}, Ll/bn60;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
