.class public final Lxbk;
.super Li7c;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lz43;


# direct methods
.method public constructor <init>(Lz43;)V
    .registers 2

    iput-object p1, p0, Lxbk;->d:Lz43;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Li7c;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lxbk;->d:Lz43;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lz43;->r(Landroid/content/Context;)Lzsf;

    move-result-object p0

    return-object p0
.end method
