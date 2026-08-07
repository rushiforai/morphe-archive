.class public final synthetic Ll/z4m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/k5m0;

.field public final synthetic b:Ll/vak0;


# direct methods
.method public synthetic constructor <init>(Ll/k5m0;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4m0;->a:Ll/k5m0;

    iput-object p2, p0, Ll/z4m0;->b:Ll/vak0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z4m0;->a:Ll/k5m0;

    iget-object p0, p0, Ll/z4m0;->b:Ll/vak0;

    invoke-static {v0, p0, p1}, Ll/k5m0;->V(Ll/k5m0;Ll/vak0;Landroid/view/View;)V

    return-void
.end method
