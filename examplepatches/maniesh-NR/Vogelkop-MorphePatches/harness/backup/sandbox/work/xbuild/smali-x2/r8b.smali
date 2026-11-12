.class public final Lr8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Lr8b;->a:B

    iput-object p1, p0, Lr8b;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ltn;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lr8b;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lr8b;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 6

    iget-byte v0, p0, Lr8b;->a:B

    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lr8b;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_54

    check-cast p0, Landroidx/fragment/app/i;

    invoke-static {p0}, Landroidx/fragment/app/i;->access$000(Landroidx/fragment/app/i;)Landroid/app/Dialog;

    move-result-object p1

    if-eqz p1, :cond_19

    invoke-static {p0}, Landroidx/fragment/app/i;->access$000(Landroidx/fragment/app/i;)Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/fragment/app/i;->onDismiss(Landroid/content/DialogInterface;)V

    :cond_19
    return-void

    :pswitch_1a
    check-cast p0, Ltn;

    iget-boolean p1, p0, Ltn;->a:Z

    if-nez p1, :cond_33

    iput-boolean v3, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;

    iget-wide p0, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->a:J

    cmp-long v0, p0, v1

    if-eqz v0, :cond_33

    invoke-static {p0, p1}, LJ/N;->MCtaZNwj(J)V

    :cond_33
    return-void

    :pswitch_34
    check-cast p0, Ltn;

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/AlertDialog;

    if-ne v0, p1, :cond_53

    iget-boolean p1, p0, Ltn;->a:Z

    if-nez p1, :cond_53

    iput-boolean v3, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;

    iget-wide p0, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->a:J

    cmp-long v0, p0, v1

    if-eqz v0, :cond_53

    invoke-static {p0, p1}, LJ/N;->MCtaZNwj(J)V

    :cond_53
    return-void

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_34
        :pswitch_1a
    .end packed-switch
.end method
