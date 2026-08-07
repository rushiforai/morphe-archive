.class public final synthetic Ll/xv80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hw80;


# direct methods
.method public synthetic constructor <init>(Ll/hw80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xv80;->a:Ll/hw80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xv80;->a:Ll/hw80;

    invoke-static {p0, p1}, Ll/hw80;->o0(Ll/hw80;Landroid/view/View;)V

    return-void
.end method
