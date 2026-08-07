.class public final synthetic Ll/z0x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/a1x;

.field public final synthetic b:Ll/oyl;


# direct methods
.method public synthetic constructor <init>(Ll/a1x;Ll/oyl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z0x;->a:Ll/a1x;

    iput-object p2, p0, Ll/z0x;->b:Ll/oyl;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z0x;->a:Ll/a1x;

    iget-object p0, p0, Ll/z0x;->b:Ll/oyl;

    invoke-static {v0, p0, p1}, Ll/a1x;->j(Ll/a1x;Ll/oyl;Landroid/view/View;)V

    return-void
.end method
