.class public final synthetic Ll/rjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sjg$a;

.field public final synthetic b:Ll/coj;


# direct methods
.method public synthetic constructor <init>(Ll/sjg$a;Ll/coj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rjg;->a:Ll/sjg$a;

    iput-object p2, p0, Ll/rjg;->b:Ll/coj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rjg;->a:Ll/sjg$a;

    iget-object p0, p0, Ll/rjg;->b:Ll/coj;

    invoke-static {v0, p0, p1}, Ll/sjg$a;->E(Ll/sjg$a;Ll/coj;Landroid/view/View;)V

    return-void
.end method
