.class public final Lr7d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lt02;

.field public final b:Lp12;

.field public c:Lor2;


# direct methods
.method public constructor <init>(Lt02;Lp12;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr7d;->a:Lt02;

    iput-object p2, p0, Lr7d;->b:Lp12;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 11

    iget-object v0, p0, Lr7d;->b:Lp12;

    iget-object v0, v0, Lp12;->h:Ljava/lang/Object;

    check-cast v0, Ltsd;

    new-instance v1, Lci7;

    const/4 v7, 0x0

    const/16 v8, 0x1b

    const/4 v2, 0x1

    const-class v4, Lr7d;

    const-string v5, "updateBannerView"

    const-string v6, "updateBannerView(Lcom/opera/android/mainmenu/MainMenuVpnProBannerState;)V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance p0, Liwa;

    const/4 v2, 0x6

    invoke-direct {p0, v1, v2}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
