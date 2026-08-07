.class public final synthetic Ll/joe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/koe;


# direct methods
.method public synthetic constructor <init>(Ll/koe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/joe;->a:Ll/koe;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/joe;->a:Ll/koe;

    invoke-static {p0, p1}, Ll/koe;->S(Ll/koe;Landroid/view/View;)V

    return-void
.end method
