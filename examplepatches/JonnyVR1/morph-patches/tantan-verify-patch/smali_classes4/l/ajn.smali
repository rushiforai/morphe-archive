.class public final synthetic Ll/ajn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fjn;


# direct methods
.method public synthetic constructor <init>(Ll/fjn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ajn;->a:Ll/fjn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajn;->a:Ll/fjn;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/fjn;->U3(Ll/fjn;Landroid/view/View;)V

    return-void
.end method
