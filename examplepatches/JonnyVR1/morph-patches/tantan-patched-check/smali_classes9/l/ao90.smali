.class public final synthetic Ll/ao90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bo90;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/bo90;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ao90;->a:Ll/bo90;

    iput-object p2, p0, Ll/ao90;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ao90;->a:Ll/bo90;

    iget-object p0, p0, Ll/ao90;->b:Ll/x20;

    invoke-static {v0, p0, p1}, Ll/bo90;->R(Ll/bo90;Ll/x20;Landroid/view/View;)V

    return-void
.end method
