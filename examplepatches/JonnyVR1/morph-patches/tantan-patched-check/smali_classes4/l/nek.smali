.class public final synthetic Ll/nek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pek;


# direct methods
.method public synthetic constructor <init>(Ll/pek;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nek;->a:Ll/pek;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nek;->a:Ll/pek;

    invoke-static {p0, p1}, Ll/pek;->a(Ll/pek;Landroid/view/View;)V

    return-void
.end method
