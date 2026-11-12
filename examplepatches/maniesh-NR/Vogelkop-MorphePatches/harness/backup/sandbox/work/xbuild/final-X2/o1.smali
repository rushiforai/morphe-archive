.class public final Lo1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 14
    iput-byte p1, p0, Lo1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lo1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lo1;->c:I

    iput p2, p0, Lo1;->d:I

    iput-object p3, p0, Lo1;->b:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IIB)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lo1;->a:B

    iput-object p1, p0, Lo1;->b:Ljava/lang/String;

    iput p2, p0, Lo1;->c:I

    iput p3, p0, Lo1;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIJ)V
    .registers 7

    const/4 p4, 0x5

    iput-byte p4, p0, Lo1;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lo1;->b:Ljava/lang/String;

    .line 17
    iput p2, p0, Lo1;->d:I

    .line 18
    iput p3, p0, Lo1;->c:I

    return-void
.end method


# virtual methods
.method public final a()Lmf3;
    .registers 3

    new-instance v0, Lmf3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget v1, p0, Lo1;->c:I

    iput v1, v0, Lmf3;->a:I

    iget v1, p0, Lo1;->d:I

    iput v1, v0, Lmf3;->b:I

    iget-object p0, p0, Lo1;->b:Ljava/lang/String;

    iput-object p0, v0, Lmf3;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final b(Ljava/lang/String;)V
    .registers 8

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    invoke-static {p1, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lwqm;->c:[Ljava/lang/String;

    const/4 v2, 0x0

    move v3, v2

    :goto_c
    const/4 v4, 0x2

    if-ge v3, v4, :cond_2c

    aget-object v4, v1, v3

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_29

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "."

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2c

    move-object v0, v1

    goto :goto_2c

    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_2c
    :goto_2c
    invoke-static {p1}, Lcom/opera/android/siteicons/URLColorTable;->a(Ljava/lang/String;)Loa5;

    move-result-object p1

    iget v1, p1, Loa5;->a:I

    iput v1, p0, Lo1;->c:I

    iget p1, p1, Loa5;->b:I

    iput p1, p0, Lo1;->d:I

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_41

    const-string p1, "-"

    goto :goto_4e

    :cond_41
    const/4 p1, 0x1

    invoke-virtual {v0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    :goto_4e
    iput-object p1, p0, Lo1;->b:Ljava/lang/String;

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    iget-byte v0, p0, Lo1;->a:B

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object v0, p0, Lo1;->b:Ljava/lang/String;

    iget v1, p0, Lo1;->c:I

    iget p0, p0, Lo1;->d:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method
