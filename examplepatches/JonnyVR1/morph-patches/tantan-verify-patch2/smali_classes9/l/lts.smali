.class public final synthetic Ll/lts;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ats;

.field public final synthetic b:Ll/lsw$a;


# direct methods
.method public synthetic constructor <init>(Ll/ats;Ll/lsw$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lts;->a:Ll/ats;

    iput-object p2, p0, Ll/lts;->b:Ll/lsw$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lts;->a:Ll/ats;

    iget-object p0, p0, Ll/lts;->b:Ll/lsw$a;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->R(Ll/ats;Ll/lsw$a;Landroid/view/View;)V

    return-void
.end method
