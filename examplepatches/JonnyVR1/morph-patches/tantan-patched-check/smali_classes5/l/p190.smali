.class public final synthetic Ll/p190;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t190;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/t190;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p190;->a:Ll/t190;

    iput-object p2, p0, Ll/p190;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p190;->a:Ll/t190;

    iget-object p0, p0, Ll/p190;->b:Ljava/util/List;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/t190;->f(Ll/t190;Ljava/util/List;Ljava/lang/Long;)V

    return-void
.end method
