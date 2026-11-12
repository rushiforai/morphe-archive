.class public final Lbuj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lumi;

.field public final c:Ldu3;

.field public final d:Lysj;

.field public final e:Lx5f;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Ldu3;Lysj;Lx5f;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbuj;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lbuj;->b:Lumi;

    iput-object p3, p0, Lbuj;->c:Ldu3;

    iput-object p4, p0, Lbuj;->d:Lysj;

    iput-object p5, p0, Lbuj;->e:Lx5f;

    sget-object p0, Lnb6;->j:Lqie;

    if-eqz p0, :cond_12

    return-void

    :cond_12
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Loz7;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-static {p0}, Lcs5;->v(Landroid/content/Context;)Lvh9;

    move-result-object p1

    if-nez p1, :cond_2d

    new-instance p1, Lvh9;

    new-instance p2, Lth9;

    const p3, 0x7f030008

    const-string p4, "Noto Color Emoji Compat"

    invoke-direct {p2, p4, p3}, Lth9;-><init>(Ljava/lang/String;I)V

    invoke-direct {p1, p0, p2}, Lvh9;-><init>(Landroid/content/Context;Lth9;)V

    :cond_2d
    const/4 p2, 0x1

    iput-boolean p2, p1, Ltx7;->b:Z

    invoke-static {p0, p1}, Loz7;->a(Landroid/content/Context;Lvh9;)Z

    new-instance p0, Lqie;

    const/16 p1, 0x16

    invoke-direct {p0, p1}, Lqie;-><init>(B)V

    sput-object p0, Lnb6;->j:Lqie;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    const/16 v0, 0x1388

    iget-object p0, p0, Lbuj;->d:Lysj;

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
