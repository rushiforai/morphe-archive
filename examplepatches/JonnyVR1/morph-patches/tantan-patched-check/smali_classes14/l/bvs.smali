.class public final synthetic Ll/bvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/zus$b;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/zus$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bvs;->a:Ll/zus$b;

    iput-object p2, p0, Ll/bvs;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bvs;->a:Ll/zus$b;

    iget-object p0, p0, Ll/bvs;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/cvs;->a(Ll/zus$b;Landroid/view/View;)V

    return-void
.end method
