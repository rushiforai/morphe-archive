.class public final Lhga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhga;->a:B

    iput-object p1, p0, Lhga;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lhga;->a:B

    iget-object p0, p0, Lhga;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_19

    sget-object p0, Lwwc;->a:Ljava/util/Locale;

    invoke-static {p0}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :cond_19
    if-nez p0, :cond_1d

    const-string p0, ""

    :cond_1d
    invoke-static {p0}, Lwwc;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "-"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-static {p0, v0, v1, v2}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_34
    check-cast p0, Ldj9;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcj9;

    iget-object p0, p0, Lcj9;->a:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method
