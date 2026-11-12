.class public final Lvs8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwkn;


# instance fields
.field public final synthetic a:B

.field public final b:Lekc;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lvs8;->a:B

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lpde;

    .line 32
    sget-object v1, Lv08;->a:Lv08;

    .line 33
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 34
    iput-object v0, p0, Lvs8;->b:Lekc;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lvs8;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lbli;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lbli;-><init>(B)V

    const-string v1, "wallpaper_current"

    invoke-static {p1, v1, v0}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p1

    iput-object p1, p0, Lvs8;->b:Lekc;

    return-void
.end method

.method public constructor <init>(Lvzk;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lvs8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object p1, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance v0, Ld58;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ld58;-><init>(B)V

    invoke-static {p1, v0}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p1

    invoke-static {p1}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    iput-object p1, p0, Lvs8;->b:Lekc;

    return-void
.end method


# virtual methods
.method public final a()Lekc;
    .registers 2

    iget-byte v0, p0, Lvs8;->a:B

    iget-object p0, p0, Lvs8;->b:Lekc;

    packed-switch v0, :pswitch_data_10

    check-cast p0, Ltsd;

    return-object p0

    :pswitch_a
    check-cast p0, Lpde;

    return-object p0

    :pswitch_d
    check-cast p0, Lh42;

    return-object p0

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
