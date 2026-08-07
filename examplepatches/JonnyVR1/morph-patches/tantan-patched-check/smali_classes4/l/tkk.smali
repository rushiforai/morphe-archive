.class public final synthetic Ll/tkk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/clk;


# direct methods
.method public synthetic constructor <init>(Ll/clk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tkk;->a:Ll/clk;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkk;->a:Ll/clk;

    invoke-static {p0, p1}, Ll/clk;->d(Ll/clk;Landroid/view/View;)V

    return-void
.end method
