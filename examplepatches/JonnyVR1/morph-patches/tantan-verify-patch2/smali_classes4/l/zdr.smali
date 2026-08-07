.class public final synthetic Ll/zdr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/der;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/der;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zdr;->a:Ll/der;

    iput-boolean p2, p0, Ll/zdr;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zdr;->a:Ll/der;

    iget-boolean p0, p0, Ll/zdr;->b:Z

    invoke-static {v0, p0, p1}, Ll/der;->D(Ll/der;ZLandroid/view/View;)V

    return-void
.end method
