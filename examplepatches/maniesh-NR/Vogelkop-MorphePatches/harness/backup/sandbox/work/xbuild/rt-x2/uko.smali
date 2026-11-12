.class public final Luko;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lylo;


# instance fields
.field public final a:Lvlo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh61;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lh61;-><init>(Landroid/content/Context;Z)V

    sget-object p1, Lmpo;->a:Lurj;

    invoke-static {p1}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object p1

    new-instance v2, Lrgh;

    sget-object v3, Lkkp;->a:Ldrj;

    invoke-direct {v2, v0, v3}, Lrgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Loam;

    invoke-direct {v3, v1, v0, p1, v2}, Loam;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v3}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object p1

    new-instance v0, Luko;

    invoke-direct {v0, p1}, Luko;-><init>(Lvlo;)V

    invoke-static {v0}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object v0

    new-instance v2, Ljvg;

    const/16 v3, 0x10

    invoke-direct {v2, v3, p1, v0, v1}, Ljvg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-static {v2}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object p1

    iput-object p1, p0, Luko;->a:Lvlo;

    return-void
.end method

.method public constructor <init>(Lvlo;)V
    .registers 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luko;->a:Lvlo;

    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Luko;->a:Lvlo;

    invoke-virtual {p0}, Lvlo;->a()Ljava/lang/Object;

    move-result-object p0

    new-instance v0, Leqo;

    check-cast p0, Lypo;

    invoke-direct {v0, p0}, Leqo;-><init>(Lypo;)V

    return-object v0
.end method
