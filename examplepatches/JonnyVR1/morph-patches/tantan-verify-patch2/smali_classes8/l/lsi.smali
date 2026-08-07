.class public final synthetic Ll/lsi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rsi;


# direct methods
.method public synthetic constructor <init>(Ll/rsi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lsi;->a:Ll/rsi;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lsi;->a:Ll/rsi;

    invoke-static {p0, p1}, Ll/rsi;->e(Ll/rsi;Landroid/view/View;)V

    return-void
.end method
