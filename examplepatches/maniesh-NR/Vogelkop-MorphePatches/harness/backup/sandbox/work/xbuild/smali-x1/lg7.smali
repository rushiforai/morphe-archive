.class public abstract Llg7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[[I

.field public static final b:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const v0, -0x101009e

    filled-new-array {v0}, [I

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [I

    filled-new-array {v0, v1}, [[I

    move-result-object v0

    sput-object v0, Llg7;->a:[[I

    const-string v0, "[\\p{Cntrl}\\\\/?*:|<>\"]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Llg7;->b:Ljava/util/regex/Pattern;

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 4

    invoke-static {p1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_10

    :try_start_6
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_10
    .catch Landroid/content/ActivityNotFoundException; {:try_start_6 .. :try_end_10} :catch_10

    :catch_10
    :cond_10
    return-void
.end method

.method public static b(Ljava/lang/String;)I
    .registers 2

    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    array-length p0, p0

    return p0
.end method

.method public static c(Landroid/content/Context;JZ)Ljava/lang/CharSequence;
    .registers 13

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_9

    const-string p0, "\u2026"

    return-object p0

    :cond_9
    const-wide/32 v0, 0x2255100

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1c

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f140a15

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long v2, v0, p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    if-eqz p3, :cond_2c

    const/high16 p0, 0x40000

    :goto_2a
    move v8, p0

    goto :goto_2e

    :cond_2c
    const/4 p0, 0x0

    goto :goto_2a

    :goto_2e
    const-wide/16 v6, 0x3e8

    invoke-static/range {v2 .. v8}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static d(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 p0, 0x0

    goto :goto_16

    :cond_e
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1}, Lrf7;->k(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/util/HashMap;

    move-result-object p0

    :goto_16
    const-string v1, "."

    const/4 v2, 0x0

    const/16 v3, 0xff

    const/16 v4, 0x7f

    if-eqz v0, :cond_4f

    invoke-static {p2}, Llg7;->b(Ljava/lang/String;)I

    move-result v5

    if-le v5, v3, :cond_4f

    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2f

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    :cond_2f
    invoke-virtual {p2, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Llg7;->b(Ljava/lang/String;)I

    move-result v5

    if-le v5, v4, :cond_41

    invoke-static {v4, p2}, Llg7;->h(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_41
    invoke-static {p2}, Llg7;->b(Ljava/lang/String;)I

    move-result v5

    rsub-int v5, v5, 0xff

    invoke-static {v5, v6}, Llg7;->h(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_4f
    if-nez p0, :cond_5f

    new-instance v5, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    goto :goto_63

    :cond_5f
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    :goto_63
    if-eqz v5, :cond_b1

    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_6f

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    :cond_6f
    invoke-virtual {p2, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Llg7;->b(Ljava/lang/String;)I

    move-result v1

    if-le v1, v4, :cond_81

    invoke-static {v4, p2}, Llg7;->h(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_81
    move-object v1, p2

    :cond_82
    add-int/lit8 v2, v2, 0x1

    const-string p2, "-"

    invoke-static {v2, p2, v1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz v0, :cond_97

    invoke-static {p2}, Llg7;->b(Ljava/lang/String;)I

    move-result v4

    rsub-int v4, v4, 0xff

    invoke-static {v4, v5}, Llg7;->h(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v5, v4

    :cond_97
    invoke-virtual {v5, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p0, :cond_ab

    new-instance v4, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    goto :goto_af

    :cond_ab
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    :goto_af
    if-nez v4, :cond_82

    :cond_b1
    return-object p2
.end method

.method public static e(Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 4

    const-string v0, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {p0, p1}, Ldd7;->f(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object p0

    goto :goto_2c

    :cond_11
    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_26

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result p1

    if-eqz p1, :cond_3a

    :cond_26
    new-instance p1, Lbkh;

    invoke-direct {p1, p0}, Lbkh;-><init>(Ljava/io/File;)V

    move-object p0, p1

    :goto_2c
    invoke-virtual {p0}, Ldd7;->d()Z

    move-result p1

    if-eqz p1, :cond_3a

    invoke-virtual {p0}, Ldd7;->b()Z

    move-result p0

    if-eqz p0, :cond_3a

    const/4 p0, 0x1

    return p0

    :cond_3a
    const/4 p0, 0x0

    return p0
.end method

.method public static f(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    .registers 9

    sget-object v0, Llg7;->b:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    instance-of v2, p0, Landroid/text/Spanned;

    if-eqz v2, :cond_3e

    move-object v2, p0

    check-cast v2, Landroid/text/Spanned;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    const-class v3, Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {v2, v4, p0, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    :goto_1d
    array-length v3, p0

    if-ge v4, v3, :cond_3e

    aget-object v3, p0, v4

    instance-of v5, v3, Landroid/text/NoCopySpan;

    if-eqz v5, :cond_3b

    invoke-interface {v2, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    aget-object v5, p0, v4

    invoke-interface {v2, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    aget-object v6, p0, v4

    invoke-interface {v2, v6}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    move-result v6

    aget-object v7, p0, v4

    invoke-virtual {v1, v7, v3, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_3b
    add-int/lit8 v4, v4, 0x1

    goto :goto_1d

    :cond_3e
    :goto_3e
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-eqz p0, :cond_52

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result p0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    const-string v3, "_"

    invoke-virtual {v1, p0, v2, v3}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_3e

    :cond_52
    return-object v1
.end method

.method public static g(Lo29;)Lkg7;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_22

    :pswitch_7
    sget-object p0, Lkg7;->f:Lkg7;

    return-object p0

    :pswitch_a
    sget-object p0, Lkg7;->n:Lkg7;

    return-object p0

    :pswitch_d
    sget-object p0, Lkg7;->i:Lkg7;

    return-object p0

    :pswitch_10
    sget-object p0, Lkg7;->k:Lkg7;

    return-object p0

    :pswitch_13
    sget-object p0, Lkg7;->m:Lkg7;

    return-object p0

    :pswitch_16
    sget-object p0, Lkg7;->l:Lkg7;

    return-object p0

    :pswitch_19
    sget-object p0, Lkg7;->j:Lkg7;

    return-object p0

    :pswitch_1c
    sget-object p0, Lkg7;->h:Lkg7;

    return-object p0

    :pswitch_1f
    sget-object p0, Lkg7;->g:Lkg7;

    return-object p0

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_1f
        :pswitch_1c
        :pswitch_1c
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
        :pswitch_7
        :pswitch_16
    .end packed-switch
.end method

.method public static h(ILjava/lang/String;)Ljava/lang/String;
    .registers 5

    :goto_0
    invoke-static {p1}, Llg7;->b(Ljava/lang/String;)I

    move-result v0

    if-le v0, p0, :cond_1e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v2

    if-eqz v2, :cond_18

    add-int/lit8 v1, v0, -0x2

    :cond_18
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1e
    return-object p1
.end method
