.class public final Lbml;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final l:Ldrj;


# instance fields
.field public final k:Lb59;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldrj;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ldrj;-><init>(B)V

    sput-object v0, Lbml;->l:Ldrj;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/16 v0, 0xf

    const-string v1, "thirdpartytools"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v2, 0x0

    new-array v2, v2, [Lbg1;

    invoke-static {p1, v0, v1, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lbml;->k:Lb59;

    return-void
.end method

.method public static u(Landroid/content/Context;)Lbml;
    .registers 3

    sget-object v0, Lio7;->d:Lio7;

    sget-object v1, Lbml;->l:Ldrj;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lbml;

    return-object p0
.end method

.method public static v(Lizd;)Laml;
    .registers 13

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x0

    const/4 v2, -0x1

    const-string v3, ""

    move v9, v1

    move v5, v2

    move-object v6, v3

    move-object v7, v6

    move-object v8, v7

    :goto_f
    if-ge v1, v0, :cond_7e

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v2

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    new-array v4, v4, [B

    invoke-virtual {p0, v4}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v10, Lizd;

    new-instance v11, Ljava/io/ByteArrayInputStream;

    invoke-direct {v11, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v10, v11}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 v4, 0x4c

    if-eq v2, v4, :cond_4b

    const/16 v4, 0x59

    if-eq v2, v4, :cond_37

    const/16 v4, 0x66

    if-ne v2, v4, :cond_7b

    const/4 v2, 0x1

    move v9, v2

    goto :goto_7b

    :cond_37
    invoke-virtual {v10}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    if-lez v2, :cond_7b

    invoke-virtual {v10, v2}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result v4

    if-eq v4, v2, :cond_7b

    new-instance p0, Ljava/io/EOFException;

    const-string v0, "Unexpected end of file while skipping bytes."

    invoke-direct {p0, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4b
    invoke-virtual {v10}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    invoke-virtual {v10}, Ljava/io/InputStream;->available()I

    move-result v4

    if-lez v4, :cond_69

    invoke-virtual {v10}, Lizd;->h()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Laik;->a:[Ljava/lang/String;

    if-nez v4, :cond_5f

    move-object v6, v3

    goto :goto_60

    :cond_5f
    move-object v6, v4

    :goto_60
    invoke-virtual {v10}, Lizd;->h()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_68

    move-object v7, v3

    goto :goto_69

    :cond_68
    move-object v7, v4

    :cond_69
    :goto_69
    invoke-virtual {v10}, Ljava/io/InputStream;->available()I

    move-result v4

    if-lez v4, :cond_7a

    invoke-virtual {v10}, Lizd;->h()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Laik;->a:[Ljava/lang/String;

    if-nez v4, :cond_79

    move-object v8, v3

    goto :goto_7a

    :cond_79
    move-object v8, v4

    :cond_7a
    :goto_7a
    move v5, v2

    :cond_7b
    :goto_7b
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_7e
    new-instance v4, Laml;

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Laml;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-object v4
.end method


# virtual methods
.method public final e(Lcom/opera/android/PushedContentHandler;)V
    .registers 4

    iget-object p0, p0, Lbml;->k:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 v0, 0x1

    const-string v1, "one_time_upgrade_needed"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_22

    sget-object v0, Lio7;->d:Lio7;

    invoke-virtual {p1, v0}, Lcom/opera/android/PushedContentHandler;->g(Lio7;)V

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_22
    return-void
.end method

.method public final h()Ljava/lang/Object;
    .registers 8

    new-instance v0, Laml;

    const-string v4, ""

    const/4 v6, 0x1

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, ""

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v6}, Laml;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-object v0
.end method

.method public final bridge synthetic k(Lizd;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lbml;->v(Lizd;)Laml;

    move-result-object p0

    return-object p0
.end method

.method public final m(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Laml;

    invoke-virtual {p0, p1}, Lbml;->t(Laml;)V

    return-void
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p0}, Lbml;->v(Lizd;)Laml;

    move-result-object p0

    return-object p0
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Laml;

    invoke-virtual {p0, p1}, Lbml;->t(Laml;)V

    return-void
.end method

.method public final t(Laml;)V
    .registers 6

    iget-boolean v0, p1, Laml;->f:Z

    if-nez v0, :cond_47

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lno7;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object p0

    iget v0, p1, Laml;->b:I

    iget-object v1, p0, Lm9c;->b:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    const-string v3, "min_interval"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v0, :cond_28

    invoke-static {v1, v3, v0}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    :cond_28
    iget-object v0, p1, Laml;->c:Ljava/lang/String;

    iget-object p1, p1, Laml;->d:Ljava/lang/String;

    iget-object p0, p0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "endpoint_override_hostname_new"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "endpoint_override_path_new"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_47
    return-void
.end method
