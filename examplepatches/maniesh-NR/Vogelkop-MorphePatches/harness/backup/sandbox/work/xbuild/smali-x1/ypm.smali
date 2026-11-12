.class public final Lypm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:Lypm;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Lzg;

.field public final h:Z

.field public final i:Z

.field public final j:Z

.field public final k:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lypm;

    invoke-direct {v0}, Lypm;-><init>()V

    sput-object v0, Lypm;->l:Lypm;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    const-string v0, ""

    iput-object v0, p0, Lypm;->a:Ljava/lang/String;

    .line 238
    iput-object v0, p0, Lypm;->b:Ljava/lang/String;

    .line 239
    iput-object v0, p0, Lypm;->c:Ljava/lang/String;

    .line 240
    iput-object v0, p0, Lypm;->d:Ljava/lang/String;

    .line 241
    iput-object v0, p0, Lypm;->e:Ljava/lang/String;

    .line 242
    iput-object v0, p0, Lypm;->f:Ljava/lang/String;

    const/4 v0, 0x0

    .line 243
    iput-object v0, p0, Lypm;->g:Lzg;

    const/4 v0, 0x0

    .line 244
    iput-boolean v0, p0, Lypm;->i:Z

    .line 245
    iput-boolean v0, p0, Lypm;->h:Z

    .line 246
    iput-boolean v0, p0, Lypm;->j:Z

    .line 247
    iput-boolean v0, p0, Lypm;->k:Z

    return-void
.end method

.method public constructor <init>(Lb2l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->g0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->r(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-static {v0}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_13
    iput-object v0, p0, Lypm;->a:Ljava/lang/String;

    iget-object v0, p1, Ld7l;->e:Lw6j;

    invoke-virtual {v0}, Lw6j;->h()Lknf;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-interface {v0}, Lknf;->z()Ljava/lang/String;

    move-result-object v0

    goto :goto_2c

    :cond_22
    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->getEditableString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2c
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/16 v4, 0x3e8

    if-lt v1, v4, :cond_58

    const-string v1, "data:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_58

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/2addr v1, v3

    if-eqz v1, :cond_58

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    if-le v4, v1, :cond_58

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "uri-content"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_58
    iput-object v0, p0, Lypm;->b:Ljava/lang/String;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lypm;->c:Ljava/lang/String;

    invoke-virtual {p1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lypm;->d:Ljava/lang/String;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lypm;->e:Ljava/lang/String;

    new-instance v1, Lorg/chromium/url/GURL;

    invoke-direct {v1, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, LJ/N;->MKonq97J(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_80

    invoke-static {v1}, LJ/N;->M6gdEujY(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_84

    :cond_80
    invoke-virtual {p1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v1

    :goto_84
    iput-object v1, p0, Lypm;->f:Ljava/lang/String;

    iget-object v1, p1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->b(Ljava/lang/String;)Lzg;

    move-result-object v1

    iput-object v1, p0, Lypm;->g:Lzg;

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lypm;->i:Z

    invoke-static {v0}, Lwqm;->A(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_da

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_da

    if-nez v1, :cond_da

    iget-object v1, p1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_da

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_da

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_da

    const-string v1, "jump"

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->getAuthority(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_da

    const-string v1, "market://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_da

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->c0()Z

    move-result v0

    if-eqz v0, :cond_db

    :cond_da
    move v2, v3

    :cond_db
    iput-boolean v2, p0, Lypm;->h:Z

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    iput-boolean v0, p0, Lypm;->j:Z

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    iput-boolean p1, p0, Lypm;->k:Z

    return-void
.end method
