.class public final synthetic Ll/crk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:[Z

.field public final synthetic c:Lv/VCheckBox;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;[ZLv/VCheckBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crk;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/crk;->b:[Z

    iput-object p3, p0, Ll/crk;->c:Lv/VCheckBox;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/crk;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/crk;->b:[Z

    iget-object p0, p0, Ll/crk;->c:Lv/VCheckBox;

    invoke-static {v0, v1, p0, p1}, Ll/qtk;->q(Landroid/widget/TextView;[ZLv/VCheckBox;Landroid/view/View;)V

    return-void
.end method
