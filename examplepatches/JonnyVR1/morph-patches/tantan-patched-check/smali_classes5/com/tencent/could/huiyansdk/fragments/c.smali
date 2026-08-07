.class public Lcom/tencent/could/huiyansdk/fragments/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/callback/c;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/fragments/c;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/c;->b(I)V

    return-void
.end method

.method private synthetic b(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 10
    .line 11
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_count_down_txt:I

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    new-instance v1, Ll/yvq0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/yvq0;-><init>(Lcom/tencent/could/huiyansdk/fragments/c;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
