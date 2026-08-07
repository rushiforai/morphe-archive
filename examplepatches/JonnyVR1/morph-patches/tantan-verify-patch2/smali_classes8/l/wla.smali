.class public final synthetic Ll/wla;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bma;


# direct methods
.method public synthetic constructor <init>(Ll/bma;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wla;->a:Ll/bma;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wla;->a:Ll/bma;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/bma;->h0(Ll/bma;Landroid/util/Pair;)V

    return-void
.end method
