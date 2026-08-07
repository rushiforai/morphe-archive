.class public final synthetic Ll/s4q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/f5q0;

.field public final synthetic b:Landroid/view/View$OnClickListener;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/f5q0;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4q0;->a:Ll/f5q0;

    iput-object p2, p0, Ll/s4q0;->b:Landroid/view/View$OnClickListener;

    iput-object p3, p0, Ll/s4q0;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s4q0;->a:Ll/f5q0;

    iget-object v1, p0, Ll/s4q0;->b:Landroid/view/View$OnClickListener;

    iget-object p0, p0, Ll/s4q0;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Ll/f5q0;->E(Ll/f5q0;Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
