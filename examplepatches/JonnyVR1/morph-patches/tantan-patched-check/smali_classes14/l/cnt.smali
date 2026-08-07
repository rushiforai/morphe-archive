.class public final synthetic Ll/cnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ent;


# direct methods
.method public synthetic constructor <init>(Ll/ent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cnt;->a:Ll/ent;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cnt;->a:Ll/ent;

    invoke-static {p0, p1}, Ll/ent;->a(Ll/ent;Landroid/view/View;)V

    return-void
.end method
