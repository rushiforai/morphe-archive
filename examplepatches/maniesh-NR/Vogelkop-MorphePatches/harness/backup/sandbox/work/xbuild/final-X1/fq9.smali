.class public final Lfq9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liq9;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmeg;Lcom/opera/android/BrowserActivity;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lfq9;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfq9;->c:Ljava/lang/Object;

    .line 12
    iput-object p2, p0, Lfq9;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lz1h;Leq9;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lfq9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfq9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfq9;->c:Ljava/lang/Object;

    return-void
.end method

.method private final a(Z)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final F(ZZ)V
    .registers 4

    iget-byte p2, p0, Lfq9;->a:B

    iget-object v0, p0, Lfq9;->b:Ljava/lang/Object;

    iget-object p0, p0, Lfq9;->c:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_28

    if-nez p1, :cond_16

    check-cast p0, Lmeg;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    invoke-virtual {p0}, Lmeg;->a()V

    :cond_16
    return-void

    :pswitch_17
    check-cast v0, Lz1h;

    check-cast p0, Leq9;

    invoke-virtual {p0}, Leq9;->c()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method

.method public final P(Z)V
    .registers 2

    iget-byte p1, p0, Lfq9;->a:B

    packed-switch p1, :pswitch_data_1a

    return-void

    :pswitch_6
    iget-object p1, p0, Lfq9;->b:Ljava/lang/Object;

    check-cast p1, Lz1h;

    iget-object p0, p0, Lfq9;->c:Ljava/lang/Object;

    check-cast p0, Leq9;

    invoke-virtual {p0}, Leq9;->c()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
