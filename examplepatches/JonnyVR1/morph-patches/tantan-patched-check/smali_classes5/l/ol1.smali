.class public final synthetic Ll/ol1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rl1;


# direct methods
.method public synthetic constructor <init>(Ll/rl1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ol1;->a:Ll/rl1;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ol1;->a:Ll/rl1;

    invoke-static {p0, p1}, Ll/rl1;->e(Ll/rl1;Landroid/view/View;)V

    return-void
.end method
