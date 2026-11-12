.class public final Lnv2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lji;

.field public final b:Lji;

.field public final c:Lg92;

.field public final d:Lji;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lji;Lji;Lg92;Lji;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnv2;->a:Lji;

    iput-object p2, p0, Lnv2;->b:Lji;

    iput-object p3, p0, Lnv2;->c:Lg92;

    iput-object p4, p0, Lnv2;->d:Lji;

    new-instance p1, Loc2;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lnv2;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lhk6;)Z
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_42

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :pswitch_c
    iget-object p0, p0, Lnv2;->d:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_19
    iget-object p0, p0, Lnv2;->c:Lg92;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_26
    iget-object p0, p0, Lnv2;->b:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_33
    const/4 p0, 0x1

    return p0

    :pswitch_35
    iget-object p0, p0, Lnv2;->a:Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_35
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_26
        :pswitch_19
        :pswitch_33
        :pswitch_33
        :pswitch_c
        :pswitch_33
    .end packed-switch
.end method
