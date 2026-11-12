.class public final Llz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Lbz0;

.field public final b:B

.field public final c:Lhp2;

.field public final synthetic d:Lnz0;


# direct methods
.method public constructor <init>(Lnz0;Lbz0;ILhp2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz0;->d:Lnz0;

    iput-object p2, p0, Llz0;->a:Lbz0;

    iput-byte p3, p0, Llz0;->b:B

    iput-object p4, p0, Llz0;->c:Lhp2;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Llz0;->c:Lhp2;

    invoke-virtual {p1}, Lhp2;->a()Z

    move-result p1

    if-eqz p1, :cond_9

    return-void

    :cond_9
    iget-object p1, p0, Llz0;->d:Lnz0;

    invoke-static {p1}, Lnz0;->a(Lnz0;)Lmz0;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-byte v0, p0, Llz0;->b:B

    iget-object p0, p0, Llz0;->a:Lbz0;

    invoke-virtual {p1, p0, v0}, Lmz0;->onClick(Landroid/content/DialogInterface;I)V

    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void
.end method
