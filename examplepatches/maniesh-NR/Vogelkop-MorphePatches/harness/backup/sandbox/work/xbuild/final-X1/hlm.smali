.class public final Lhlm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcl;

.field public final b:Landroid/content/Context;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhlm;->a:Ltcl;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lhlm;->b:Landroid/content/Context;

    new-instance p1, Lp7l;

    const/16 p2, 0x1a

    invoke-direct {p1, p0, p2}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhlm;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lrii;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lhlm;->a:Ltcl;

    check-cast p0, Lumi;

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
