.class public final synthetic Ll/afe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/kfe;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/kfe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/afe;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/afe;->b:Ll/kfe;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/afe;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/afe;->b:Ll/kfe;

    invoke-static {v0, p0, p1}, Ll/kfe;->L(Ljava/lang/String;Ll/kfe;Landroid/view/View;)V

    return-void
.end method
