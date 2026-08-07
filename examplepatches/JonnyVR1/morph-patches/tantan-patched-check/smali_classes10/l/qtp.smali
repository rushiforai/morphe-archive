.class public final synthetic Ll/qtp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/utp;

.field public final synthetic b:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/utp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qtp;->a:Ll/utp;

    iput-object p2, p0, Ll/qtp;->b:Ll/xup;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qtp;->a:Ll/utp;

    iget-object p0, p0, Ll/qtp;->b:Ll/xup;

    invoke-static {v0, p0, p1}, Ll/utp;->p0(Ll/utp;Ll/xup;Landroid/view/View;)V

    return-void
.end method
