.class public abstract Lboo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lboo;->a:[Ljava/lang/String;

    const/4 v0, 0x0

    :goto_a
    const/16 v1, 0xff

    if-ge v0, v1, :cond_3c

    const/16 v1, 0x30

    if-lt v0, v1, :cond_16

    const/16 v1, 0x39

    if-le v0, v1, :cond_26

    :cond_16
    const/16 v1, 0x41

    if-lt v0, v1, :cond_1e

    const/16 v1, 0x5a

    if-le v0, v1, :cond_26

    :cond_1e
    const/16 v1, 0x61

    if-lt v0, v1, :cond_2c

    const/16 v1, 0x7a

    if-gt v0, v1, :cond_2c

    :cond_26
    iget-object v1, p0, Lboo;->a:[Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    goto :goto_38

    :cond_2c
    iget-object v1, p0, Lboo;->a:[Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    :goto_38
    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    goto :goto_a

    :cond_3c
    return-void
.end method


# virtual methods
.method public abstract a(Lsj2;)Ljava/lang/Object;
.end method

.method public b(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Labp;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Labp;-><init>(Ljava/lang/String;B)V

    :goto_b
    invoke-virtual {v1}, Labp;->f()Z

    move-result p1

    if-eqz p1, :cond_22

    invoke-virtual {p0, v1}, Lboo;->a(Lsj2;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Character;

    if-eqz p1, :cond_1d

    :goto_19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_b

    :cond_1d
    invoke-virtual {v1}, Labp;->l()Ljava/lang/Character;

    move-result-object p1

    goto :goto_19

    :cond_22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
