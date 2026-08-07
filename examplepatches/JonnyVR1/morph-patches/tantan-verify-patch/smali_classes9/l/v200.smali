.class public final synthetic Ll/v200;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w200;


# direct methods
.method public synthetic constructor <init>(Ll/w200;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v200;->a:Ll/w200;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v200;->a:Ll/w200;

    invoke-virtual {p0, p1}, Ll/w200;->d(Landroid/view/View;)V

    return-void
.end method
