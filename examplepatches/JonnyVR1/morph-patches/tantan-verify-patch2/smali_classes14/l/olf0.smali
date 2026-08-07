.class public final synthetic Ll/olf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/khn;

.field public final synthetic b:Ll/plf0;


# direct methods
.method public synthetic constructor <init>(Ll/khn;Ll/plf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/olf0;->a:Ll/khn;

    iput-object p2, p0, Ll/olf0;->b:Ll/plf0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/olf0;->a:Ll/khn;

    iget-object p0, p0, Ll/olf0;->b:Ll/plf0;

    invoke-static {v0, p0, p1}, Ll/plf0;->a(Ll/khn;Ll/plf0;Landroid/view/View;)V

    return-void
.end method
