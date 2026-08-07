.class public final synthetic Ll/enb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rnb0;

.field public final synthetic b:Ll/pej0;


# direct methods
.method public synthetic constructor <init>(Ll/rnb0;Ll/pej0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/enb0;->a:Ll/rnb0;

    iput-object p2, p0, Ll/enb0;->b:Ll/pej0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/enb0;->a:Ll/rnb0;

    iget-object p0, p0, Ll/enb0;->b:Ll/pej0;

    invoke-static {v0, p0, p1}, Ll/rnb0;->u(Ll/rnb0;Ll/pej0;Landroid/view/View;)V

    return-void
.end method
