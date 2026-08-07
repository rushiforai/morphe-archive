.class public final synthetic Ll/plx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/enx;


# direct methods
.method public synthetic constructor <init>(Ll/enx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/plx;->a:Ll/enx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/plx;->a:Ll/enx;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/enx;->W0(Ll/enx;Landroid/util/Pair;)V

    return-void
.end method
