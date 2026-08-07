.class public final synthetic Ll/uwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wwj;


# direct methods
.method public synthetic constructor <init>(Ll/wwj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uwj;->a:Ll/wwj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uwj;->a:Ll/wwj;

    invoke-static {p0, p1}, Ll/wwj;->a(Ll/wwj;Landroid/view/View;)V

    return-void
.end method
