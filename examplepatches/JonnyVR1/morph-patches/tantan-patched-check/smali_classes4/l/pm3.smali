.class public final synthetic Ll/pm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sm3;


# direct methods
.method public synthetic constructor <init>(Ll/sm3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pm3;->a:Ll/sm3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pm3;->a:Ll/sm3;

    invoke-static {p0, p1}, Ll/sm3;->b(Ll/sm3;Landroid/view/View;)V

    return-void
.end method
