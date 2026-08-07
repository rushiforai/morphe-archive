.class public final synthetic Ll/jgn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/ngn0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/ngn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jgn0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/jgn0;->b:Ll/ngn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jgn0;->a:Ljava/util/List;

    iget-object p0, p0, Ll/jgn0;->b:Ll/ngn0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/ngn0;->z(Ljava/util/List;Ll/ngn0;Ljava/lang/Integer;)V

    return-void
.end method
