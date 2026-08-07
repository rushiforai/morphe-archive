.class public final synthetic Ll/nkp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pkp;

.field public final synthetic b:Ll/f1g0;


# direct methods
.method public synthetic constructor <init>(Ll/pkp;Ll/f1g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nkp;->a:Ll/pkp;

    iput-object p2, p0, Ll/nkp;->b:Ll/f1g0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nkp;->a:Ll/pkp;

    iget-object p0, p0, Ll/nkp;->b:Ll/f1g0;

    invoke-static {v0, p0, p1}, Ll/pkp;->K(Ll/pkp;Ll/f1g0;Landroid/view/View;)V

    return-void
.end method
