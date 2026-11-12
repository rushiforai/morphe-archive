.class public final Lojn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfp1;

.field public final b:Lumi;

.field public final c:Lfjn;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lfp1;Lumi;Lfjn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lojn;->a:Lfp1;

    iput-object p2, p0, Lojn;->b:Lumi;

    iput-object p3, p0, Lojn;->c:Lfjn;

    new-instance p1, Lijn;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lijn;-><init>(Lojn;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lojn;->d:Lzyk;

    new-instance p1, Lijn;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lijn;-><init>(Lojn;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lojn;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object p0, p0, Lojn;->c:Lfjn;

    iget-object v0, p0, Lfjn;->d:Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v3, Lck0;->r:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lau0;

    iget-object v1, v1, Lau0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfu0;

    iget-object v1, v1, Lfu0;->a:Lh66;

    const/16 v3, 0xd

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Lfjn;->b:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "crypto.wallet.wallet_removed"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method
