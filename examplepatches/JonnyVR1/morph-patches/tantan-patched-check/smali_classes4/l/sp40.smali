.class public final synthetic Ll/sp40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/iq40;


# direct methods
.method public synthetic constructor <init>(Ll/iq40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sp40;->a:Ll/iq40;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sp40;->a:Ll/iq40;

    invoke-static {p0, p1}, Ll/iq40;->C(Ll/iq40;Landroid/view/View;)V

    return-void
.end method
