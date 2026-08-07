.class public final synthetic Ll/vkj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/alj0;


# direct methods
.method public synthetic constructor <init>(ZLl/alj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vkj0;->a:Z

    iput-object p2, p0, Ll/vkj0;->b:Ll/alj0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/vkj0;->a:Z

    iget-object p0, p0, Ll/vkj0;->b:Ll/alj0;

    invoke-static {v0, p0, p1}, Ll/alj0;->j(ZLl/alj0;Landroid/view/View;)V

    return-void
.end method
