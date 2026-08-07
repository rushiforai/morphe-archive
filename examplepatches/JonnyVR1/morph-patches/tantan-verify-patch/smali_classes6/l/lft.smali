.class public final synthetic Ll/lft;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rft;


# direct methods
.method public synthetic constructor <init>(Ll/rft;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lft;->a:Ll/rft;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lft;->a:Ll/rft;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/rft;->f(Ll/rft;Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
