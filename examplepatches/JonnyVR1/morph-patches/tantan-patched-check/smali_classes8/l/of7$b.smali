.class public Ll/of7$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/of7;->E(Lcom/p1/mobile/android/app/Act;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bm5;

.field public final synthetic b:Ll/of7;


# direct methods
.method public constructor <init>(Ll/of7;Ll/bm5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/of7$b;->b:Ll/of7;

    .line 2
    .line 3
    iput-object p2, p0, Ll/of7$b;->a:Ll/bm5;

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
    iget-object p1, p0, Ll/of7$b;->b:Ll/of7;

    .line 2
    .line 3
    invoke-static {p1}, Ll/of7;->l(Ll/of7;)Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->j:Lv/VCheckBox;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/of7$b;->a:Ll/bm5;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
