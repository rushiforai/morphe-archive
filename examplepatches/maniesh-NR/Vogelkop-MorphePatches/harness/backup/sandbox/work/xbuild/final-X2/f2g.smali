.class public final synthetic Lf2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk2g;


# direct methods
.method public synthetic constructor <init>(Lk2g;B)V
    .registers 3

    iput-byte p2, p0, Lf2g;->a:B

    iput-object p1, p0, Lf2g;->b:Lk2g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lf2g;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lf2g;->b:Lk2g;

    packed-switch v0, :pswitch_data_58

    invoke-virtual {p0}, Lk2g;->b()[Lvz8;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    array-length v2, p0

    move v3, v1

    :goto_14
    if-ge v3, v2, :cond_20

    aget-object v4, p0, v3

    iget-object v4, v4, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    :cond_20
    new-array p0, v1, [Landroid/view/autofill/AutofillId;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/view/autofill/AutofillId;

    return-object p0

    :pswitch_29
    invoke-virtual {p0}, Lk2g;->b()[Lvz8;

    move-result-object p0

    array-length v0, p0

    move v2, v1

    :goto_2f
    if-ge v1, v0, :cond_3b

    aget-object v3, p0, v1

    iget-object v3, v3, Lvz8;->c:Lnf2;

    iget-byte v3, v3, Lnf2;->a:B

    or-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    :cond_3b
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_40
    invoke-virtual {p0}, Lk2g;->b()[Lvz8;

    move-result-object p0

    array-length v0, p0

    move v2, v1

    :goto_46
    if-ge v2, v0, :cond_53

    aget-object v3, p0, v2

    iget-boolean v3, v3, Lvz8;->e:Z

    if-eqz v3, :cond_50

    const/4 v1, 0x1

    goto :goto_53

    :cond_50
    add-int/lit8 v2, v2, 0x1

    goto :goto_46

    :cond_53
    :goto_53
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_40
        :pswitch_29
    .end packed-switch
.end method
