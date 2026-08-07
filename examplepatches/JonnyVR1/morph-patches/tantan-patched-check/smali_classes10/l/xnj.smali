.class public final synthetic Ll/xnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/boj;


# direct methods
.method public synthetic constructor <init>(Ll/boj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xnj;->a:Ll/boj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xnj;->a:Ll/boj;

    check-cast p1, Ll/er40;

    invoke-static {p0, p1}, Ll/boj;->o4(Ll/boj;Ll/er40;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
