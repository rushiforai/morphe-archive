.class public final Lei2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmr8;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z


# direct methods
.method public constructor <init>(BLjava/lang/String;Z)V
    .registers 4

    packed-switch p1, :pswitch_data_1a

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lei2;->a:Ljava/lang/String;

    iput-boolean p3, p0, Lei2;->b:Z

    return-void

    :pswitch_b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p2, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lei2;->a:Ljava/lang/String;

    iput-boolean p3, p0, Lei2;->b:Z

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x2
        :pswitch_b
    .end packed-switch
.end method

.method public synthetic constructor <init>(ZLjava/lang/String;)V
    .registers 3

    .line 26
    iput-boolean p1, p0, Lei2;->b:Z

    iput-object p2, p0, Lei2;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(Lhq8;)Z
    .registers 7

    iget-object v0, p0, Lei2;->a:Ljava/lang/String;

    iget-boolean p0, p0, Lei2;->b:Z

    const/4 v1, 0x0

    if-nez p0, :cond_c

    instance-of p0, p1, Lcom/opera/android/favorites/g;

    if-eqz p0, :cond_c

    return v1

    :cond_c
    sget-object p0, Lp6l;->a:Lp6l;

    invoke-virtual {p1, p0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, v1}, Lwqm;->F(Ljava/lang/String;Z)Z

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_25

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_7b

    :cond_25
    const-string p1, "www"

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_37

    invoke-static {p0}, Lwqm;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_7b

    :cond_37
    sget-object p1, Laik;->a:[Ljava/lang/String;

    invoke-static {p0, p1}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_49

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7b

    :cond_49
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x3

    if-lt v3, v4, :cond_7f

    invoke-static {p0, p1}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x3f

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_60

    invoke-virtual {p0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_60
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_69

    new-array p0, v1, [Ljava/lang/String;

    goto :goto_6f

    :cond_69
    const-string p1, "/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    :goto_6f
    move p1, v2

    :goto_70
    array-length v3, p0

    if-ge p1, v3, :cond_7f

    aget-object v3, p0, p1

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7c

    :cond_7b
    return v2

    :cond_7c
    add-int/lit8 p1, p1, 0x1

    goto :goto_70

    :cond_7f
    return v1
.end method
