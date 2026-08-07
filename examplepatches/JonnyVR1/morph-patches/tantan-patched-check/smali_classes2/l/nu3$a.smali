.class Ll/nu3$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nu3;->k(Landroid/widget/ImageView;Landroid/view/View;ILandroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ll/nu3;


# direct methods
.method public constructor <init>(Ll/nu3;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nu3$a;->b:Ll/nu3;

    .line 2
    .line 3
    iput p2, p0, Ll/nu3$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nu3$a;->b:Ll/nu3;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/nu3;->l()Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/nu3$a;->b:Ll/nu3;

    .line 10
    .line 11
    invoke-static {v0}, Ll/nu3;->j(Ll/nu3;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget p0, p0, Ll/nu3$a;->a:I

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->f4(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
