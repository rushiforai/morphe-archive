.class public final Lhqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqn;


# direct methods
.method public synthetic constructor <init>(Llqn;B)V
    .registers 3

    iput-byte p2, p0, Lhqn;->a:B

    iput-object p1, p0, Lhqn;->b:Llqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Llz3;)V
    .registers 4

    iget-byte p1, p0, Lhqn;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lhqn;->b:Llqn;

    packed-switch p1, :pswitch_data_2e

    iget-object p0, p0, Llqn;->r:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v1, "ai.chats_bubble_shown"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    :pswitch_1b
    iget-object p0, p0, Llqn;->r:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v1, "ai.chats_sign_in_bubble_shown"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
