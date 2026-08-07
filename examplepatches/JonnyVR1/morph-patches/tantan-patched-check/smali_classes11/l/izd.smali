.class public final synthetic Ll/izd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/facebook/login/DeviceAuthDialog;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/login/DeviceAuthDialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/izd;->a:Lcom/facebook/login/DeviceAuthDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/izd;->a:Lcom/facebook/login/DeviceAuthDialog;

    invoke-static {p0, p1}, Lcom/facebook/login/DeviceAuthDialog;->Y3(Lcom/facebook/login/DeviceAuthDialog;Landroid/view/View;)V

    return-void
.end method
