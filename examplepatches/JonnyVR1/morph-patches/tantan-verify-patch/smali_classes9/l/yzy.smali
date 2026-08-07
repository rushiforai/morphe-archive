.class public final synthetic Ll/yzy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/dyy;


# direct methods
.method public synthetic constructor <init>(Ll/dyy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzy;->a:Ll/dyy;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yzy;->a:Ll/dyy;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->u(Ll/dyy;Landroid/view/View;)V

    return-void
.end method
