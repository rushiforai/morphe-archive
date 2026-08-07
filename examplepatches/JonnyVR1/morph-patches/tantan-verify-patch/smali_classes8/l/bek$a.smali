.class public Ll/bek$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kqk$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bek;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Ljava/lang/CharSequence;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    iput p2, p0, Ll/bek$a;->b:I

    .line 4
    .line 5
    iput p3, p0, Ll/bek$a;->c:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ll/dek;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Ll/dek;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 21
    .line 22
    iget-object p1, p1, Ll/dek;->a:Ljava/lang/String;

    .line 23
    .line 24
    iget v2, p0, Ll/bek$a;->b:I

    .line 25
    .line 26
    iget v3, p0, Ll/bek$a;->c:I

    .line 27
    .line 28
    add-int v4, v2, v3

    .line 29
    .line 30
    add-int/lit8 v4, v4, -0x1

    .line 31
    .line 32
    add-int/2addr v2, v3

    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    add-int/2addr v2, v3

    .line 38
    invoke-virtual {v1, p1, v4, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget v1, p0, Ll/bek$a;->b:I

    .line 48
    .line 49
    iget v2, p0, Ll/bek$a;->c:I

    .line 50
    .line 51
    add-int/2addr v1, v2

    .line 52
    invoke-interface {p1, v1, v0}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    instance-of p1, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    iget-object p1, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p0, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 77
    .line 78
    new-instance v0, Ll/zdk;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/zdk;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V

    .line 81
    .line 82
    .line 83
    const-wide/16 v1, 0x64

    .line 84
    .line 85
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 86
    .line 87
    .line 88
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/bek$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 23
    .line 24
    new-instance v1, Ll/aek;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/aek;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V

    .line 27
    .line 28
    .line 29
    const-wide/16 v2, 0x64

    .line 30
    .line 31
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
