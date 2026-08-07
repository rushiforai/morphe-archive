.class public final synthetic Ll/sus;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zus;


# direct methods
.method public synthetic constructor <init>(Ll/zus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sus;->a:Ll/zus;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sus;->a:Ll/zus;

    invoke-virtual {p0, p1}, Ll/zus;->h3(Landroid/view/View;)V

    return-void
.end method
