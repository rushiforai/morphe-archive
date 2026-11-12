.class public abstract Laii;
.super Liji;
.source "SourceFile"


# instance fields
.field public final w:Ljava/lang/String;

.field public final x:Lrf7;


# direct methods
.method public constructor <init>(Lmej;Ldx3;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Liji;-><init>(Lmej;Ldx3;)V

    iput-object p3, p0, Laii;->w:Ljava/lang/String;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p1

    iget-object p1, p1, Lsf7;->a:Lrf7;

    iput-object p1, p0, Laii;->x:Lrf7;

    return-void
.end method


# virtual methods
.method public final a0(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    .registers 5

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_19
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :try_start_21
    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Laii;->w:Ljava/lang/String;

    invoke-static {v0, p1, p0, p2}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0
    :try_end_31
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_31} :catch_32

    return-object p0

    :catch_32
    const/4 p0, 0x0

    return-object p0
.end method

.method public final n(Ljava/lang/String;)J
    .registers 3

    iget-object p0, p0, Laii;->x:Lrf7;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lrf7;->f(Lre7;Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0
.end method
