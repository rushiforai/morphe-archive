.class public final synthetic Ll/wdu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xdu;


# direct methods
.method public synthetic constructor <init>(Ll/xdu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdu;->a:Ll/xdu;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdu;->a:Ll/xdu;

    invoke-static {p0, p1}, Ll/xdu;->F(Ll/xdu;Landroid/view/View;)V

    return-void
.end method
