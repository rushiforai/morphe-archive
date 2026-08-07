.class public final synthetic Ll/c0g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/h0g;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/h0g;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0g;->a:Ll/h0g;

    iput-object p2, p0, Ll/c0g;->b:Lcom/p1/mobile/putong/data/User;

    iput p3, p0, Ll/c0g;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c0g;->a:Ll/h0g;

    iget-object v1, p0, Ll/c0g;->b:Lcom/p1/mobile/putong/data/User;

    iget p0, p0, Ll/c0g;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/h0g;->G(Ll/h0g;Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V

    return-void
.end method
