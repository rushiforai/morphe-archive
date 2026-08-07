.class public final synthetic Ll/sk90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroidx/work/impl/a;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/a;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sk90;->a:Landroidx/work/impl/a;

    iput-object p2, p0, Ll/sk90;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/sk90;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sk90;->a:Landroidx/work/impl/a;

    iget-object v1, p0, Ll/sk90;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/sk90;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Landroidx/work/impl/a;->b(Landroidx/work/impl/a;Ljava/util/ArrayList;Ljava/lang/String;)Ll/mjq0;

    move-result-object p0

    return-object p0
.end method
