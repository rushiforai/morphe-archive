.class public final synthetic Ll/anl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/anl0;->a:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/anl0;->a:Landroid/view/ViewGroup;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/bnl0;->a(Landroid/view/ViewGroup;Ljava/lang/Integer;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
