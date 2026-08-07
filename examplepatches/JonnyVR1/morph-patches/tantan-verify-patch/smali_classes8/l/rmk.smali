.class public final synthetic Ll/rmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bnk;

.field public final synthetic b:Ll/pej0;


# direct methods
.method public synthetic constructor <init>(Ll/bnk;Ll/pej0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rmk;->a:Ll/bnk;

    iput-object p2, p0, Ll/rmk;->b:Ll/pej0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rmk;->a:Ll/bnk;

    iget-object p0, p0, Ll/rmk;->b:Ll/pej0;

    invoke-static {v0, p0, p1}, Ll/bnk;->a(Ll/bnk;Ll/pej0;Landroid/view/View;)V

    return-void
.end method
