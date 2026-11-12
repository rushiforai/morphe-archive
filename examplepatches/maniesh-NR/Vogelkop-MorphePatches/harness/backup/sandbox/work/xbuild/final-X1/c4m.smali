.class public final Lc4m;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I

.field public final synthetic e:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lghf;Ljava/lang/String;ILandroid/view/View$OnClickListener;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc4m;->c:Ljava/lang/String;

    iput p3, p0, Lc4m;->d:I

    iput-object p4, p0, Lc4m;->e:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 4

    iget-object v0, p0, Lc4m;->c:Ljava/lang/String;

    const/16 v1, 0x1388

    invoke-static {p1, v0, v1}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p1

    iget v0, p0, Lc4m;->d:I

    iget-object p0, p0, Lc4m;->e:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0, p0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1
.end method
