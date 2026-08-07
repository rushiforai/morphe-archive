.class public final synthetic Ll/ifk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kfk0;

.field public final synthetic b:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Ll/kfk0;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ifk0;->a:Ll/kfk0;

    iput-object p2, p0, Ll/ifk0;->b:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ifk0;->a:Ll/kfk0;

    iget-object p0, p0, Ll/ifk0;->b:Landroid/view/View$OnClickListener;

    invoke-static {v0, p0, p1}, Ll/kfk0;->z(Ll/kfk0;Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
