.class public final Ljs8;
.super Lk1g;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final j:Ljava/lang/Object;

.field public final k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Ljs8;->i:B

    iput-object p1, p0, Ljs8;->j:Ljava/lang/Object;

    iput-object p2, p0, Ljs8;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ls9i;Ljava/util/ArrayList;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ljs8;->i:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljs8;->j:Ljava/lang/Object;

    iput-object p1, p0, Ljs8;->k:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final C()I
    .registers 3

    iget-byte v0, p0, Ljs8;->i:B

    iget-object v1, p0, Ljs8;->k:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1c

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_e
    check-cast v1, Ld5g;

    iget p0, v1, Ld5g;->k:I

    return p0

    :pswitch_13
    iget-object p0, p0, Ljs8;->j:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method

.method public final D()I
    .registers 3

    iget-byte v0, p0, Ljs8;->i:B

    iget-object v1, p0, Ljs8;->j:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_e
    check-cast v1, Ld5g;

    iget p0, v1, Ld5g;->k:I

    return p0

    :pswitch_13
    iget-object p0, p0, Ljs8;->k:Ljava/lang/Object;

    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method

.method public final h(II)Z
    .registers 8

    iget-byte v0, p0, Ljs8;->i:B

    iget-object v1, p0, Ljs8;->k:Ljava/lang/Object;

    iget-object p0, p0, Ljs8;->j:Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_92

    return v3

    :pswitch_c
    check-cast p0, Ld5g;

    iget v0, p0, Ld5g;->h:I

    if-ne p1, v0, :cond_14

    move v0, v3

    goto :goto_15

    :cond_14
    move v0, v2

    :goto_15
    check-cast v1, Ld5g;

    iget v4, v1, Ld5g;->h:I

    if-ne p2, v4, :cond_1d

    move v4, v3

    goto :goto_1e

    :cond_1d
    move v4, v2

    :goto_1e
    if-eqz v0, :cond_41

    if-eqz v4, :cond_41

    iget-boolean p1, p0, Ld5g;->d:Z

    iget-boolean p2, v1, Ld5g;->d:Z

    if-ne p1, p2, :cond_75

    iget-boolean p1, p0, Ld5g;->e:Z

    iget-boolean p2, v1, Ld5g;->e:Z

    if-ne p1, p2, :cond_75

    iget-boolean p1, p0, Ld5g;->f:Z

    iget-boolean p2, v1, Ld5g;->f:Z

    if-ne p1, p2, :cond_75

    iget-boolean p1, p0, Ld5g;->g:Z

    iget-boolean p2, v1, Ld5g;->g:Z

    if-ne p1, p2, :cond_75

    iget-object p0, p0, Ld5g;->b:Lu3g;

    iget-object p1, v1, Ld5g;->b:Lu3g;

    if-ne p0, p1, :cond_75

    goto :goto_74

    :cond_41
    iget v0, p0, Ld5g;->i:I

    if-ne p1, v0, :cond_47

    move v0, v3

    goto :goto_48

    :cond_47
    move v0, v2

    :goto_48
    iget v4, v1, Ld5g;->i:I

    if-ne p2, v4, :cond_4e

    move v4, v3

    goto :goto_4f

    :cond_4e
    move v4, v2

    :goto_4f
    if-eqz v0, :cond_53

    if-nez v4, :cond_74

    :cond_53
    iget v0, p0, Ld5g;->j:I

    if-ne p1, v0, :cond_59

    move v0, v3

    goto :goto_5a

    :cond_59
    move v0, v2

    :goto_5a
    iget v4, v1, Ld5g;->j:I

    if-ne p2, v4, :cond_60

    move v4, v3

    goto :goto_61

    :cond_60
    move v4, v2

    :goto_61
    if-nez v0, :cond_72

    if-nez v4, :cond_75

    invoke-virtual {p0, p1}, Ld5g;->a(I)Lw3g;

    move-result-object p0

    invoke-virtual {v1, p2}, Ld5g;->a(I)Lw3g;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    goto :goto_75

    :cond_72
    if-eqz v4, :cond_75

    :cond_74
    :goto_74
    move v2, v3

    :cond_75
    :goto_75
    return v2

    :pswitch_76
    check-cast v1, Ls9i;

    iget-object v0, v1, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgyj;

    iget p1, p1, Lgyj;->a:I

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgyj;

    iget p0, p0, Lgyj;->a:I

    if-ne p1, p0, :cond_91

    move v2, v3

    :cond_91
    return v2

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_76
        :pswitch_c
    .end packed-switch
.end method

.method public final i(II)Z
    .registers 8

    iget-byte v0, p0, Ljs8;->i:B

    iget-object v1, p0, Ljs8;->k:Ljava/lang/Object;

    iget-object v2, p0, Ljs8;->j:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_94

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lldo;

    iget-object p0, p0, Lldo;->a:Ljava/lang/String;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lldo;

    iget-object p1, p1, Lldo;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_22
    check-cast v2, Ld5g;

    iget p0, v2, Ld5g;->h:I

    const/4 v0, 0x0

    const/4 v3, 0x1

    if-ne p1, p0, :cond_2c

    move p0, v3

    goto :goto_2d

    :cond_2c
    move p0, v0

    :goto_2d
    check-cast v1, Ld5g;

    iget v4, v1, Ld5g;->h:I

    if-ne p2, v4, :cond_35

    move v4, v3

    goto :goto_36

    :cond_35
    move v4, v0

    :goto_36
    if-nez p0, :cond_8b

    if-nez v4, :cond_8e

    iget p0, v2, Ld5g;->i:I

    if-ne p1, p0, :cond_40

    move p0, v3

    goto :goto_41

    :cond_40
    move p0, v0

    :goto_41
    iget v4, v1, Ld5g;->i:I

    if-ne p2, v4, :cond_47

    move v4, v3

    goto :goto_48

    :cond_47
    move v4, v0

    :goto_48
    if-nez p0, :cond_88

    if-nez v4, :cond_8e

    iget p0, v2, Ld5g;->j:I

    if-ne p1, p0, :cond_52

    move p0, v3

    goto :goto_53

    :cond_52
    move p0, v0

    :goto_53
    iget v4, v1, Ld5g;->j:I

    if-ne p2, v4, :cond_59

    move v4, v3

    goto :goto_5a

    :cond_59
    move v4, v0

    :goto_5a
    if-nez p0, :cond_85

    if-nez v4, :cond_8e

    invoke-virtual {v2, p1}, Ld5g;->a(I)Lw3g;

    move-result-object p0

    invoke-virtual {v1, p2}, Ld5g;->a(I)Lw3g;

    move-result-object p1

    iget-object p2, p0, Lw3g;->g:Ljava/lang/String;

    iget-object v1, p1, Lw3g;->g:Ljava/lang/String;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8e

    iget-object p2, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v1, p1, Lw3g;->b:Lorg/chromium/url/GURL;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8e

    iget-object p0, p0, Lw3g;->f:Ljava/lang/String;

    iget-object p1, p1, Lw3g;->f:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8e

    goto :goto_8d

    :cond_85
    if-eqz v4, :cond_8e

    goto :goto_8d

    :cond_88
    if-eqz v4, :cond_8e

    goto :goto_8d

    :cond_8b
    if-eqz v4, :cond_8e

    :goto_8d
    move v0, v3

    :cond_8e
    return v0

    :pswitch_8f
    invoke-virtual {p0, p1, p2}, Ljs8;->h(II)Z

    move-result p0

    return p0

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_8f
        :pswitch_22
    .end packed-switch
.end method
