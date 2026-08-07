.class public Ll/rl1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rl1;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rl1;


# direct methods
.method public constructor <init>(Ll/rl1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rl1$a;->a:Ll/rl1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/rl1$a;->a:Ll/rl1;

    .line 2
    .line 3
    iget-object p1, p1, Ll/rl1;->j:Lv/VCheckBox;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/rl1$a;->a:Ll/rl1;

    .line 10
    .line 11
    invoke-static {p0}, Ll/rl1;->f(Ll/rl1;)Ll/bm5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
