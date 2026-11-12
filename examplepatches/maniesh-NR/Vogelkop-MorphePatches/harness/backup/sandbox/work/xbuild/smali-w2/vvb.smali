.class public final Lvvb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Luvb;


# direct methods
.method public constructor <init>([Luvb;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvvb;->a:[Luvb;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/KeyEvent;)Ldnb;
    .registers 7

    iget-object p0, p0, Lvvb;->a:[Luvb;

    array-length v0, p0

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_2c

    aget-object v2, p0, v1

    iget-object v3, v2, Luvb;->d:Ltvb;

    invoke-interface {v3}, Ltvb;->a()Z

    move-result v3

    if-eqz v3, :cond_29

    iget-byte v3, v2, Luvb;->b:B

    invoke-static {v3, p1}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    iget-byte v4, v2, Luvb;->c:B

    if-ne v3, v4, :cond_29

    iget-object p0, v2, Luvb;->d:Ltvb;

    new-instance p1, Ldnb;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Ldnb;-><init>(Ljava/lang/Object;B)V

    return-object p1

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_2c
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(I)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    if-eqz p1, :cond_73

    iget-object p0, p0, Lvvb;->a:[Luvb;

    array-length v1, p0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_73

    aget-object v3, p0, v2

    iget-object v4, v3, Luvb;->d:Ltvb;

    invoke-interface {v4}, Ltvb;->a()Z

    move-result v4

    if-eqz v4, :cond_70

    iget v4, v3, Luvb;->a:I

    if-ne v4, p1, :cond_70

    iget-byte p0, v3, Luvb;->b:B

    iget-byte p1, v3, Luvb;->c:B

    const/4 v1, 0x7

    if-lt p1, v1, :cond_2a

    const/16 v2, 0x10

    if-gt p1, v2, :cond_2a

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    sub-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_46

    :cond_2a
    const/16 v1, 0x1d

    if-lt p1, v1, :cond_45

    const/16 v1, 0x36

    if-gt p1, v1, :cond_45

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    add-int/lit8 p1, p1, 0x24

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v2, "%c"

    invoke-static {v1, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_46

    :cond_45
    move-object p1, v0

    :goto_46
    if-eqz p1, :cond_73

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    and-int/lit8 v1, p0, 0x2

    if-eqz v1, :cond_56

    const-string v1, "Ctrl"

    invoke-static {v0, v1}, Lfr3;->h(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    :cond_56
    and-int/lit8 v1, p0, 0x1

    if-eqz v1, :cond_5f

    const-string v1, "Alt"

    invoke-static {v0, v1}, Lfr3;->h(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    :cond_5f
    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_68

    const-string p0, "Shift"

    invoke-static {v0, p0}, Lfr3;->h(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    :cond_68
    invoke-static {v0, p1}, Lfr3;->h(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_70
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_73
    return-object v0
.end method
