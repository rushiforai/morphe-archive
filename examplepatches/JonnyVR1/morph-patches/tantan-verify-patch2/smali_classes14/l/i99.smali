.class public final synthetic Ll/i99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i99;->a:Ljava/util/HashSet;

    iput-object p2, p0, Ll/i99;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i99;->a:Ljava/util/HashSet;

    iget-object p0, p0, Ll/i99;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/l99;->i3(Ljava/util/HashSet;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
