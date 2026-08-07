.class public final synthetic Ll/j7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/n7h;

.field public final synthetic b:Ll/jhk;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/n7h;Ll/jhk;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j7h;->a:Ll/n7h;

    iput-object p2, p0, Ll/j7h;->b:Ll/jhk;

    iput-object p3, p0, Ll/j7h;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j7h;->a:Ll/n7h;

    iget-object v1, p0, Ll/j7h;->b:Ll/jhk;

    iget-object p0, p0, Ll/j7h;->c:Ll/x20;

    invoke-static {v0, v1, p0, p1}, Ll/n7h;->d(Ll/n7h;Ll/jhk;Ll/x20;Landroid/view/View;)V

    return-void
.end method
