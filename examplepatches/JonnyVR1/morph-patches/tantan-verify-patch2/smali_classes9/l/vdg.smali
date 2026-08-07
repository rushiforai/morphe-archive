.class public final synthetic Ll/vdg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tk2;

.field public final synthetic b:Ll/aeg;


# direct methods
.method public synthetic constructor <init>(Ll/tk2;Ll/aeg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vdg;->a:Ll/tk2;

    iput-object p2, p0, Ll/vdg;->b:Ll/aeg;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vdg;->a:Ll/tk2;

    iget-object p0, p0, Ll/vdg;->b:Ll/aeg;

    invoke-static {v0, p0, p1}, Ll/xdg;->e0(Ll/tk2;Ll/aeg;Landroid/view/View;)V

    return-void
.end method
