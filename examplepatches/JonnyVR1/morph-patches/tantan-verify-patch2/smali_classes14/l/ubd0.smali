.class public final synthetic Ll/ubd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vbd0;

.field public final synthetic b:Ll/d9d0;


# direct methods
.method public synthetic constructor <init>(Ll/vbd0;Ll/d9d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ubd0;->a:Ll/vbd0;

    iput-object p2, p0, Ll/ubd0;->b:Ll/d9d0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ubd0;->a:Ll/vbd0;

    iget-object p0, p0, Ll/ubd0;->b:Ll/d9d0;

    invoke-static {v0, p0, p1}, Ll/vbd0;->a(Ll/vbd0;Ll/d9d0;Landroid/view/View;)V

    return-void
.end method
