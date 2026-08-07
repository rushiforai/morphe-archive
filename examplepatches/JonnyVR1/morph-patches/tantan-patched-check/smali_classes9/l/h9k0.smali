.class public final synthetic Ll/h9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i9k0;

.field public final synthetic b:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ll/i9k0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h9k0;->a:Ll/i9k0;

    iput-object p2, p0, Ll/h9k0;->b:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h9k0;->a:Ll/i9k0;

    iget-object p0, p0, Ll/h9k0;->b:Ll/nsv;

    invoke-static {v0, p0, p1}, Ll/i9k0;->c(Ll/i9k0;Ll/nsv;Landroid/view/View;)V

    return-void
.end method
