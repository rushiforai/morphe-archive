.class public final synthetic Ll/w6h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# instance fields
.field public final synthetic a:Ll/x6h0;

.field public final synthetic b:Ll/x6h0$a;


# direct methods
.method public synthetic constructor <init>(Ll/x6h0;Ll/x6h0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w6h0;->a:Ll/x6h0;

    iput-object p2, p0, Ll/w6h0;->b:Ll/x6h0$a;

    return-void
.end method


# virtual methods
.method public final makeView()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w6h0;->a:Ll/x6h0;

    iget-object p0, p0, Ll/w6h0;->b:Ll/x6h0$a;

    invoke-static {v0, p0}, Ll/x6h0;->a(Ll/x6h0;Ll/x6h0$a;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
