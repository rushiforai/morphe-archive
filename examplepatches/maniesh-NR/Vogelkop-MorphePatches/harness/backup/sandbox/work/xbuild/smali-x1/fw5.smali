.class public final Lfw5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxbd;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lfw5;->a:B

    iput-object p1, p0, Lfw5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ls9i;Lk73;)V
    .registers 12

    iget-byte v0, p0, Lfw5;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lfw5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_c4

    check-cast p2, Lmfc;

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v4

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    iget-object v0, p1, Ls9i;->d:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcxj;

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v0

    invoke-virtual {v1, v4, v0}, Lcxj;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    check-cast v0, Lks3;

    iget-object v2, p2, Lmfc;->g:Ljava/lang/String;

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v5

    invoke-virtual/range {v0 .. v5}, Lks3;->K(Lcxj;Ljava/lang/String;Ljava/lang/String;II)V

    return-void

    :pswitch_2f
    check-cast p2, Lzc7;

    invoke-virtual {p1, p2}, Ls9i;->m0(Lk73;)V

    check-cast p0, Llgc;

    iget-object p2, p0, Llgc;->a:Lo5h;

    iget-object v0, p1, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Ljc9;

    iget-object v0, v0, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmgc;

    if-eqz v2, :cond_6f

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p1, Ls9i;->d:Ljava/lang/Object;

    move-object v4, p2

    check-cast v4, Lcxj;

    iget v7, v2, Lmgc;->a:I

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v8

    iget-object v3, p0, Llgc;->b:Lks3;

    iget-object p0, v3, Lks3;->i:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    const/4 p1, 0x0

    if-eqz p0, :cond_69

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_67

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    :cond_67
    check-cast p1, Ljava/lang/String;

    :cond_69
    move-object v5, p1

    iget-object v6, v2, Lmgc;->b:Ljava/lang/String;

    invoke-virtual/range {v3 .. v8}, Lks3;->K(Lcxj;Ljava/lang/String;Ljava/lang/String;II)V

    :cond_6f
    return-void

    :pswitch_70
    check-cast p2, Lnel;

    iget-object p2, p2, Lnel;->g:Ljava/lang/String;

    iget-object v0, p1, Ls9i;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lcxj;

    iget-object v0, v3, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast p0, Lgw5;

    iget-object p0, p0, Lgw5;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c3

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result p1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_95
    if-ge v1, v0, :cond_c3

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lngc;

    iget-object v2, v2, Lngc;->a:Lks3;

    sget-object v4, Lbgc;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v4, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    :goto_a7
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_95

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    add-int/2addr v6, p1

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->end()I

    move-result v7

    add-int/2addr v7, p1

    invoke-virtual/range {v2 .. v7}, Lks3;->K(Lcxj;Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_a7

    :cond_c3
    return-void

    :pswitch_data_c4
    .packed-switch 0x0
        :pswitch_70
        :pswitch_2f
    .end packed-switch
.end method
