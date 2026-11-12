.class public Ll6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leri;


# static fields
.field public static final k:Lhr5;


# instance fields
.field public b:J

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public g:Lpqk;

.field public final h:I

.field public i:Lwzg;

.field public j:Lvsi;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lhr5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ll6e;->k:Lhr5;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Ll6e;->b:J

    sget-object v0, Ll6e;->k:Lhr5;

    iput-object v0, p0, Ll6e;->g:Lpqk;

    iput-object p2, p0, Ll6e;->c:Ljava/lang/String;

    iput-object p3, p0, Ll6e;->d:Ljava/lang/String;

    iput-object p4, p0, Ll6e;->e:Ljava/lang/String;

    iput-object p5, p0, Ll6e;->f:Ljava/lang/String;

    iput p1, p0, Ll6e;->h:I

    return-void
.end method

.method public static o(Llsc;Lsce;)Llsc;
    .registers 6

    const/4 v0, 0x1

    iput-boolean v0, p0, Lksc;->c:Z

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(I)V

    iget-object v2, p1, Lsce;->c:Lesd;

    iget-object v2, v2, Lesd;->a:Ljava/lang/String;

    const-string v3, "Content-Type"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v1, p0, Lksc;->f:Ljava/util/HashMap;

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v2, Lme2;

    new-instance v3, Ljql;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    invoke-direct {v2, v1, v3, v0}, Lme2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lslh;

    invoke-direct {v3, v2}, Lslh;-><init>(Lnmj;)V

    const/4 v2, 0x0

    :try_start_28
    invoke-virtual {p1, v3, v2}, Lsce;->a(Lu04;Z)J

    invoke-virtual {v3}, Lslh;->flush()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_2e} :catch_42

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-static {p1}, LJ/N;->MugoAW_d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    new-instance v1, Lorg/chromium/content_public/common/ResourceRequestBody;

    invoke-direct {v1, p1}, Lorg/chromium/content_public/common/ResourceRequestBody;-><init>([B)V

    iput-object v1, p0, Lksc;->i:Lorg/chromium/content_public/common/ResourceRequestBody;

    iput-boolean v0, p0, Lksc;->c:Z

    return-object p0

    :catch_42
    new-instance p0, Llsc;

    const-string p1, ""

    invoke-direct {p0, p1, v2}, Lksc;-><init>(Ljava/lang/String;I)V

    return-object p0
.end method

.method public static p(Ljava/lang/String;)Z
    .registers 6

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_f
    if-ge v2, v0, :cond_20

    aget-object v3, p0, v2

    const-string v4, "google"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    const/4 p0, 0x1

    return p0

    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_20
    return v1
.end method


# virtual methods
.method public a(ILp6l;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-static {p3}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "%i"

    const-string p3, "10"

    iget-object p0, p0, Ll6e;->d:Ljava/lang/String;

    invoke-virtual {p0, p2, p3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "%s"

    invoke-virtual {p0, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    const-string v0, "{searchTerms}"

    if-nez p3, :cond_23

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_23

    invoke-static {p0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_23
    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b()Z
    .registers 2

    iget p0, p0, Ll6e;->h:I

    const/4 v0, 0x5

    if-ne p0, v0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public c()Z
    .registers 1

    instance-of p0, p0, Lfco;

    return p0
.end method

.method public final cancel()V
    .registers 1

    iget-object p0, p0, Ll6e;->j:Lvsi;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lvsi;->a()V

    :cond_7
    return-void
.end method

.method public final d()Z
    .registers 2

    iget p0, p0, Ll6e;->h:I

    const/4 v0, 0x5

    if-ne p0, v0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public e()Z
    .registers 1

    instance-of p0, p0, Ll42;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 8

    if-eq p0, p1, :cond_5e

    instance-of v0, p1, Ll6e;

    if-eqz v0, :cond_60

    check-cast p1, Ll6e;

    iget-wide v0, p0, Ll6e;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_60

    iget-wide v4, p1, Ll6e;->b:J

    cmp-long v2, v4, v2

    if-ltz v2, :cond_60

    cmp-long v0, v0, v4

    if-nez v0, :cond_60

    iget-object v0, p0, Ll6e;->c:Ljava/lang/String;

    iget-object v1, p1, Ll6e;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Ll6e;->d:Ljava/lang/String;

    iget-object v1, p1, Ll6e;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Ll6e;->e:Ljava/lang/String;

    iget-object v1, p1, Ll6e;->e:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Ll6e;->f:Ljava/lang/String;

    iget-object v1, p1, Ll6e;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Ll6e;->g:Lpqk;

    iget-object v1, p1, Ll6e;->g:Lpqk;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget v0, p0, Ll6e;->h:I

    iget v1, p1, Ll6e;->h:I

    if-ne v0, v1, :cond_60

    iget-object v0, p0, Ll6e;->i:Lwzg;

    iget-object v1, p1, Ll6e;->i:Lwzg;

    if-ne v0, v1, :cond_60

    iget-object p0, p0, Ll6e;->j:Lvsi;

    iget-object p1, p1, Ll6e;->j:Lvsi;

    if-ne p0, p1, :cond_60

    :cond_5e
    const/4 p0, 0x1

    return p0

    :cond_60
    const/4 p0, 0x0

    return p0
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Ll6e;->f:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public g([BLandroid/util/Size;Landroid/util/Size;Ljava/lang/String;)Llsc;
    .registers 5

    new-instance p0, Llsc;

    const-string p1, ""

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lksc;-><init>(Ljava/lang/String;I)V

    return-object p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Ll6e;->b:J

    return-wide v0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ll6e;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ll6e;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final h(Leh7;Lcom/opera/api/Callback;)Lhh4;
    .registers 8

    const/4 v0, 0x0

    sget-object v1, Lhh4;->Po:Lgpk;

    iget-object v2, p0, Ll6e;->e:Ljava/lang/String;

    if-eqz v2, :cond_70

    iget-object p0, p0, Ll6e;->i:Lwzg;

    if-eqz p0, :cond_70

    invoke-static {v2}, Lwzg;->b(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_30

    sget-object p0, Lyne;->b:Ldeg;

    new-instance v0, Ljava/io/File;

    invoke-static {v2}, Lcom/opera/android/browser/obml/Platform;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ldeg;->h(Ljava/io/File;)Ldwh;

    move-result-object p0

    if-eqz p1, :cond_27

    iget-object v0, p0, Ldwh;->b:Lgvh;

    invoke-virtual {v0, p1}, Lgvh;->c(Le2m;)V

    :cond_27
    new-instance p1, Lphi;

    invoke-direct {p1, p2}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {p0, p1}, Ldwh;->f(Lacl;)V

    return-object p1

    :cond_30
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3a

    invoke-interface {p2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1

    :cond_3a
    iget-object v3, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast v3, Landroid/content/res/Resources;

    iget-object p0, p0, Lwzg;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const-string v4, "drawable"

    invoke-virtual {v3, v2, v4, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_4e

    invoke-interface {p2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1

    :cond_4e
    sget-object v1, Lyne;->b:Ldeg;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p0, :cond_6a

    new-instance v2, Ldwh;

    invoke-direct {v2, v1, v0, p0}, Ldwh;-><init>(Ldeg;Landroid/net/Uri;I)V

    if-eqz p1, :cond_61

    iget-object p0, v2, Ldwh;->b:Lgvh;

    invoke-virtual {p0, p1}, Lgvh;->c(Le2m;)V

    :cond_61
    new-instance p0, Lphi;

    invoke-direct {p0, p2}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v2, p0}, Ldwh;->f(Lacl;)V

    return-object p0

    :cond_6a
    const-string p0, "Resource ID must not be zero."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v0

    :cond_70
    invoke-interface {p2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v1
.end method

.method public final hashCode()I
    .registers 10

    iget-wide v0, p0, Ll6e;->b:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_d

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    return p0

    :cond_d
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v5, p0, Ll6e;->g:Lpqk;

    iget-object v7, p0, Ll6e;->i:Lwzg;

    iget-object v8, p0, Ll6e;->j:Lvsi;

    iget v1, p0, Ll6e;->h:I

    invoke-static {v1}, Lvep;->c(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v1, p0, Ll6e;->c:Ljava/lang/String;

    iget-object v2, p0, Ll6e;->d:Ljava/lang/String;

    iget-object v3, p0, Ll6e;->e:Ljava/lang/String;

    iget-object v4, p0, Ll6e;->f:Ljava/lang/String;

    filled-new-array/range {v0 .. v8}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final i(Ljava/lang/String;ZLtn;)V
    .registers 11

    iget-object v0, p0, Ll6e;->j:Lvsi;

    if-nez v0, :cond_21

    iget-object v0, p0, Ll6e;->f:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1b

    new-instance v1, Lvsi;

    iget-object v2, p0, Ll6e;->g:Lpqk;

    invoke-virtual {p0, v2}, Ll6e;->n(Lpqk;)Lh6e;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lvsi;-><init>(Ljava/lang/String;Lh6e;)V

    iput-object v1, p0, Ll6e;->j:Lvsi;

    move-object v0, v1

    goto :goto_21

    :cond_1b
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p3, p0}, Ltn;->L(Ljava/util/List;)V

    return-void

    :cond_21
    :goto_21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_b2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/16 v1, 0x100

    if-gt p0, v1, :cond_b2

    const/4 p0, 0x1

    const/4 v1, 0x0

    :try_start_31
    invoke-static {p1}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lvsi;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    sget-object v5, Leti;->c:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    :goto_46
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_74

    invoke-virtual {v3, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_53
    .catch Ljava/net/MalformedURLException; {:try_start_31 .. :try_end_53} :catch_83

    const-string v6, "locale"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_68

    const-string v6, "query"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_66

    :try_start_63
    const-string v5, ""

    goto :goto_6c

    :cond_66
    move-object v5, v2

    goto :goto_6c

    :cond_68
    invoke-static {}, Lvsi;->b()Ljava/lang/String;

    move-result-object v5

    :goto_6c
    invoke-static {v5}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_46

    :cond_74
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_83

    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_82
    .catch Ljava/net/MalformedURLException; {:try_start_63 .. :try_end_82} :catch_83

    move-object v1, v3

    :catch_83
    :cond_83
    if-eqz v1, :cond_b2

    new-instance v2, Ltsi;

    invoke-direct {v2, p1, p2, p3, v1}, Ltsi;-><init>(Ljava/lang/String;ZLtn;Ljava/net/URL;)V

    iget-object p1, v0, Lvsi;->d:Ltsi;

    if-eqz p1, :cond_94

    invoke-virtual {p1, v2}, Ltsi;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_ba

    :cond_94
    invoke-virtual {v0}, Lvsi;->a()V

    iget p1, v0, Lvsi;->h:I

    const/4 p2, 0x0

    if-gtz p1, :cond_ac

    iget p1, v0, Lvsi;->b:I

    const/4 p3, 0x2

    if-eq p1, p3, :cond_ac

    if-ne p1, p0, :cond_a5

    iput p3, v0, Lvsi;->b:I

    :cond_a5
    invoke-virtual {v0, p2}, Lvsi;->c(Z)V

    invoke-virtual {v0, v2}, Lvsi;->f(Ltsi;)V

    goto :goto_ba

    :cond_ac
    iput-object v2, v0, Lvsi;->e:Ltsi;

    invoke-virtual {v0, p2}, Lvsi;->c(Z)V

    goto :goto_ba

    :cond_b2
    invoke-virtual {v0}, Lvsi;->a()V

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p3, p0}, Ltn;->L(Ljava/util/List;)V

    :cond_ba
    :goto_ba
    return-void
.end method

.method public final j()Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Ll6e;->e:Ljava/lang/String;

    if-eqz v1, :cond_18

    iget-object p0, p0, Ll6e;->i:Lwzg;

    if-eqz p0, :cond_18

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lwzg;->b(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_13

    return-object v0

    :cond_13
    invoke-static {v1}, Lcom/opera/android/browser/obml/Platform;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_18
    return-object v0
.end method

.method public final k()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ll6e;->e:Ljava/lang/String;

    return-object p0
.end method

.method public m()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public n(Lpqk;)Lh6e;
    .registers 4

    new-instance p0, Le1a;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Le1a;-><init>(Lpqk;IB)V

    return-object p0
.end method

.method public final q()V
    .registers 2

    iget-object v0, p0, Ll6e;->i:Lwzg;

    if-eqz v0, :cond_1d

    iget-object p0, p0, Ll6e;->e:Ljava/lang/String;

    if-eqz p0, :cond_1d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwzg;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcom/opera/android/browser/obml/Platform;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_1d
    return-void
.end method
