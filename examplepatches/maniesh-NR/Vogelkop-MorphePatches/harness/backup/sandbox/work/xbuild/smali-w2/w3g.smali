.class public final Lw3g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lorg/chromium/url/GURL;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lorg/chromium/url/GURL;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Z

.field public final i:Z


# direct methods
.method public constructor <init>(ILorg/chromium/url/GURL;Ljava/lang/String;Ljava/lang/String;)V
    .registers 17

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move v10, v1

    goto :goto_1c

    :cond_9
    invoke-static/range {p4 .. p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "android"

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    move v10, v0

    :goto_1c
    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_24

    :goto_22
    move v11, v1

    goto :goto_37

    :cond_24
    invoke-static/range {p4 .. p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "opera-user"

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_22

    :goto_37
    if-eqz v11, :cond_3f

    invoke-static/range {p4 .. p4}, Lz5i;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_3d
    move-object v6, v0

    goto :goto_44

    :cond_3f
    invoke-virtual {p2}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v0

    goto :goto_3d

    :goto_44
    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move-object v8, p3

    move-object/from16 v9, p4

    invoke-direct/range {v2 .. v11}, Lw3g;-><init>(ILorg/chromium/url/GURL;Ljava/lang/String;Ljava/lang/String;Lorg/chromium/url/GURL;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(ILorg/chromium/url/GURL;Ljava/lang/String;Ljava/lang/String;Lorg/chromium/url/GURL;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .registers 10

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput p1, p0, Lw3g;->a:I

    .line 82
    iput-object p2, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    .line 83
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3a

    if-eqz p9, :cond_14

    .line 84
    invoke-static {p7}, Lz5i;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_3a

    :cond_14
    if-eqz p8, :cond_1b

    .line 85
    invoke-static {p7}, Lrab;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_3a

    .line 86
    :cond_1b
    invoke-virtual {p2}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_38

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p3

    const/4 p1, 0x0

    .line 87
    invoke-static {p3, p1}, LJ/N;->MnEPjazD(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p1

    .line 88
    check-cast p1, Ljava/lang/String;

    .line 89
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3a

    move-object p3, p1

    goto :goto_3a

    .line 90
    :cond_38
    const-string p3, ""

    .line 91
    :cond_3a
    :goto_3a
    iput-object p3, p0, Lw3g;->c:Ljava/lang/String;

    .line 92
    iput-object p4, p0, Lw3g;->d:Ljava/lang/String;

    .line 93
    iput-object p5, p0, Lw3g;->e:Lorg/chromium/url/GURL;

    .line 94
    iput-object p6, p0, Lw3g;->f:Ljava/lang/String;

    .line 95
    iput-object p7, p0, Lw3g;->g:Ljava/lang/String;

    .line 96
    iput-boolean p8, p0, Lw3g;->h:Z

    .line 97
    iput-boolean p9, p0, Lw3g;->i:Z

    return-void
.end method

.method public static a(Ljava/util/List;Lw3g;)I
    .registers 6

    const/4 v0, -0x1

    if-eqz p0, :cond_1c

    if-eqz p1, :cond_1c

    const/4 v1, 0x0

    :goto_6
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1c

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lw3g;

    iget v2, v2, Lw3g;->a:I

    iget v3, p1, Lw3g;->a:I

    if-ne v2, v3, :cond_19

    return v1

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_1c
    return v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_4a

    const-class v2, Lw3g;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_4a

    check-cast p1, Lw3g;

    iget v2, p0, Lw3g;->a:I

    iget v3, p1, Lw3g;->a:I

    if-ne v2, v3, :cond_4a

    iget-object v2, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v3, p1, Lw3g;->b:Lorg/chromium/url/GURL;

    invoke-virtual {v2, v3}, Lorg/chromium/url/GURL;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    iget-object v2, p0, Lw3g;->c:Ljava/lang/String;

    iget-object v3, p1, Lw3g;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    iget-object v2, p0, Lw3g;->d:Ljava/lang/String;

    iget-object v3, p1, Lw3g;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    iget-object v2, p0, Lw3g;->f:Ljava/lang/String;

    iget-object v3, p1, Lw3g;->f:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    iget-object p0, p0, Lw3g;->g:Ljava/lang/String;

    iget-object p1, p1, Lw3g;->g:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4a

    return v0

    :cond_4a
    return v1
.end method

.method public final hashCode()I
    .registers 8

    iget v0, p0, Lw3g;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v5, p0, Lw3g;->f:Ljava/lang/String;

    iget-object v6, p0, Lw3g;->g:Ljava/lang/String;

    iget-object v2, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v3, p0, Lw3g;->c:Ljava/lang/String;

    iget-object v4, p0, Lw3g;->d:Ljava/lang/String;

    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
