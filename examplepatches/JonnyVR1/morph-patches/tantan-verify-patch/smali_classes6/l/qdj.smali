.class public final synthetic Ll/qdj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/il50;


# instance fields
.field public final synthetic a:Ll/rdj;


# direct methods
.method public synthetic constructor <init>(Ll/rdj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qdj;->a:Ll/rdj;

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qdj;->a:Ll/rdj;

    invoke-static {p0, p1, p2}, Ll/rdj;->o(Ll/rdj;Landroid/view/View;Ll/dgq0;)Ll/dgq0;

    move-result-object p0

    return-object p0
.end method
