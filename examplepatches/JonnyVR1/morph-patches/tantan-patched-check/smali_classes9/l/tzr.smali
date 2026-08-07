.class public final synthetic Ll/tzr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wzr;

.field public final synthetic b:Ll/yzr;


# direct methods
.method public synthetic constructor <init>(Ll/wzr;Ll/yzr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzr;->a:Ll/wzr;

    iput-object p2, p0, Ll/tzr;->b:Ll/yzr;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tzr;->a:Ll/wzr;

    iget-object p0, p0, Ll/tzr;->b:Ll/yzr;

    invoke-static {v0, p0, p1}, Ll/wzr;->a4(Ll/wzr;Ll/yzr;Landroid/view/View;)V

    return-void
.end method
