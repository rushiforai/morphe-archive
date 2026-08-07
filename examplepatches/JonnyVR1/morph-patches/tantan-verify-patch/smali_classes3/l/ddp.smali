.class public final synthetic Ll/ddp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/edp;

.field public final synthetic b:Ll/adp;


# direct methods
.method public synthetic constructor <init>(Ll/edp;Ll/adp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddp;->a:Ll/edp;

    iput-object p2, p0, Ll/ddp;->b:Ll/adp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ddp;->a:Ll/edp;

    iget-object p0, p0, Ll/ddp;->b:Ll/adp;

    invoke-static {v0, p0, p1}, Ll/edp;->F(Ll/edp;Ll/adp;Landroid/view/View;)V

    return-void
.end method
