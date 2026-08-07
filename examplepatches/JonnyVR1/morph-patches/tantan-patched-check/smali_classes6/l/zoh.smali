.class public final synthetic Ll/zoh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fph;


# direct methods
.method public synthetic constructor <init>(Ll/fph;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zoh;->a:Ll/fph;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zoh;->a:Ll/fph;

    invoke-static {p0, p1}, Ll/fph;->r(Ll/fph;Landroid/view/View;)V

    return-void
.end method
