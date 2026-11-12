.class public final synthetic Lcv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldv1;


# direct methods
.method public synthetic constructor <init>(Ldv1;B)V
    .registers 3

    iput-byte p2, p0, Lcv1;->a:B

    iput-object p1, p0, Lcv1;->b:Ldv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lcv1;->a:B

    iget-object p0, p0, Lcv1;->b:Ldv1;

    packed-switch v0, :pswitch_data_40

    check-cast p1, Lr7j;

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ldv1;->i:Lyu1;

    invoke-virtual {p0}, Lyu1;->b()Le7j;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Le7j;->c:Le7j;

    if-ne p0, v1, :cond_22

    const-string p0, "toolbar_disposition_classic"

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    invoke-virtual {v0, p1, p0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_2b

    :cond_22
    const-string p0, "toolbar_disposition_tablet"

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    invoke-virtual {v0, p1, p0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :goto_2b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2e
    check-cast p1, Lb7j;

    iget-object p0, p0, Ldv1;->i:Lyu1;

    iget-object v0, p0, Lyu1;->b:Lev1;

    iget-object v1, v0, Lev1;->b:Lb7j;

    if-eq v1, p1, :cond_3d

    iput-object p1, v0, Lev1;->b:Lb7j;

    invoke-virtual {p0}, Lyu1;->c()V

    :cond_3d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
