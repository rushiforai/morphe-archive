.class public final synthetic Ll/lx60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/px60;


# direct methods
.method public synthetic constructor <init>(Ll/px60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lx60;->a:Ll/px60;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lx60;->a:Ll/px60;

    invoke-static {p0, p1}, Ll/px60;->k(Ll/px60;Landroid/view/View;)V

    return-void
.end method
