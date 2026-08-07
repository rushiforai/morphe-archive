.class public final synthetic Ll/uny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vny;

.field public final synthetic b:Ll/boy;


# direct methods
.method public synthetic constructor <init>(Ll/vny;Ll/boy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uny;->a:Ll/vny;

    iput-object p2, p0, Ll/uny;->b:Ll/boy;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uny;->a:Ll/vny;

    iget-object p0, p0, Ll/uny;->b:Ll/boy;

    invoke-static {v0, p0, p1}, Ll/vny;->e(Ll/vny;Ll/boy;Landroid/view/View;)V

    return-void
.end method
