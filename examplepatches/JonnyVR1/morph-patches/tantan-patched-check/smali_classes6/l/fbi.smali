.class public final synthetic Ll/fbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jbi;


# direct methods
.method public synthetic constructor <init>(Ll/jbi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbi;->a:Ll/jbi;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fbi;->a:Ll/jbi;

    invoke-static {p0, p1}, Ll/jbi;->C0(Ll/jbi;Landroid/view/View;)V

    return-void
.end method
