.class public final synthetic Ll/blk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/clk;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/clk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/blk;->a:Ll/clk;

    iput-object p2, p0, Ll/blk;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/blk;->a:Ll/clk;

    iget-object p0, p0, Ll/blk;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/clk;->m(Ll/clk;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
