.class public final synthetic Ll/r9j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/gaj0;


# direct methods
.method public synthetic constructor <init>(Ll/gaj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r9j0;->a:Ll/gaj0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r9j0;->a:Ll/gaj0;

    invoke-static {p0}, Ll/gaj0;->M3(Ll/gaj0;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method
