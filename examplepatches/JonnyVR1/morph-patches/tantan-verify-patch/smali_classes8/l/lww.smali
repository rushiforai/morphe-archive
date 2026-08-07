.class public final synthetic Ll/lww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public synthetic constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lww;->a:Ll/sww;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lww;->a:Ll/sww;

    invoke-static {p0, p1}, Ll/sww;->a(Ll/sww;Landroid/view/View;)V

    return-void
.end method
