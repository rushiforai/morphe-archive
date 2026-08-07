.class public final synthetic Ll/zbm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ccm0;

.field public final synthetic b:Ll/btm0;


# direct methods
.method public synthetic constructor <init>(Ll/ccm0;Ll/btm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zbm0;->a:Ll/ccm0;

    iput-object p2, p0, Ll/zbm0;->b:Ll/btm0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zbm0;->a:Ll/ccm0;

    iget-object p0, p0, Ll/zbm0;->b:Ll/btm0;

    invoke-static {v0, p0, p1}, Ll/ccm0;->G(Ll/ccm0;Ll/btm0;Landroid/view/View;)V

    return-void
.end method
