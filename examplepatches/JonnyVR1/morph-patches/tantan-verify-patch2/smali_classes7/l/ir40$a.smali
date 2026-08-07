.class public Ll/ir40$a;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ir40;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VCheckBox;

.field public final synthetic c:Ll/ir40;


# direct methods
.method public constructor <init>(Ll/ir40;Landroid/view/View;)V
    .locals 0
    .param p1    # Ll/ir40;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/ir40$a;->c:Ll/ir40;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/adc0;->je:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lv/VText;

    .line 13
    .line 14
    iput-object p1, p0, Ll/ir40$a;->a:Lv/VText;

    .line 15
    .line 16
    sget p1, Ll/adc0;->f1:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lv/VCheckBox;

    .line 23
    .line 24
    iput-object p1, p0, Ll/ir40$a;->b:Lv/VCheckBox;

    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic a(Ll/ir40$a;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir40$a;->a:Lv/VText;

    return-object p0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ir40$a;->a:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ir40$a;->b:Lv/VCheckBox;

    .line 9
    .line 10
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->checked:Z

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
