.class public final synthetic Ll/ilk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mlk;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mlk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ilk;->a:Ll/mlk;

    iput-object p2, p0, Ll/ilk;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ilk;->a:Ll/mlk;

    iget-object p0, p0, Ll/ilk;->b:Ljava/lang/String;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/mlk;->e0(Ll/mlk;Ljava/lang/String;Landroid/util/Pair;)V

    return-void
.end method
