.class public final synthetic Ll/f2i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l2i0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/l2i0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2i0;->a:Ll/l2i0;

    iput-boolean p2, p0, Ll/f2i0;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f2i0;->a:Ll/l2i0;

    iget-boolean p0, p0, Ll/f2i0;->b:Z

    invoke-static {v0, p0, p1}, Ll/l2i0;->c(Ll/l2i0;ZLandroid/view/View;)V

    return-void
.end method
