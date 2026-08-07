.class public final synthetic Ll/n9d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/j9d0;

.field public final synthetic b:Ll/d9d0;


# direct methods
.method public synthetic constructor <init>(Ll/j9d0;Ll/d9d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n9d0;->a:Ll/j9d0;

    iput-object p2, p0, Ll/n9d0;->b:Ll/d9d0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n9d0;->a:Ll/j9d0;

    iget-object p0, p0, Ll/n9d0;->b:Ll/d9d0;

    invoke-static {v0, p0, p1}, Ll/o9d0;->c(Ll/j9d0;Ll/d9d0;Landroid/view/View;)V

    return-void
.end method
