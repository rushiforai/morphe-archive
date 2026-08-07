.class public final synthetic Ll/kli;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lli;

.field public final synthetic b:Ll/vli;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/lli;Ll/vli;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kli;->a:Ll/lli;

    iput-object p2, p0, Ll/kli;->b:Ll/vli;

    iput p3, p0, Ll/kli;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kli;->a:Ll/lli;

    iget-object v1, p0, Ll/kli;->b:Ll/vli;

    iget p0, p0, Ll/kli;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/lli;->E(Ll/lli;Ll/vli;ILandroid/view/View;)V

    return-void
.end method
