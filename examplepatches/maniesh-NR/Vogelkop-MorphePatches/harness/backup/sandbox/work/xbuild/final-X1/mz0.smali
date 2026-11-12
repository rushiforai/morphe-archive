.class public final Lmz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final a:Lbz0;

.field public final synthetic b:Lnz0;


# direct methods
.method public constructor <init>(Lnz0;Lbz0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmz0;->b:Lnz0;

    iput-object p2, p0, Lmz0;->a:Lbz0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    sget-object p1, Lhjm;->a:Lhjm;

    iget-object v0, p0, Lmz0;->b:Lnz0;

    iput-object p1, v0, Ld63;->mDismissReason:Lhjm;

    const/4 p1, -0x3

    iget-object p0, p0, Lmz0;->a:Lbz0;

    if-eq p2, p1, :cond_1a

    const/4 p1, -0x2

    if-eq p2, p1, :cond_16

    const/4 p1, -0x1

    if-eq p2, p1, :cond_12

    return-void

    :cond_12
    invoke-virtual {v0, p0}, Lnz0;->onPositiveButtonClicked(Lbz0;)V

    return-void

    :cond_16
    invoke-virtual {v0, p0}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :cond_1a
    invoke-virtual {v0, p0}, Lnz0;->onNeutralButtonClicked(Lbz0;)V

    return-void
.end method
