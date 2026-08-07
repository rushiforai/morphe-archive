.class public final synthetic Ll/yml0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yml0;->a:Ll/y20;

    iput-object p2, p0, Ll/yml0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yml0;->a:Ll/y20;

    iget-object p0, p0, Ll/yml0;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/bnl0;->b(Ll/y20;Landroid/view/View;)V

    return-void
.end method
