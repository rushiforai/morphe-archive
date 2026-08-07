.class public final synthetic Ll/ds40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fs40$a;


# direct methods
.method public synthetic constructor <init>(Ll/fs40$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ds40;->a:Ll/fs40$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ds40;->a:Ll/fs40$a;

    invoke-static {p0, p1}, Ll/fs40$a;->q(Ll/fs40$a;Landroid/view/View;)V

    return-void
.end method
