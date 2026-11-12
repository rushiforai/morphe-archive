.class public final Lpsh;
.super Lgze;
.source "SourceFile"


# instance fields
.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public final n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqtm;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqre;Luy8;Z)V
    .registers 17

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v6, p4

    move-object v3, p7

    move-object v5, p8

    invoke-direct/range {v0 .. v6}, Lgze;-><init>(Landroid/content/Context;Lywh;Lqre;Lqtm;Luy8;Ljava/lang/String;)V

    iput-object p6, p0, Lpsh;->l:Ljava/lang/String;

    iput-object p5, p0, Lpsh;->m:Ljava/lang/String;

    move/from16 p1, p9

    iput-boolean p1, p0, Lpsh;->n:Z

    return-void
.end method


# virtual methods
.method public final Q(Landroid/net/Uri$Builder;)V
    .registers 4

    const-string v0, "exclude"

    const-string v1, "summary"

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v0, "v1/related"

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lgze;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object v0, p0, Lpsh;->l:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1f

    const-string v1, "type"

    invoke-virtual {p1, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_1f
    const-string v0, "refer_reqid"

    iget-object v1, p0, Lpsh;->m:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-boolean p0, p0, Lpsh;->n:Z

    if-eqz p0, :cond_31

    const-string p0, "referrer"

    const-string v0, "push"

    invoke-virtual {p1, p0, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_31
    return-void
.end method
