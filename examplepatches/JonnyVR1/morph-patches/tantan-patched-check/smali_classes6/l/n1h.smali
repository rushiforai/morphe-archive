.class public final synthetic Ll/n1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Lv/VMaterialEdit;

.field public final synthetic c:Lv/VButton_FakeShadowSmall;

.field public final synthetic d:Lv/VMaterialEdit;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n1h;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/n1h;->b:Lv/VMaterialEdit;

    iput-object p3, p0, Ll/n1h;->c:Lv/VButton_FakeShadowSmall;

    iput-object p4, p0, Ll/n1h;->d:Lv/VMaterialEdit;

    iput-object p5, p0, Ll/n1h;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/n1h;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/n1h;->b:Lv/VMaterialEdit;

    iget-object v2, p0, Ll/n1h;->c:Lv/VButton_FakeShadowSmall;

    iget-object v3, p0, Ll/n1h;->d:Lv/VMaterialEdit;

    iget-object v4, p0, Ll/n1h;->e:Lcom/p1/mobile/android/app/Act;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/k3h;->H(Landroid/widget/TextView;Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
