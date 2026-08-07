.class public final synthetic Ll/a71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b71;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/b71;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a71;->a:Ll/b71;

    iput-object p2, p0, Ll/a71;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a71;->a:Ll/b71;

    iget-object p0, p0, Ll/a71;->b:Ll/y20;

    invoke-static {v0, p0, p1}, Ll/b71;->n0(Ll/b71;Ll/y20;Landroid/view/View;)V

    return-void
.end method
