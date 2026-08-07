.class public final synthetic Ll/rf4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tf4;


# direct methods
.method public synthetic constructor <init>(Ll/tf4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rf4;->a:Ll/tf4;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rf4;->a:Ll/tf4;

    invoke-static {p0, p1}, Ll/tf4;->a(Ll/tf4;Landroid/view/View;)V

    return-void
.end method
