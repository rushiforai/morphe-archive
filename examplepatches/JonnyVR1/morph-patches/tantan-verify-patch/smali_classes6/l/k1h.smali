.class public final synthetic Ll/k1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VMaterialEdit;

.field public final synthetic b:Lv/VMaterialEdit;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Landroid/widget/TextView;

.field public final synthetic e:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lv/VMaterialEdit;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1h;->a:Lv/VMaterialEdit;

    iput-object p2, p0, Ll/k1h;->b:Lv/VMaterialEdit;

    iput-object p3, p0, Ll/k1h;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/k1h;->d:Landroid/widget/TextView;

    iput-object p5, p0, Ll/k1h;->e:Lcom/p1/mobile/android/app/Dialog;

    iput-object p6, p0, Ll/k1h;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/k1h;->a:Lv/VMaterialEdit;

    iget-object v1, p0, Ll/k1h;->b:Lv/VMaterialEdit;

    iget-object v2, p0, Ll/k1h;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/k1h;->d:Landroid/widget/TextView;

    iget-object v4, p0, Ll/k1h;->e:Lcom/p1/mobile/android/app/Dialog;

    iget-object v5, p0, Ll/k1h;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Ll/k3h;->k0(Lv/VMaterialEdit;Lv/VMaterialEdit;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V

    return-void
.end method
