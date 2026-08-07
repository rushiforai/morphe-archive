.class public final synthetic Ll/xjk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ikk;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/ikk;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xjk;->a:Ll/ikk;

    iput-object p2, p0, Ll/xjk;->b:Ljava/util/List;

    iput-object p3, p0, Ll/xjk;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xjk;->a:Ll/ikk;

    iget-object v1, p0, Ll/xjk;->b:Ljava/util/List;

    iget-object p0, p0, Ll/xjk;->c:Ljava/util/List;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/ikk;->g0(Ll/ikk;Ljava/util/List;Ljava/util/List;Ll/uxj0;)V

    return-void
.end method
