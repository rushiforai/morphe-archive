.class public final synthetic Ll/k090;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b090;


# direct methods
.method public synthetic constructor <init>(Ll/b090;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k090;->a:Ll/b090;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k090;->a:Ll/b090;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultUserHeaderView;->a(Ll/b090;Landroid/view/View;)V

    return-void
.end method
