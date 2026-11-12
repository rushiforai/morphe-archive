.class public final Lhom;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final l:Lftj;


# instance fields
.field public final k:Lb59;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lftj;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lftj;-><init>(B)V

    sput-object v0, Lhom;->l:Lftj;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/16 v0, 0x11

    const-string v1, "dyn.updateinfo"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v2, 0x0

    new-array v2, v2, [Lbg1;

    invoke-static {p1, v0, v1, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lhom;->k:Lb59;

    return-void
.end method

.method public static t(Landroid/content/Context;)Lhom;
    .registers 3

    sget-object v0, Lio7;->i:Lio7;

    sget-object v1, Lhom;->l:Lftj;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lhom;

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 3

    new-instance p0, Lfom;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lfom;-><init>(ILjava/lang/String;)V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 5

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_10

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    move-result-object p1

    goto :goto_11

    :cond_10
    move-object p1, v2

    :goto_11
    new-instance v1, Lfom;

    invoke-direct {v1, v0, p1}, Lfom;-><init>(ILjava/lang/String;)V

    iget-object p0, p0, Lhom;->k:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "last.version"

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const p1, 0x71de74d2

    if-ne p0, p1, :cond_2b

    return-object v1

    :cond_2b
    const-string p0, "Pkg upgraded"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v2
.end method

.method public final o()V
    .registers 3

    iget-object p0, p0, Lhom;->k:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "last.version"

    const v1, 0x71de74d2

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    return-void
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result p1

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_19

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object p0

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    new-instance v0, Lfom;

    invoke-direct {v0, p1, p0}, Lfom;-><init>(ILjava/lang/String;)V

    return-object v0
.end method
