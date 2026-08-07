.class public final synthetic Ll/jv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kv;


# direct methods
.method public synthetic constructor <init>(Ll/kv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jv;->a:Ll/kv;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jv;->a:Ll/kv;

    invoke-static {p0, p1}, Ll/kv;->i0(Ll/kv;Landroid/view/View;)V

    return-void
.end method
