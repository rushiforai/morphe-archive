.class public final synthetic Le3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj1c;


# direct methods
.method public synthetic constructor <init>(Lj1c;B)V
    .registers 3

    iput-byte p2, p0, Le3l;->a:B

    iput-object p1, p0, Le3l;->b:Lj1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 6

    iget-byte v0, p0, Le3l;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    sget-object v3, Lph0;->p:Lph0;

    iget-object p0, p0, Le3l;->b:Lj1c;

    packed-switch v0, :pswitch_data_32

    iget-object v0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v3}, Lx5f;->f0(Lph0;)V

    iget-object p0, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast p0, Lyu3;

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1, v1, v2}, Lcom/opera/android/BrowserActivity;->s1(Landroid/view/View;IZ)V

    return v1

    :pswitch_1e
    iget-object v0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v3}, Lx5f;->f0(Lph0;)V

    iget-object p0, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast p0, Lyu3;

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1, v1, v2}, Lcom/opera/android/BrowserActivity;->s1(Landroid/view/View;IZ)V

    return v1

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
