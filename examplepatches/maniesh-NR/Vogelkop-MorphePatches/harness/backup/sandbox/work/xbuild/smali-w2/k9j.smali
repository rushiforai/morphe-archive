.class public final synthetic Lk9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo9j;


# direct methods
.method public synthetic constructor <init>(Lo9j;B)V
    .registers 3

    iput-byte p2, p0, Lk9j;->a:B

    iput-object p1, p0, Lk9j;->b:Lo9j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lk9j;->a:B

    iget-object p0, p0, Lk9j;->b:Lo9j;

    check-cast p1, Ljava/lang/Void;

    packed-switch v0, :pswitch_data_3a

    iget-object p1, p0, Lo9j;->c:La21;

    iget-object p1, p1, La21;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;

    invoke-virtual {p1}, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;->x()Lpmh;

    move-result-object p1

    iget-object p1, p1, Lpmh;->a:Ly5i;

    new-instance v0, Lu4h;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lu4h;-><init>(B)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p1, v1, v2, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    const/4 p1, 0x0

    const/4 v0, 0x3

    invoke-static {p0, p1, v0}, Lo9j;->h(Lo9j;Ljava/lang/String;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29
    iget-object p1, p0, Lo9j;->c:La21;

    iget-object p1, p1, La21;->e:Ljava/lang/Object;

    check-cast p1, Lshf;

    iget-object p1, p1, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const/4 v0, 0x2

    invoke-static {p0, p1, v0}, Lo9j;->h(Lo9j;Ljava/lang/String;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
