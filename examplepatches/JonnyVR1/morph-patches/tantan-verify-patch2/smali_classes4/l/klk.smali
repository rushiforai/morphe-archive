.class public final synthetic Ll/klk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mlk;


# direct methods
.method public synthetic constructor <init>(Ll/mlk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/klk;->a:Ll/mlk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/klk;->a:Ll/mlk;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/mlk;->l0(Ll/mlk;Landroid/util/Pair;)V

    return-void
.end method
