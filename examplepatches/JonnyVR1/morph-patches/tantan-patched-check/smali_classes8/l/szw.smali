.class public final synthetic Ll/szw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yzw;

.field public final synthetic b:Ll/oyl;


# direct methods
.method public synthetic constructor <init>(Ll/yzw;Ll/oyl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/szw;->a:Ll/yzw;

    iput-object p2, p0, Ll/szw;->b:Ll/oyl;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/szw;->a:Ll/yzw;

    iget-object p0, p0, Ll/szw;->b:Ll/oyl;

    invoke-static {v0, p0, p1}, Ll/yzw;->e(Ll/yzw;Ll/oyl;Landroid/view/View;)V

    return-void
.end method
