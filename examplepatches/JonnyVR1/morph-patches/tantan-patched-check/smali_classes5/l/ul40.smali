.class public final synthetic Ll/ul40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wl40;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/wl40;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ul40;->a:Ll/wl40;

    iput-object p2, p0, Ll/ul40;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ul40;->a:Ll/wl40;

    iget-object p0, p0, Ll/ul40;->b:Ljava/util/List;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/wl40;->P(Ll/wl40;Ljava/util/List;Ljava/lang/Integer;)V

    return-void
.end method
