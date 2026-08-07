.class public Ll/jch0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jch0;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jch0;


# direct methods
.method public constructor <init>(Ll/jch0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jch0$a;->a:Ll/jch0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jch0$a;->a:Ll/jch0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/jch0$a;->a:Ll/jch0;

    .line 7
    .line 8
    invoke-static {p1}, Ll/jch0;->F(Ll/jch0;)Ll/x20;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/jch0$a;->a:Ll/jch0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/jch0;->F(Ll/jch0;)Ll/x20;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
