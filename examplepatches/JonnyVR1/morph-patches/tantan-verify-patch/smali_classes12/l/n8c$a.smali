.class Ll/n8c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n8c;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n8c;


# direct methods
.method public constructor <init>(Ll/n8c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n8c$a;->a:Ll/n8c;

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
    iget-object p1, p0, Ll/n8c$a;->a:Ll/n8c;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/n8c;->b()Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/n8c$a;->a:Ll/n8c;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
