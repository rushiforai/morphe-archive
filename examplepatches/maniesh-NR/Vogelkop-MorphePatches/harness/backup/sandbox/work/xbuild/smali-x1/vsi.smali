.class public final Lvsi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:I

.field public c:Lcom/opera/android/browser/SimpleUrlLoader;

.field public d:Ltsi;

.field public e:Ltsi;

.field public f:I

.field public g:J

.field public h:I

.field public final i:Landroid/os/Handler;

.field public final j:Lh6e;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lh6e;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lvsi;->b:I

    const-wide/16 v0, 0x96

    iput-wide v0, p0, Lvsi;->g:J

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lvsi;->i:Landroid/os/Handler;

    const/16 v0, 0x7c

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_22

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_22
    iput-object p1, p0, Lvsi;->a:Ljava/lang/String;

    iput-object p2, p0, Lvsi;->j:Lh6e;

    return-void
.end method

.method public static b()Ljava/lang/String;
    .registers 4

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->getCountry()Ljava/lang/String;

    move-result-object v1

    const-string v2, "zh"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    const-string v0, "cn"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "zh-CN"

    return-object v0

    :cond_1b
    const-string v0, "tw"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    const-string v0, "zh-TW"

    return-object v0

    :cond_26
    const-string v0, "zh-HK"

    return-object v0

    :cond_29
    const-string v2, "pt"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    const-string v0, "br"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    const-string v0, "pt-BR"

    return-object v0

    :cond_3c
    const-string v0, "pt-PT"

    return-object v0

    :cond_3f
    const-string v2, "en"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_52

    const-string v2, "gb"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_62

    const-string v0, "en-GB"

    return-object v0

    :cond_52
    const-string v2, "es"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_62

    const-string v0, "es-ES"

    :cond_62
    return-object v0
.end method

.method public static d(Ljava/lang/String;Lusi;Z)Ljava/util/ArrayList;
    .registers 7

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :try_start_7
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    const-string p0, "\""

    invoke-virtual {v1, p0}, Lorg/json/JSONTokener;->skipPast(Ljava/lang/String;)V

    const/16 p0, 0x22

    invoke-virtual {v1, p0}, Lorg/json/JSONTokener;->nextString(C)Ljava/lang/String;

    const/16 p0, 0x5b

    invoke-virtual {v1, p0}, Lorg/json/JSONTokener;->skipTo(C)C
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_1b} :catch_39

    :try_start_1b
    new-instance p0, Lvpb;

    invoke-direct {p0, v1}, Lvpb;-><init>(Lorg/json/JSONTokener;)V
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_20} :catch_21
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_20} :catch_39

    goto :goto_22

    :catch_21
    const/4 p0, 0x0

    :goto_22
    if-eqz p0, :cond_39

    :try_start_24
    iget-object v1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_2b
    if-ge v2, v1, :cond_39

    invoke-interface {p1, p0, v2, p2}, Lusi;->c(Lvpb;IZ)Ldri;

    move-result-object v3

    if-eqz v3, :cond_36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_36} :catch_39

    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    :catch_39
    :cond_39
    return-object v0
.end method

.method public static e(Lvpb;I)Ldri;
    .registers 12

    invoke-virtual {p0, p1}, Lvpb;->b(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_1b

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    new-instance v0, Ldri;

    const-string v7, ""

    const/4 v6, 0x0

    const-string v2, ""

    const-string v3, ""

    const-string v4, ""

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v7}, Ldri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    return-object v0

    :cond_1b
    instance-of p1, p0, Lvpb;

    const/4 v0, 0x0

    if-eqz p1, :cond_4d

    check-cast p0, Lvpb;

    iget-object p1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    const/4 v1, 0x0

    :goto_29
    if-ge v1, p1, :cond_3a

    invoke-virtual {p0, v1}, Lvpb;->b(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_37

    check-cast v2, Ljava/lang/String;

    move-object v3, v2

    goto :goto_3b

    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    :cond_3a
    move-object v3, v0

    :goto_3b
    if-eqz v3, :cond_4d

    new-instance v2, Ldri;

    const-string v9, ""

    const/4 v8, 0x0

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v9}, Ldri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    return-object v2

    :cond_4d
    return-object v0
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget v0, p0, Lvsi;->b:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    iget-object v0, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    iget-wide v2, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_18

    invoke-static {v2, v3}, LJ/N;->Mnq_7cIN(J)V

    iput-wide v4, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    :cond_18
    iput-object v1, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    :cond_1a
    iput-object v1, p0, Lvsi;->e:Ltsi;

    iput-object v1, p0, Lvsi;->d:Ltsi;

    return-void
.end method

.method public final c(Z)V
    .registers 4

    iget v0, p0, Lvsi;->h:I

    if-lez v0, :cond_7

    if-nez p1, :cond_7

    return-void

    :cond_7
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lvsi;->h:I

    new-instance p1, Lssi;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lssi;-><init>(Ljava/lang/Object;B)V

    iget-wide v0, p0, Lvsi;->g:J

    iget-object p0, p0, Lvsi;->i:Landroid/os/Handler;

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final f(Ltsi;)V
    .registers 7

    iput-object p1, p0, Lvsi;->d:Ltsi;

    const/4 v0, 0x0

    iput-object v0, p0, Lvsi;->e:Ltsi;

    iget-object v1, p1, Ltsi;->d:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object v0

    iget-wide v1, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-eqz v3, :cond_1e

    const/16 v3, 0x14

    invoke-static {v1, v2, v3}, LJ/N;->M71SD119(JI)V

    :cond_1e
    iput-object v0, p0, Lvsi;->c:Lcom/opera/android/browser/SimpleUrlLoader;

    iget-boolean v1, p1, Ltsi;->b:Z

    new-instance v2, Lm25;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v0, p1, v3}, Lm25;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Leb;

    const/4 v3, 0x6

    invoke-direct {p1, p0, v0, v3}, Leb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-wide v3, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    invoke-static {v3, v4, v1, v2, p1}, LJ/N;->MpBW0XH2(JZLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
