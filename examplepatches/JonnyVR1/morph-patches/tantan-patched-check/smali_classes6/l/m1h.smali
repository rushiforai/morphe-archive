.class public final synthetic Ll/m1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1h;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/m1h;->b:Z

    iput-object p3, p0, Ll/m1h;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m1h;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean v1, p0, Ll/m1h;->b:Z

    iget-object p0, p0, Ll/m1h;->c:Landroid/widget/TextView;

    invoke-static {v0, v1, p0, p1}, Ll/k3h;->a0(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method
