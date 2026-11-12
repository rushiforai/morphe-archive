.class public final Lgy8;
.super Lzx8;
.source "SourceFile"


# instance fields
.field public final m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 15
    const-string v0, "like"

    invoke-direct {p0, p1, v0, p3}, Lzx8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    iput-object p2, p0, Lgy8;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 4

    const-string v0, "like"

    invoke-direct {p0, p1, v0}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    const-string v0, "value"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lgy8;->m:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 3

    invoke-super {p0, p1}, Lzx8;->a(Lorb;)V

    iget-object p0, p0, Lgy8;->m:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "value"

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_10
    return-void
.end method
