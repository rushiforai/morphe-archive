.class public final synthetic Ll/mt00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nt00$a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/nt00$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mt00;->a:Ll/nt00$a;

    iput p2, p0, Ll/mt00;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mt00;->a:Ll/nt00$a;

    iget p0, p0, Ll/mt00;->b:I

    invoke-static {v0, p0, p1}, Ll/nt00$a;->E(Ll/nt00$a;ILandroid/view/View;)V

    return-void
.end method
