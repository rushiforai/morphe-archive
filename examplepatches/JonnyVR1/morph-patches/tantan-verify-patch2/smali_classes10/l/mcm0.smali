.class public final synthetic Ll/mcm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ncm0;

.field public final synthetic b:Ll/yhn0;


# direct methods
.method public synthetic constructor <init>(Ll/ncm0;Ll/yhn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mcm0;->a:Ll/ncm0;

    iput-object p2, p0, Ll/mcm0;->b:Ll/yhn0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mcm0;->a:Ll/ncm0;

    iget-object p0, p0, Ll/mcm0;->b:Ll/yhn0;

    invoke-static {v0, p0, p1}, Ll/ncm0;->I(Ll/ncm0;Ll/yhn0;Landroid/view/View;)V

    return-void
.end method
