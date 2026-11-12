.class public final Legd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lre7;

.field public final b:Landroid/net/Uri;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .registers 4

    const/4 v0, 0x0

    const/high16 v1, -0x80000000

    .line 20
    invoke-direct {p0, p1, v0, v1}, Legd;-><init>(Landroid/net/Uri;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;I)V
    .registers 5

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Legd;->a:Lre7;

    .line 23
    iput-object p1, p0, Legd;->b:Landroid/net/Uri;

    .line 24
    iput-object p2, p0, Legd;->c:Ljava/lang/String;

    const/4 p1, -0x1

    .line 25
    iput p1, p0, Legd;->d:I

    .line 26
    iput p3, p0, Legd;->e:I

    return-void
.end method

.method public constructor <init>(Lre7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Legd;->a:Lre7;

    const/4 v0, 0x0

    iput-object v0, p0, Legd;->b:Landroid/net/Uri;

    iget-object p1, p1, Lre7;->m:Ljava/lang/String;

    iput-object p1, p0, Legd;->c:Ljava/lang/String;

    const/4 p1, -0x1

    iput p1, p0, Legd;->d:I

    const/high16 p1, -0x80000000

    iput p1, p0, Legd;->e:I

    return-void
.end method

.method public constructor <init>(Lre7;Landroid/net/Uri;Ljava/lang/String;II)V
    .registers 6

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Legd;->a:Lre7;

    .line 29
    iput-object p2, p0, Legd;->b:Landroid/net/Uri;

    .line 30
    iput-object p3, p0, Legd;->c:Ljava/lang/String;

    .line 31
    iput p4, p0, Legd;->d:I

    .line 32
    iput p5, p0, Legd;->e:I

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Legd;->a:Lre7;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lre7;->f()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    invoke-virtual {p0}, Legd;->c()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_18
    return-object v0
.end method

.method public final b()Lo29;
    .registers 3

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v0

    invoke-virtual {p0}, Legd;->c()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Legd;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object p0

    return-object p0
.end method

.method public final c()Landroid/net/Uri;
    .registers 2

    iget-object v0, p0, Legd;->a:Lre7;

    if-nez v0, :cond_7

    iget-object p0, p0, Legd;->b:Landroid/net/Uri;

    return-object p0

    :cond_7
    invoke-virtual {v0}, Lre7;->k()Z

    move-result p0

    if-eqz p0, :cond_16

    invoke-virtual {v0}, Lre7;->e()Ldd7;

    move-result-object p0

    invoke-virtual {p0}, Ldd7;->i()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_16
    iget-object p0, v0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_38

    const-class v2, Legd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_38

    check-cast p1, Legd;

    iget v2, p0, Legd;->d:I

    iget v3, p1, Legd;->d:I

    if-ne v2, v3, :cond_38

    iget v2, p0, Legd;->e:I

    iget v3, p1, Legd;->e:I

    if-ne v2, v3, :cond_38

    iget-object v2, p0, Legd;->a:Lre7;

    iget-object v3, p1, Legd;->a:Lre7;

    if-ne v2, v3, :cond_38

    iget-object v2, p0, Legd;->b:Landroid/net/Uri;

    iget-object v3, p1, Legd;->b:Landroid/net/Uri;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    iget-object p0, p0, Legd;->c:Ljava/lang/String;

    iget-object p1, p1, Legd;->c:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_38

    return v0

    :cond_38
    return v1
.end method

.method public final hashCode()I
    .registers 5

    iget v0, p0, Legd;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Legd;->e:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Legd;->a:Lre7;

    iget-object v3, p0, Legd;->b:Landroid/net/Uri;

    iget-object p0, p0, Legd;->c:Ljava/lang/String;

    filled-new-array {v2, v3, p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
