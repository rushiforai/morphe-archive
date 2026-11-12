.class public final synthetic Lbo4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lbo4;->a:B

    iput-object p1, p0, Lbo4;->b:Ljava/lang/Object;

    iput-object p2, p0, Lbo4;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 14

    iget-byte v0, p0, Lbo4;->a:B

    iget-object v1, p0, Lbo4;->c:Ljava/lang/Object;

    iget-object p0, p0, Lbo4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4c

    check-cast p0, Lro9;

    check-cast v1, Ltj9;

    iput p3, p0, Lro9;->b:I

    invoke-interface {v1, p3}, Ltj9;->d(I)V

    return-void

    :pswitch_13
    check-cast p0, Lco4;

    move-object v2, v1

    check-cast v2, Landroid/widget/AdapterView$OnItemClickListener;

    iget-object p0, p0, Lco4;->A:Lomd;

    check-cast p0, Ldo4;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcod;

    if-eqz p0, :cond_41

    iget-boolean v0, p0, Lcod;->g:Z

    if-eqz v0, :cond_41

    invoke-static {}, Lcom/google/android/gms/cast/framework/CastContext;->getSharedInstance()Lcom/google/android/gms/cast/framework/CastContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/CastContext;->getSessionManager()Lcom/google/android/gms/cast/framework/SessionManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/SessionManager;->getCurrentCastSession()Lcom/google/android/gms/cast/framework/CastSession;

    move-result-object v1

    if-eqz v1, :cond_3d

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/cast/framework/SessionManager;->endCurrentSession(Z)V

    :cond_3d
    iget-object p0, p0, Lcod;->c:Ljava/lang/String;

    sput-object p0, Lfr3;->i:Ljava/lang/String;

    :cond_41
    if-eqz v2, :cond_4a

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-interface/range {v2 .. v7}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_4a
    return-void

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
