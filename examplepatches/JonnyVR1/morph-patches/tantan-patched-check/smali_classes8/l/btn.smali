.class public final synthetic Ll/btn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ctn;


# direct methods
.method public synthetic constructor <init>(Ll/ctn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/btn;->a:Ll/ctn;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/btn;->a:Ll/ctn;

    invoke-static {p0, p1}, Ll/ctn;->b(Ll/ctn;Landroid/view/View;)V

    return-void
.end method
